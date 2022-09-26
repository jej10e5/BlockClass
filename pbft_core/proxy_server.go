package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
)

type Server struct {
	url  string
	node *Node
}

func NewServer(nodeID string) *Server {
	node := NewNode(nodeID)
	server := &Server{node.NodeAddressTable[nodeID], node}
	server.setRoute()

	return server
}

func (server *Server) Start() {
	fmt.Printf("Server will be started at %s...\n", server.url)
	if err := http.ListenAndServe(server.url, nil); err != nil {
		fmt.Println(err)
		return
	}
}

func (server *Server) setRoute() {

	http.HandleFunc("/req", server.getReq) //Leader Node
	http.HandleFunc("/preprepare", server.getPrePrepare)
	http.HandleFunc("/prepare", server.getPrepare)
	http.HandleFunc("/commit", server.getCommit)
	go http.HandleFunc("/reply", server.getReply) //Leader Node ==> Http Server 주소변경

}

func (server *Server) getReq(writer http.ResponseWriter, request *http.Request) {
	var msg RequestMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}

	server.node.MsgEntrance <- &msg
}

func (server *Server) getPrePrepare(writer http.ResponseWriter, request *http.Request) { //레플리카 노드들이 리더의 PrePrepare을 받음
	var msg PrePrepareMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}

	server.node.MsgEntrance <- &msg

}

func (server *Server) getPrepare(writer http.ResponseWriter, request *http.Request) {
	var msg PrepareMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}

	server.node.MsgEntrance <- &msg

}

func (server *Server) getCommit(writer http.ResponseWriter, request *http.Request) {
	if server.node.Endpoint != Start {
		return
	}
	var msg CommitMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}

	server.node.MsgEntrance <- &msg
}

func (server *Server) getReply(writer http.ResponseWriter, request *http.Request) {
	fmt.Println("reply메세지 받음")
	var msg ReplyMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}

	if server.node.CurrentState.MsgLogs.ReqMsg.ClientID != msg.ClientID {
		return
	}

	server.node.MsgBuffer.ReplyMsgs = append(server.node.MsgBuffer.ReplyMsgs, &msg)
	fmt.Println("reply 메세지", len(server.node.MsgBuffer.ReplyMsgs))
	//server.node.Cnt++
	//fmt.Println("reply :", server.node.Cnt)
	/*
		if server.node.Cnt == 3 {
			server.node.Cnt = 0
			server.node.MsgBuffer.ReplyMsgs = make([]*ReplyMsg, 0)

			server.node.FinishChan <- true
			return

		}
	*/

}

func send(url string, msg []byte, node *Node) {

	buff := bytes.NewBuffer(msg)

	go http.Post("http://"+url, "application/json", buff)

}

func Csend(msg []byte) {

	buff := bytes.NewBuffer(msg)

	go http.Post("http://localhost:7210/addblock", "application/json", buff)

}
