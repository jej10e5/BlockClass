package main

import (
	"TX"
	"bytes"
	"encoding/gob"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	w "wallet"
)

const (
	TxsBucket = "txs"
	TxsdbFile = "t1.db"
)

type Server struct {
	url string
	txs *TX.TxsData
	//추가
}

type TxMsg struct {
	PrevTx    *TX.Tx `json:prevtx`
	PublicKey []byte `json:publickey`
}

type RefMsg struct {
	Txid string `json:txid`
	//Blcid string `json:blcid`
}

type TxId struct {
	Hash []byte `json:hash`
}

func NewServer() *Server {
	server := &Server{"localhost:7211", TX.NewTxs()} //tx server 7211
	server.setRoute()
	return server
}

func (server *Server) Start() {
	fmt.Printf("TX Server will be started at %s...\n", server.url)
	if err := http.ListenAndServe(server.url, nil); err != nil {
		fmt.Println(err)
		return
	}
}

func (server *Server) setRoute() {
	//go http.HandleFunc("/test", server.test)       //test함수입니다.
	go http.HandleFunc("/tx/new", server.getNewTx) //새로운 tx 생성
	go http.HandleFunc("/tx/txs", server.getTxs)   //txs관리

}
func (server *Server) getNewTx(writer http.ResponseWriter, request *http.Request) {
	var msg TxMsg
	var buf bytes.Buffer

	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}
	//fmt.Printf("[받은 데이터] 보내는이: %s, 받는이: %s, 상품: %s, 가격: %d\n", msg.From, msg.To, msg.Item, msg.Price)
	nt := msg.PrevTx
	//지갑검증
	if w.ValidateAddress(string(nt.From), msg.PublicKey) {
		//tx검증
		if nt.ValidateTx(msg.PublicKey) {
			server.txs.AddTx(nt)
			fmt.Printf("txid: %x", nt.Hash)

			encoder := gob.NewEncoder(&buf)

			err := encoder.Encode(nt)

			if err != nil {
				log.Panic(err)
			}

			writer.Write(buf.Bytes())
		} else {
			fmt.Println("tx 검증실패")
		}
	} else {
		fmt.Println("지갑 검증 실패")
	}

}

func (server *Server) test(writer http.ResponseWriter, request *http.Request) {
	fmt.Println("TX server")
}

func (server *Server) getTxs(writer http.ResponseWriter, request *http.Request) {
	var msg RefMsg
	var rmsg *TX.Tx
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
	}
	id, _ := hex.DecodeString(msg.Txid)
	fmt.Printf("\ntxid: %x\n", id)
	rmsg = server.txs.FindTx(id)
	fmt.Println(string(rmsg.Item))
	jrmsg, _ := json.MarshalIndent(rmsg, "", " ")
	writer.Write(jrmsg)

}

//호출함수
func send(url string, msg []byte) {
	http.Post("http://"+url, "application/json", bytes.NewBuffer(msg))
}

//호출 및 결과값 받는 함수
func sendAndReturn(url string, msg []byte) ([]byte, error) {
	req, err := http.NewRequest("POST", "http://"+url, bytes.NewBuffer(msg))
	if err != nil {
		return []byte{}, err
	}
	req.Close = true
	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("Connection", "close")
	tr := &http.Transport{DisableKeepAlives: true}
	client := &http.Client{Transport: tr}
	resp, err := client.Do(req)
	if err != nil {
		return []byte{}, err
	}
	defer resp.Body.Close()
	respBody, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return []byte{}, err
	}
	data := make([]byte, len(respBody))
	copy(data, respBody[:])
	return data, err
}
