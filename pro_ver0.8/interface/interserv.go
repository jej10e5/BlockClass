package main

/*
	거래생성, 블록/잔고/트랜잭션 조회, 충전기능을 구현하는 서버입니다.
	interface의 역할흘 하며 각 기능에 따른 서버로 연결해주는 역할을 합니다.

	예시) 거래생성
			1. 거래에 필요한 정보를 restfulapi로부터 받기 및 어떤 요청인지 route path하기
				-> 받은 내용이 '거래생성'일 경우
			2. blc server로 '블록생성'요청
				(blc server -> tx server : '트랜잭션생성' 요청)
				(blc server <- tx server : '트랜잭션id' 반환)
			3. blc server로 부터 블록id 받기
			4. restfulapi로 전달
			(괄호친 부분은 각 서버에서 처리합니다.)
*/
import (
	"BLC"
	"TX"
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

type Server struct {
	url string
	//필요한거 추가하기
}
type TxMsg struct {
	PrevTx    *TX.Tx `json:prevtx`
	PublicKey []byte `json:publickey`
}
type RefMsg struct {
	Txid string `json:txid`
	// Blcid string `json:blcid`
}

type ReffMsg struct {
	Blcid string `json:blcid`
}
type BTMsg struct {
	Tx *TX.Tx `json:tx`
	// Block *BLC.Block `json:block`
}

type BTTMsg struct {
	Block *BLC.Block `json:block`
}

type Block struct {
	Hash          []byte `json:"Hash"`
	PrevBlockHash []byte `json:"PrevBlockHash"`
	Timestamp     int64  `json:"Timestamp"`
	Pow           []byte `json:"Pow"`
	Nonce         int    `json:"Nonce"`
	Bit           int64  `json:"Bit"`
	Txs           []byte `json:"Txs"` //txid
	Height        int    `json:"Height"`
}

func NewServer() *Server {
	server := &Server{"localhost:7200"} //interface server 7200
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

//interface api구현
func (server *Server) setRoute() {
	//	go http.HandleFunc("/test", server.test) //테스트함수입니다.

	go http.HandleFunc("/newtx", server.genNewBlc) //tx 생성
	//go http.HandleFunc("/refacc", server.test)     //잔고조회
	go http.HandleFunc("/reftx", server.getTx)   //tx조회
	go http.HandleFunc("/refBlc", server.getBlc) // blc 조회
	//go http.HandleFunc("/charge", server.test)     //충전
	go http.HandleFunc("/getblc", server.getNewBlc)
}

func (server *Server) getTx(writer http.ResponseWriter, request *http.Request) {
	var msg RefMsg
	var rmsg BTMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}
	jr, _ := json.MarshalIndent(msg, "", " ")
	fmt.Printf("받는 데이터 Tx :%s", msg.Txid)
	//jt,_:=sendAndReturn("localhost:7210/blockChain",jr)
	jt, _ := sendAndReturn("localhost:7210/blockChainTx", jr)
	json.Unmarshal(jt, &rmsg)
	// fmt.Printf("블록id : %x\n", rmsg.Block.Hash)
	fmt.Printf("tx id : %x\n", rmsg.Tx.Hash)
	writer.Write(jt)
}
func (server *Server) getBlc(writer http.ResponseWriter, request *http.Request) {
	var msg ReffMsg
	var rmsg BTTMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}
	jr, _ := json.MarshalIndent(msg, "", " ")
	fmt.Printf("받는 데이터 blc: %s", msg.Blcid)
	jt, _ := sendAndReturn("localhost:7210/blockChainBlc", jr)
	json.Unmarshal(jt, &rmsg)
	fmt.Printf("블록 id : %x\n", rmsg.Block.Hash)
	writer.Write(jt)
}

func (server *Server) getNewBlc(writer http.ResponseWriter, request *http.Request) {
	var msg map[string][]byte
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}
	//fmt.Printf("보내는이: %s, 받는이: %s, 상품: %s, 가격: %d\n", msg.From, msg.To, msg.Item, msg.Price)
	jmsg, _ := json.MarshalIndent(msg, "", " ")
	send("localhost:7000/getBlc", jmsg)
	//var m map[string][]byte

	//fmt.Printf("블록아이디: %x\n", m["b"])
	//fmt.Printf("tx아이디: %x\n", m["tx"])
}

func (server *Server) genNewBlc(writer http.ResponseWriter, request *http.Request) {
	//fmt.Println("인터페이스 서버입니다.")
	var msg TxMsg
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}

	jmsg, _ := json.MarshalIndent(msg, "", " ")
	send("localhost:7210/block", jmsg)
	//fmt.Printf("블록아이디: %x\n", m["b"])
	//fmt.Printf("tx아이디: %x\n", m["tx"])
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
