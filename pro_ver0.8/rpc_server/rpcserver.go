package main

import (
	"fmt"
	"log"
	"net"
	"net/rpc"
	"os"
	w "wallet"
)

//로그
var logFile *log.Logger = GetlogFile()

func GetlogFile() *log.Logger {
	f, _ := os.OpenFile("rpc.log", os.O_CREATE|os.O_WRONLY, os.FileMode(0644))
	defer f.Close()

	return log.New(f, "[INFO]", log.LstdFlags)
}

type Rpcserv int //Rpc서버 등록하기 위한 타입

type Args struct { //지갑생성시 별명
	Alias string
}

type Reply struct { //리턴값
	User *w.Wallet
}

func (r *Rpcserv) CreatWallet(args Args, reply *Reply) error {
	//TODO
	//gob.Register(elliptic.P256())
	nw := w.NewWallet(args.Alias) //새 지갑 생성

	if w.ValidateAddress(nw.GetAddress(), nw.PublicKey) { //지갑 검증하기
		reply.User = nw
		fmt.Println("지갑생성성공")
		return nil
	} else {
		fmt.Println("지갑생성실패, 다시 시도하세요")
		return nil
	}
}

//TODO
//wallet 관리하기

func main() {
	//gob.Register(elliptic.P256())
	rpc.Register(new(Rpcserv)) //Rpc타입의 인스턴스 생성하여 RPC서버로 등록
	ln, err := net.Listen("tcp", ":7100")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer ln.Close()

	for {
		conn, err := ln.Accept()
		if err != nil {
			continue
		}

		defer conn.Close()
		go rpc.ServeConn(conn)
	}

}
