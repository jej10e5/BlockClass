package main

import (
	"encoding/json"
	"fmt"
)

type Msg struct {
	MsgBuffer   *MsgBuffer
	MsgEntrance chan interface{}
	MsgDelivery chan interface{}
}

type MsgBuffer struct {
	TxMsg []*TxMsg
}

func NewMsg() *Msg {
	msg := &Msg{
		MsgBuffer: &MsgBuffer{
			TxMsg: make([]*TxMsg, 0),
		},
		MsgEntrance: make(chan interface{}),
		MsgDelivery: make(chan interface{}),
	}

	go msg.dispatchMsg()
	go msg.resolveMsg()
	return msg
}

func (msg *Msg) dispatchMsg() {
	for {
		select {
		case msgs := <-msg.MsgEntrance:
			err := msg.routeMsg(msgs)
			if err != nil {
				fmt.Println(err)
				// TODO: send err to ErrorChannel
			}

		}
	}
}

func (msg *Msg) routeMsg(msgs interface{}) error {
	switch msgs.(type) {
	case *TxMsg:
		m := make([]*TxMsg, len(msg.MsgBuffer.TxMsg))
		copy(m, msg.MsgBuffer.TxMsg)
		m = append(m, msgs.(*TxMsg))
		msg.MsgDelivery <- m
	}
	return nil
}

func (msg *Msg) resolveMsg() {
	msgs := <-msg.MsgDelivery
	switch msgs.(type) {
	case []*TxMsg:
		jsonMsg, _ := json.Marshal(msgs.([]*TxMsg))
		send("localhost:7200/newtx", jsonMsg)
	}
}
