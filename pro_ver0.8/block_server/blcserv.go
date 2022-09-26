package main

import (
	"BLC"
	"TX"
	"bytes"
	"encoding/gob"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"time"
	"strconv"
	"github.com/boltdb/bolt"
)

const (
	BlocksBucket = "blocks"
	dbFile       = "b1.db"
)

type Server struct {
	url string
	blc *BLC.Blockchain
	b   *BLC.Block
	tx  []byte
	blcc chan int
	cnt int
	//req *Req
}
type Blockchain struct {
	Db  *bolt.DB
	End []byte
}

type Tx struct {
	Hash      []byte `json:"txId"`
	Timestamp int64  `json:"timestamp"`
	From      []byte `json:"from"`
	To        []byte `json:"to"`
	Item      []byte `json:"item"`
	Price     int    `json:"price"`
	Nonce     int    `json:"nonce"`
	Sig       []byte `json:"sig"`
}

type Block struct {
	Hash          []byte `json:"Hash"`
	PrevBlockHash []byte `json:"PrevBlockHash"`
	Timestamp     int64  `json:"Timestamp"`
	Pow           []byte `json:"Pow"`
	Nonce         int    `json:"Nonce"`
	Bit           int64  `json:"Bit"`
	Txs           []byte `json:"Txs"` //Txid
	Height        int    `json:"Height"`
}
type PbftMsg struct {
	Timestamp int64  `json:"timestamp"`
	Result    string `json:"result"`
}
type RequestMsg struct {
	Timestamp  int64  `json:"timestamp"`
	ClientID   string `json:"clientID"`
	Blockbytes []byte `json:"blockbytes"`
	SequenceID int64  `json:"sequenceID"`
}
type RefMsg struct {
	Txid string `json:txid`
	//Blcid string `json:blcid`
}
type ReffMsg struct {
	Blcid string `json:blcid`
}
type TxMsg struct {
	PrevTx    *TX.Tx `json:prevtx`
	PublicKey []byte `json:publickey`
}
type BTMsg struct {
	Tx *TX.Tx `json:tx`
	// Block *BLC.Block `json:block`
}
type BTTMsg struct {
	Block *BLC.Block `json:block`
}
type TxId struct {
	Hash []byte `json:hash`
}

func NewServer() *Server {
	//req := NewRequest()
	//server := &Server{":7210", req}
	server := &Server{"localhost:7210", BLC.NewBlockchain(), &BLC.Block{}, []byte{}, make(chan int),0}
	//	server.blc.Db.Close()
	server.setRoute()
	return server
}

func (server *Server) Start() {
	fmt.Printf("Block Server Start %s...\n", server.url)
	if err := http.ListenAndServe(server.url, nil); err != nil {
		fmt.Println(err)
		return
	}
}


func (server *Server) setRoute() {
	http.HandleFunc("/blocktest", server.getBlockClient)                 //test
	http.HandleFunc("/block", server.getBlock)                 //create block
	http.HandleFunc("/addblock", server.getChainingBlock)      //chaining block
	http.HandleFunc("/blockChainTx", server.getBlockChainTx)   //control blockchainTx
	http.HandleFunc("/blockChainBlc", server.getBlockChainBlc) //control bockchainBlc
}

func (server *Server) getBlockChainBlc(writer http.ResponseWriter, request *http.Request) {
	var msg ReffMsg
	var blc *BLC.Block // 블록정보
	var rmsg BTTMsg    // 보내는 데이터
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
	}
	//블록 찾는부분
	id, _ := hex.DecodeString(msg.Blcid)
	fmt.Printf("block id: %x\n", id)
	blc = server.blc.FindBlc(id) //블록 반환도 함(지금은 출력용도)

	rmsg.Block = blc
	fmt.Printf("blc id: %x\n", rmsg.Block.Hash)
	jm, _ := json.MarshalIndent(rmsg, "", " ") //블록데이터 반환 -> interface서버
	writer.Write(jm)

}
func (server *Server) getBlockChainTx(writer http.ResponseWriter, request *http.Request) {
	var msg RefMsg //받는 데이터 Tx id
	// var blc *BLC.Block //블록정보
	var tx *TX.Tx  //tx정보
	var rmsg BTMsg //보내는 데이터
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
	}
	/*
		//블록찾는부분
		id, _ := hex.DecodeString(msg.Blcid)
		fmt.Printf("block id: %x\n", id)
		blc = server.blc.FindBlc(id) //블록 반환도 함(지금은 출력용도)
	*/
	//tx생성 정보 넘기기 -> tx서버
	jr, _ := json.MarshalIndent(msg, "", " ")
	jtx, _ := sendAndReturn("localhost:7211/tx/txs", jr) //tx데이터 반환받음<-tx서버
	json.Unmarshal(jtx, &tx)
	rmsg.Tx = tx
	//rmsg.Block = blc
	//fmt.Printf("blc id: %x\n", rmsg.Block.Hash)
	fmt.Printf("tx id: %x\n", rmsg.Tx.Hash)
	jm, _ := json.MarshalIndent(rmsg, "", " ") //tx데이터와 블록데이터 반환 -> interface서버
	writer.Write(jm)

}

func (server *Server) getChainingBlock(writer http.ResponseWriter, request *http.Request) {
	var msg []*RequestMsg
	bc := server.blc
	end:=bc.End
	// b := server.b
	//주석풀어야함
	//tx := server.tx
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err,1)
		return
	}
	for i:=0;i<100;i++{
		b:=BLC.DeserializeBlock(msg[i].Blockbytes)
		if bytes.Equal(end,b.PrevBlockHash){
			
			bc.ChainingBlock(b) //체이닝
			
			//bc.List()
			b.Bprint()
			end=b.Hash

			// fmt.Printf("tx id: %x\n", b.Txs)
			// fmt.Printf("blc id: %x\n", b.Hash)
			// fmt.Printf("확인blc id: %x\n", nb)

			//주석풀어야함******************
			// m := map[string][]byte{"tx": tx, "b": b.Hash}
			// jm, _ := json.Marshal(m)
			//send("localhost:7200/getblc", jm)
			//tx = []byte{}
			//********************************
			//fmt.Println("interface에 보내기 성공")

		}else{
			fmt.Println("blc chaining error")
		}
	}
	

}


func (server *Server) getBlockClient(writer http.ResponseWriter, request *http.Request) {
		var msg string
		err := json.NewDecoder(request.Body).Decode(&msg)
		if err != nil {
			fmt.Println(err)
			return
		}

		bc := server.blc
		bend:=bc.End
		bh:=bc.FindHeight()
		for i:=0;i<1000;i++{
			nb:=BLC.NewBlock([]byte{},bend,bh+i)
			//server.b = bc.AddBlock([]byte{})
			bytesa := nb.Serialize()
			timestamp := time.Now().UTC().Unix()
			clientId:="id"+strconv.Itoa(i)
			pdata := &RequestMsg{timestamp, clientId, bytesa, 1000000}
			bend=nb.Hash //prev hash
			jpdata, _ := json.Marshal(pdata)
			buff := bytes.NewBuffer(jpdata)
			url:="localhost:5000/req"
			http.Post("http://"+url, "application/json", buff)

	}
		//server.cnt++

}


func (server *Server) getBlock(writer http.ResponseWriter, request *http.Request) {
	var msg TxMsg
	var buf bytes.Buffer
	var tx *TX.Tx

	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}
	jmsg, _ := json.MarshalIndent(msg, "", " ")
	a, _ := sendAndReturn("localhost:7211/tx/new", jmsg) //txid를 받음
	fmt.Printf("%x\n", a)
	server.tx = a
	buf.Write(a)

	decoder := gob.NewDecoder(&buf)
	erra := decoder.Decode(&tx)

	if erra != nil {
		log.Panic(err)
	}
	bc := server.blc
	server.b = bc.AddBlock(tx.Hash)
	bytesa := server.b.Serialize()
	timestamp := time.Now().UTC().Unix()
	pdata := &RequestMsg{timestamp, "test", bytesa, 10000}
	jpdata, _ := json.Marshal(pdata)
	send("localhost:5000/req", jpdata)

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

	fmt.Println(resp.Body)

	if err != nil {
		return []byte{}, err
	}
	data := make([]byte, len(respBody))
	copy(data, respBody[:])
	return data, err
}
