package main

type PBFT interface {
	StartConsensus(request *RequestMsg) (*PrePrepareMsg, error)
	PrePrepare(prePrepareMsg *PrePrepareMsg) (*PrepareMsg, error)
	Prepare(prepareMsg *PrepareMsg) (*CommitMsg, error)
	Commit(commitMsg *CommitMsg) (*ReplyMsg, *RequestMsg, error)
}
