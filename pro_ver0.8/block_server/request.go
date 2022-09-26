package main

// import "fmt"

// type Req struct {
// 	MsgCreate  chan interface{}
// 	MsgControl chan interface{}
// 	Data       string
// }

// func NewRequest() *Req {
// 	req := &Req{
// 		MsgCreate:  make(chan interface{}),
// 		MsgControl: make(chan interface{}),
// 		Data:       "",
// 	}

// 	go req.dispatchMsg()
// 	go req.resolveMsg()

// 	return req

// }

// func (req *Req) dispatchMsg() {
// 	for {
// 		select {
// 		case msg := <-req.MsgCreate:
// 			err := req.createBlock(msg)
// 			if err != nil {
// 				fmt.Println(err)
// 				// TODO: send err to ErrorChannel
// 			}
// 		case msg := <-req.MsgControl:
// 			err := req.controlBlockChain(msg)
// 			if err != nil {
// 				fmt.Println(err)
// 				// TODO: send err to ErrorChannel
// 			}
// 		}
// 	}
// }

// func (req *Req) createBlock(msg interface{}) []error{
// 	switch msg.(type){

// 	}
// }

// func (req *Req) resolveMsg() {

// }
