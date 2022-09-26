package main

import (
	"BLC"
	"bytes"
	"encoding/hex"
	"encoding/json"
	"errors"
	"fmt"
	"sync"
	"time"
)

var mutex = new(sync.Mutex)

type Node struct {
	NodeID           string
	NodeAddressTable map[string]string // key=nodeID, value=url
	View             *View
	CurrentState     *State
	CommittedMsgs    []*RequestMsg // kinda block.
	MsgBuffer        *MsgBuffer
	MsgEntrance      chan interface{}
	//	MsgDelivery      chan interface{}
	RequestChan chan RequestChan
	PrePreChan  chan PrePreChan
	PrepareChan chan PrepareChan
	CommitChan  chan CommitChan
	ReplMsgChan chan ReplMsgChan
	FinishChan  chan bool
	Alarm       chan bool
	Done        chan bool
	Prereply    chan bool
	Endpoint    Point
	Wg          *sync.WaitGroup
	Cnt         int
}

type MsgBuffer struct {
	ReqMsgs        []*RequestMsg
	PrePrepareMsgs []*PrePrepareMsg
	PrepareMsgs    []*PrepareMsg
	CommitMsgs     []*CommitMsg
	ReplyMsgs      []*ReplyMsg
}

type View struct {
	ID      int64
	Primary string
}
type Error struct {
}
type Point int

const (
	Start Point = iota
	End
)
const ResolvingTimeDuration = time.Millisecond * 100 // 1 second.

//
// cmd> exe 5000 [enter] <---- 5000 = nodeID

func (node *Node) Initnode() bool {
	//node.Endpoint = Start

	node.Cnt = 0
	node.MsgBuffer.PrePrepareMsgs = make([]*PrePrepareMsg, 0)
	node.MsgBuffer.PrepareMsgs = make([]*PrepareMsg, 0)
	node.MsgBuffer.CommitMsgs = make([]*CommitMsg, 0)
	node.MsgBuffer.ReplyMsgs = make([]*ReplyMsg, 0)
	node.CurrentState = nil

	return true
}

func NewNode(nodeID string) *Node {
	const viewID = 10000000000 // temporary.

	node := &Node{
		// Hard-coded for test.
		NodeID: nodeID,
		NodeAddressTable: map[string]string{
			"P1": "localhost:5000",
			"P2": "localhost:5001",
			"P3": "localhost:4000",
			"P4": "localhost:4001",
		},
		View: &View{
			ID:      viewID,
			Primary: "P1",
		},

		// Consensus-related struct
		CurrentState:  nil,
		CommittedMsgs: make([]*RequestMsg, 0),
		MsgBuffer: &MsgBuffer{
			ReqMsgs:        make([]*RequestMsg, 0),
			PrePrepareMsgs: make([]*PrePrepareMsg, 0),
			PrepareMsgs:    make([]*PrepareMsg, 0),
			CommitMsgs:     make([]*CommitMsg, 0),
			ReplyMsgs:      make([]*ReplyMsg, 0),
		},

		// Channels
		MsgEntrance: make(chan interface{}, 1),
		//MsgDelivery: make(chan interface{}, 2),
		RequestChan: make(chan RequestChan, 10),
		PrePreChan:  make(chan PrePreChan, 1),
		PrepareChan: make(chan PrepareChan, 3),
		CommitChan:  make(chan CommitChan, 3),
		ReplMsgChan: make(chan ReplMsgChan, 3),

		Alarm:      make(chan bool, 1),
		Done:       make(chan bool, 1),
		Prereply:   make(chan bool, 1),
		FinishChan: make(chan bool, 1),
		// endpoint
		Endpoint: End,

		Wg:  new(sync.WaitGroup),
		Cnt: 0,
	}

	// Start message dispatcher
	go node.dispatchMsg()

	// Start alarm trigger
	go node.alarmToDispatcher()

	// Start message resolver
	go node.resolveMsg()

	return node
}

func (node *Node) VerifyBlc(request *RequestMsg) error {
	var pb *BLC.Block
	var b *BLC.Block
	prev := node.CommittedMsgs[len(node.CommittedMsgs)-1].Blockbytes
	pb = BLC.DeserializeBlock(prev)
	b = BLC.DeserializeBlock(request.Blockbytes)

	if bytes.Equal(pb.Hash, b.PrevBlockHash) {
		return nil
	} else {
		h1 := hex.EncodeToString(pb.Hash)
		h2 := hex.EncodeToString(pb.PrevBlockHash)
		p1 := hex.EncodeToString(b.Hash)
		p2 := hex.EncodeToString(b.PrevBlockHash)
		return errors.New("block 검증 실패 preb:" + h1 + " , " + h2 + "/ b:" + p1 + " , " + p2)
	}
}

func (node *Node) Broadcast(msg interface{}, path string) map[string]error {
	errorMap := make(map[string]error)
	for nodeID, url := range node.NodeAddressTable { //포트alias랑 포트 번호 ex) {"P1"  : "5000"}
		if nodeID == node.NodeID { //자기 자신 제외하고 전체

			continue
		}

		jsonMsg, err := json.Marshal(msg)
		if err != nil {
			errorMap[nodeID] = err
			continue

		}
		go send(url+path, jsonMsg, node)

	}
	if len(errorMap) == 0 {
		return nil
	} else {
		return errorMap
	}
}

func (node *Node) Reply(msg *ReplyMsg) error {
	// Print all committed messages.
	jsonMsg, err := json.Marshal(msg)
	if err != nil {
		return err
	}

	// Client가 없으므로, 일단 Primary에게 보내는 걸로 처리.

	//send("node.NodeAddressTable[node.View.Primary]"+"/reply", jsonMsg, node)
	send("localhost:7210"+"/reply", jsonMsg, node)
	return nil
}
func (node *Node) CReply(msg *ReplyMsg) error {
	// Print all committed messages.
	jsonMsg, err := json.Marshal(msg)
	if err != nil {
		return err
	}

	send(node.NodeAddressTable[node.View.Primary]+"/reply", jsonMsg, node)
	return nil
}

// GetReq can be called when the node's CurrentState is nil.
// Consensus start procedure for the Primary.
func (node *Node) GetReq(reqMsg *RequestMsg) error { // 클라이언트로부터 요청을 받음
	//node.Endpoint = Start
	LogMsg(reqMsg)

	err := node.createStateForNewConsensus()
	if err != nil {
		return err
	}

	// Start the consensus process.
	prePrepareMsg, err := node.CurrentState.StartConsensus(reqMsg)
	if err != nil {
		return err
	}

	if len(node.CommittedMsgs) != 0 {
		errb := node.VerifyBlc(reqMsg)
		if errb != nil {
			return errb
		}
	}
	LogStage(fmt.Sprintf("Consensus Process (ViewID:%d)", node.CurrentState.ViewID), false)

	// Send getPrePrepare message
	if prePrepareMsg != nil {
		node.Broadcast(prePrepareMsg, "/preprepare")

		LogStage("Pre-prepare", true)

	}
	return nil
}

// GetPrePrepare can be called when the node's CurrentState is nil.
// Consensus start procedure for normal participants.
func (node *Node) GetPrePrepare(prePrepareMsg *PrePrepareMsg) error {

	LogMsg(prePrepareMsg)

	// Create a new state for the new
	err := node.createStateForNewConsensus()
	if err != nil {
		return err
	}

	prePareMsg, err := node.CurrentState.PrePrepare(prePrepareMsg)
	if err != nil {
		return err
	}
	if len(node.CommittedMsgs) != 0 {
		errb := node.VerifyBlc(reqMsg)
		if errb != nil {
			return errb
		}
	}

	if prePareMsg != nil {
		// Attach node ID to the message
		prePareMsg.NodeID = node.NodeID
		LogStage("Pre-prepare", true)
		node.Broadcast(prePareMsg, "/prepare")
		LogStage("Prepare", false)

	}

	go func() {
		for _, msg := range node.MsgBuffer.PrepareMsgs {
			node.CurrentState.CurrentStage = PrePrepared
			node.PrepareChan <- PrepareChan{msg}
		}
		node.MsgBuffer.PrepareMsgs = make([]*PrepareMsg, 0)
	}()

	return nil
}

func (node *Node) GetPrepare(prepareMsg *PrepareMsg) error {
	if node.Endpoint == End {
		return nil
	}

	if node.CurrentState != nil && node.CurrentState.CurrentStage != PrePrepared {
		return nil
	}
	//fmt.Println("GetPrepare시 stage :", node.CurrentState.CurrentStage)
	LogMsg(prepareMsg)

	commitMsg, err := node.CurrentState.Prepare(prepareMsg)
	if err != nil {
		return err
	}

	if commitMsg != nil {
		// Attach node ID to the message
		commitMsg.NodeID = node.NodeID

		LogStage("Prepare", true)
		node.Broadcast(commitMsg, "/commit")

		LogStage("Commit", false)

	}
	if node.CurrentState != nil && node.CurrentState.CurrentStage == Prepared {

		go func() {
			if len(node.MsgBuffer.CommitMsgs) == 0 {
				return
			}
			//msg := node.MsgBuffer.CommitMsgs[0]
			//node.MsgBuffer.CommitMsgs = node.MsgBuffer.CommitMsgs[1:]

			//node.CommitChan <- CommitChan{msg}
			node.Done <- true
		}()

	}
	if len(node.MsgBuffer.PrepareMsgs) != 0 {
		rmsg := node.MsgBuffer.PrepareMsgs[0]

		node.MsgBuffer.PrepareMsgs = node.MsgBuffer.PrepareMsgs[1:]

		node.PrepareChan <- PrepareChan{rmsg}

	}
	return nil
}

func (node *Node) GetCommit(commitMsg *CommitMsg) error {
	if node.Endpoint == End {
		return nil
	}

	if node.CurrentState != nil && node.CurrentState.CurrentStage != Prepared {
		return nil
	}

	LogMsg(commitMsg)
	replyMsg, committedMsg, _ := node.CurrentState.Commit(commitMsg)

	if replyMsg != nil {
		if committedMsg == nil {
			return nil
		}

		// Attach node ID to the message
		replyMsg.NodeID = node.NodeID

		// Save the last version of committed messages to node.
		node.CommittedMsgs = append(node.CommittedMsgs, committedMsg)
		LogStage("Commit", true)
		node.Reply(replyMsg)
		LogStage("Reply", true)
		node.Endpoint = End
		if node.NodeID != node.View.Primary {
			if node.Initnode() {
				node.CReply(replyMsg)
			}

		} else {
			for {
				if len(node.MsgBuffer.ReplyMsgs) == 3 {
					msg, _ := json.MarshalIndent(replyMsg, "", " ")
					send("localhost:7210/addblock", msg, node)
					node.MsgBuffer.ReplyMsgs = make([]*ReplyMsg, 0)
					break
				}
			}
			node.FinishChan <- true
		}
	}

	if node.CurrentState != nil && node.CurrentState.CurrentStage != Committed {
		node.Done <- true
	}

	return nil
}

func (node *Node) createStateForNewConsensus() error { //
	// Check if there is an ongoing consensus process.
	if node.CurrentState != nil {
		return nil
	}

	// Get the last sequence ID
	var lastSequenceID int64
	if len(node.CommittedMsgs) == 0 {
		lastSequenceID = -1
	} else {
		lastSequenceID = node.CommittedMsgs[len(node.CommittedMsgs)-1].SequenceID
	}

	// Create a new state for this new consensus process in the Primary
	node.CurrentState = CreateState(node.View.ID, lastSequenceID)

	LogStage("Create the replica status", true)

	return nil
}

func (node *Node) dispatchMsg() { // 메세지를 받는부분
	for {

		select {
		case msg := <-node.MsgEntrance:

			err := node.routeMsg(msg)
			if err != nil {
				fmt.Println(err)
				// TODO: send err to ErrorChannel
			}
		case <-node.Alarm: //finish
			//node.Initnode()
			err := node.routeMsgWhenAlarmed()
			if err != nil {
				fmt.Println(err)
				// TODO: send err to ErrorChannel
			}
		case <-node.Prereply:
			node.routeCommitmsg()
		}
	}

}

func (node *Node) routeMsg(msg interface{}) []error {

	switch msg.(type) {
	case *RequestMsg:
		node.Endpoint = Start
		var rmsg *RequestMsg
		if node.CurrentState == nil { //리더노드의 상태가 nil일경우

			if len(node.MsgBuffer.ReqMsgs) != 0 {

				node.MsgBuffer.ReqMsgs = append(node.MsgBuffer.ReqMsgs, msg.(*RequestMsg))

				//rmsg = node.MsgBuffer.ReqMsgs[0]

				//node.MsgBuffer.ReqMsgs = node.MsgBuffer.ReqMsgs[1:]

			} else {
				rmsg = msg.(*RequestMsg)

				node.RequestChan <- RequestChan{rmsg}
			}

		} else {

			node.MsgBuffer.ReqMsgs = append(node.MsgBuffer.ReqMsgs, msg.(*RequestMsg))

		}

	case *PrePrepareMsg:
		//node.Initnode()
		node.Endpoint = Start
		var rmsg *PrePrepareMsg
		if node.CurrentState == nil {
			if len(node.MsgBuffer.PrePrepareMsgs) != 0 {
				rmsg = node.MsgBuffer.PrePrepareMsgs[0]

				node.MsgBuffer.ReqMsgs = node.MsgBuffer.ReqMsgs[1:]
			} else {
				rmsg = msg.(*PrePrepareMsg)
			}
			// Send messages.

			node.PrePreChan <- PrePreChan{rmsg}

		} else {
			node.MsgBuffer.PrePrepareMsgs = append(node.MsgBuffer.PrePrepareMsgs, msg.(*PrePrepareMsg))
		}

	case *PrepareMsg:
		var rmsg *PrepareMsg

		if node.CurrentState == nil || node.CurrentState.CurrentStage != PrePrepared {

			node.MsgBuffer.PrepareMsgs = append(node.MsgBuffer.PrepareMsgs, msg.(*PrepareMsg))

		} else {

			if len(node.MsgBuffer.PrepareMsgs) == 0 {
				rmsg = msg.(*PrepareMsg)
				node.PrepareChan <- PrepareChan{rmsg}
			} else if len(node.MsgBuffer.PrepareMsgs) < 3 {
				node.MsgBuffer.PrepareMsgs = append(node.MsgBuffer.PrepareMsgs, msg.(*PrepareMsg))
				rmsg = node.MsgBuffer.PrepareMsgs[0]

				node.MsgBuffer.PrepareMsgs = node.MsgBuffer.PrepareMsgs[1:]
				node.PrepareChan <- PrepareChan{rmsg}
			}

		}

	case *CommitMsg:
		//var rmsg *CommitMsg
		if node.NodeID == node.View.Primary {
			var rmsg *CommitMsg
			if node.CurrentState == nil || node.CurrentState.CurrentStage != Prepared { // PrePared상태가 아닐 경우
				mutex.Lock()
				node.MsgBuffer.CommitMsgs = append(node.MsgBuffer.CommitMsgs, msg.(*CommitMsg)) //Commit메세지 버퍼에 저장
				mutex.Unlock()
			} else {

				if len(node.MsgBuffer.CommitMsgs) == 0 {
					//node.MsgBuffer.CommitMsgs = append(node.MsgBuffer.CommitMsgs, msg.(*CommitMsg))
					rmsg = msg.(*CommitMsg)
					node.CommitChan <- CommitChan{rmsg}
				} else {

					mutex.Lock()
					node.MsgBuffer.CommitMsgs = append(node.MsgBuffer.CommitMsgs, msg.(*CommitMsg))
					mutex.Unlock()
					//rmsg = node.MsgBuffer.CommitMsgs[0]

					//node.MsgBuffer.CommitMsgs = node.MsgBuffer.CommitMsgs[1:]
					//node.CommitChan <- CommitChan{rmsg}
				}

			}

		} else {
			if node.CurrentState == nil || node.CurrentState.CurrentStage != Prepared { // PrePared상태가 아닐 경우
				mutex.Lock()
				node.MsgBuffer.CommitMsgs = append(node.MsgBuffer.CommitMsgs, msg.(*CommitMsg)) //Commit메세지 버퍼에 저장
				mutex.Unlock()
			} else {

				if len(node.MsgBuffer.CommitMsgs) == 0 {

					rmsg := msg.(*CommitMsg)
					node.CommitChan <- CommitChan{rmsg}
				} else if len(node.MsgBuffer.CommitMsgs) < 3 {
					mutex.Lock()
					node.MsgBuffer.CommitMsgs = append(node.MsgBuffer.CommitMsgs, msg.(*CommitMsg))
					mutex.Unlock()
					//		rmsg = node.MsgBuffer.CommitMsgs[0]

					//		node.MsgBuffer.CommitMsgs = node.MsgBuffer.CommitMsgs[1:]
					//	node.CommitChan <- CommitChan{rmsg}
				}

			}
		}
	}

	return nil

}
func (node *Node) routeCommitmsg() {
	if len(node.MsgBuffer.CommitMsgs) != 0 {
		if node.Endpoint != End {
			rmsg := node.MsgBuffer.CommitMsgs[0]
			mutex.Lock()
			node.MsgBuffer.CommitMsgs = node.MsgBuffer.CommitMsgs[1:]
			mutex.Unlock()
			node.resolveCommitMsg(rmsg)
			//node.CommitChan <- CommitChan{rmsg}
		}
	}
}
func (node *Node) routeMsgWhenAlarmed() []error { //특정 시간마다 ex) 1초  트리거 하는 함수
	/*
		if node.Endpoint == End {
			node.Initnode()
		}
	*/
	if node.CurrentState == nil { //노드 상태가 nil 즉 초기일때
		// Check ReqMsgs, send them.
		if len(node.MsgBuffer.ReqMsgs) != 0 { //ReqMsgs 가 0이 아니면  즉   버퍼가 routemsg를 처리하지 못하였을경우?
			fmt.Println("새로운 합의시작")
			node.Endpoint = Start
			msg := node.MsgBuffer.ReqMsgs[0]
			node.MsgBuffer.ReqMsgs = node.MsgBuffer.ReqMsgs[1:]
			node.resolveRequestMsg(msg)
		}
	}
	return nil
}

func (node *Node) resolveMsg() {

	for {
		select {
		case msg := <-node.RequestChan:
			err := node.resolveRequestMsg(msg.RequestMsg)
			if err != nil {
				fmt.Println(err)
			}

		case msg := <-node.PrePreChan:

			err := node.resolvePrePrepareMsg(msg.PrePrepareMsg)
			if err != nil {
				fmt.Println(err)
			}

		case msg := <-node.PrepareChan:
			err := node.resolvePrepareMsg(msg.PrepareMsg)
			if err != nil {
				fmt.Println(err)
			}
		case msg := <-node.CommitChan:
			err := node.resolveCommitMsg(msg.CommitMsg)
			if err != nil {
				fmt.Println(err)
			}

		}

	}
}

func (node *Node) alarmToDispatcher() {

	for {
		select {
		case <-node.FinishChan: //finish
			if node.Initnode() {
				fmt.Println("새로운 합의 준비 ")
				node.Alarm <- true
			}
		case <-node.Done:
			fmt.Println("Commitmsg 처리")
			node.Prereply <- true

		}
	}
	//

}

func (node *Node) resolveRequestMsg(msgs *RequestMsg) error { //func (node *Node) resolveRequestMsg(msgs []*RequestMsg) []error {

	err := node.GetReq(msgs)
	if err != nil {
		return err
	}

	return nil
}

func (node *Node) resolvePrePrepareMsg(msgs *PrePrepareMsg) error {

	// Resolve messages

	err := node.GetPrePrepare(msgs)
	if err != nil {
		return err
	}

	return nil
}

func (node *Node) resolvePrepareMsg(msgs *PrepareMsg) error {
	//errs := make([]error, 0)

	// Resolve messages
	err := node.GetPrepare(msgs)
	if err != nil {
		return err
	}

	/*
		for _, prepareMsg := range msgs {

			err := node.GetPrepare(prepareMsg)

			if err != nil {
				errs = append(errs, err)
			}

		}

		if len(errs) != 0 {
			return errs
		}
	*/
	return nil
}

func (node *Node) resolveCommitMsg(msgs *CommitMsg) error {
	//errs := make([]error, 0)

	// Resolve messages

	err := node.GetCommit(msgs)
	if err != nil {
		return err
	}
	/*
		for _, commitMsg := range msgs {
			err := node.GetCommit(commitMsg)

			if err != nil {
				errs = append(errs, err)

			}

		}

		if len(errs) != 0 {
			return errs
		}
	*/
	return nil
}
