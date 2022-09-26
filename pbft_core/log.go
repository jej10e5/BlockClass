package main

import (
	"fmt"
)

func LogMsg(msg interface{}) {
	switch msg.(type) {
	case *RequestMsg:
		reqMsg := msg.(*RequestMsg)
		fmt.Printf("[REQUEST] ClientID: %s, Timestamp: %d, Blockbytes: %s\n", reqMsg.ClientID, reqMsg.Timestamp, reqMsg.Blockbytes)
	case *PrePrepareMsg:
		prePrepareMsg := msg.(*PrePrepareMsg)
		fmt.Printf("[PREPREPARE] ClientID: %s, Blockbytes: %s, SequenceID: %d\n", prePrepareMsg.RequestMsg.ClientID, prePrepareMsg.RequestMsg.Blockbytes, prePrepareMsg.SequenceID)
	case *PrepareMsg:
		voteMsg := msg.(*PrepareMsg)
		fmt.Printf("[PREPARE] NodeID: %s\n", voteMsg.NodeID)
	case *CommitMsg:
		voteMsg := msg.(*CommitMsg)
		fmt.Printf("[COMMIT] NodeID: %s\n", voteMsg.NodeID)
	}
}

func LogStage(stage string, isDone bool) {
	if isDone {
		fmt.Printf("[STAGE-DONE] %s\n", stage)
	} else {
		fmt.Printf("[STAGE-BEGIN] %s\n", stage)
	}
}
