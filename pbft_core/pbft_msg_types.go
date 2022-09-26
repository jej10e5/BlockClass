package main

type RequestMsg struct {
	Timestamp  int64  `json:"timestamp"`
	ClientID   string `json:"clientID"`
	Blockbytes string `json:"Blockbytes"`
	SequenceID int64  `json:"sequenceID"`
}

type RequestChan struct {
	*RequestMsg
}

type ReplyMsg struct {
	ViewID    int64  `json:"viewID"`
	Timestamp int64  `json:"timestamp"`
	ClientID  string `json:"clientID"`
	NodeID    string `json:"nodeID"`
	Result    string `json:"result"`
}

type ReplMsgChan struct {
	*ReplyMsg
}

type PrePrepareMsg struct {
	ViewID     int64       `json:"viewID"`
	SequenceID int64       `json:"sequenceID"`
	Digest     string      `json:"digest"`
	RequestMsg *RequestMsg `json:"requestMsg"`
}

type PrePreChan struct {
	*PrePrepareMsg
}

type PrepareMsg struct {
	ViewID     int64  `json:"viewID"`
	SequenceID int64  `json:"sequenceID"`
	Digest     string `json:"digest"`
	NodeID     string `json:"nodeID"`
}
type PrepareChan struct {
	*PrepareMsg
}
type CommitMsg struct {
	ViewID     int64  `json:"viewID"`
	SequenceID int64  `json:"sequenceID"`
	Digest     string `json:"digest"`
	NodeID     string `json:"nodeID"`
}
type CommitChan struct {
	*CommitMsg
}
