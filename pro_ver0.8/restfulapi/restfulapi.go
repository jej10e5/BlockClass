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
	"net/rpc"
	"os"
	"strconv"
	"time"
	w "wallet"
)

type Server struct {
	url string
	ws  *w.Wallets
	msg *Msg
	c   chan *TxReply
	//api *Api
}

//rpc
type Reply struct {
	User *w.Wallet
}
type Args struct {
	Alias string
}

//

// 6/30추가
type TxMsg struct {
	PrevTx    *TX.Tx `json:prevtx`
	PublicKey []byte `json:publickey`
}

//

type WebTxMsg struct {
	Jhs string `json:jhs` // Hash
	Jfs string `json:jfs` // From
	Jts string `json:jts` // To
	Jis string `json:jis` // Item
	Jss string `json:jss` // Sig
	//추가
	Jtp string `json:jtp` //timestamp
	Jpr int    `json:jpr` //price
}

type WebBlcMsg struct {
	Bjhs  string `json:bjhs`  // Block Hash
	Bpjhs string `json:bpjhs` // Block PreHash
	Bjps  string `json:bjps`  // BLock Pow
	Bjts  string `json:bjts`  // Block Tx Id
	Bht   int    `json:bht`   //height
	Btp   string `json:btp`   //timestamp
}

type TxInfo struct {
	From  string `json:from`
	To    string `json:to`
	Item  string `json:item`
	Price int    `json:price`
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
	//Block *BLC.Block `json:block`
}

type BTTMsg struct {
	Block *BLC.Block `json:block`
}
type Alias struct {
	SessionId string `json:"sessionId"`
}
type TxReply struct {
	TxFrom    string `json:"txfrom"`
	Txid      string `json:"txid"`
	Blcid     string `json:"blcid"`
	Buyeracc  string `json:"bacc"`
	Selleracc string `json:"sacc"`
	TxTo      string `json:"txto"`
	TxTime    string `json:"txtime"`
	TxItem    string `json:"txitem"`
	TxPrice   int    `json:"txprice"`
	TxSig     string `json:"txsig"`
}
type WalMsg struct {
	Adr  string `json:"adr"`
	PK   string `json:"pk"`
	Id   string `json:"id"`
	Time string `json:"time"`
	// acc  int    `json:"acc"`
}

func NewServer() *Server {
	msg := NewMsg()
	server := &Server{"localhost:7000", w.GetWallets(), msg, make(chan *TxReply, 1)}
	//w := server.ws.FindWallet("14vnL14FNhRSVRtjkV5kb3ZaArgEE1uh1E")
	//fmt.Println(hex.EncodeToString(w.PublicKey))
	//map 사용할때는 make()로 초기화해야 사용할수있습니다.

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

//웹서비스 -> RestfulApi -> 해당하는 요청에 따른 route path
//						 -> 해당서버이동 -> 해당하는 요청에 따른 route path -> 해당하는 메서드
//						<- 결과 json파일
func (server *Server) setRoute() {
	// http.HandleFunc("/genKeyPair", server.getKeyPair) //key생성
	//go http.HandleFunc("/test", server.test)                 //wallet생성
	go http.HandleFunc("/createWallet", server.getNewWallet) //wallet생성
	go http.HandleFunc("/newtx", server.resolveNewTx)        //new tx
	go http.HandleFunc("/getBlc", server.getBlc)
	go http.HandleFunc("/reftx", server.resolveRefTx)
	go http.HandleFunc("/refBlc", server.resolveRefBlc)

}

//resftulapi->interface->block->tx->block
func (server *Server) resolveNewTx(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "application/json")
	writer.Header().Set("Access-Control-Allow-Origin", "*")
	writer.Header().Set("Access-Control-Allow-Headers", "Content-Type,access-control-allow-origin, access-control-allow-headers")
	var msg TxInfo
	var omsg TxMsg
	//var rmsg TxReply
	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}
	omsg.PrevTx = TX.NewTx(msg.From, msg.To, msg.Item, msg.Price)
	w := server.ws.FindWallet(msg.From) //구매자지갑
	omsg.PrevTx.Sign(w)                 //sign추가
	omsg.PublicKey = w.PublicKey        //publickey첨부
	jmsg, _ := json.MarshalIndent(omsg, "", " ")
	send("localhost:7200/newtx", jmsg) //interface
	rmsg := <-server.c
	fmt.Println(rmsg.Buyeracc)
	jr, _ := json.MarshalIndent(rmsg, "", " ")
	writer.Write(jr)
	var check *TxReply
	json.Unmarshal(jr, &check)
	fmt.Println("확인:", check.Buyeracc) //struct field명은 대문자로 시작해야 public이여서 접근가능
	fmt.Println("확인:", check.Blcid)
}

// newtx랑 연결됨->pbft->block->interface->restfulapi
func (server *Server) getBlc(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "application/json")
	writer.Header().Set("Access-Control-Allow-Origin", "*")
	writer.Header().Set("Access-Control-Allow-Headers", "Content-Type,access-control-allow-origin, access-control-allow-headers")
	var msg map[string][]byte
	var buf bytes.Buffer
	var tx *TX.Tx
	//var txm *TxReply

	err := json.NewDecoder(request.Body).Decode(&msg)
	if err != nil {
		fmt.Println(err)
		return
	}
	buf.Write(msg["tx"]) //트랜잭션 ID -> 트랜잭션 전체로 변경    07/06
	decoder := gob.NewDecoder(&buf)

	erra := decoder.Decode(&tx)
	if erra != nil {
		log.Panic(err)
	}
	txid := hex.EncodeToString(tx.Hash)
	blcid := hex.EncodeToString(msg["b"])
	txSig := hex.EncodeToString(tx.Sig)
	txTime := time.Unix(tx.Timestamp, 0).UTC().String()
	//txTime := time.Unix(tx.Timestamp, 64).Format(time.UTC.String())
	// unitTimeInRFC3339 :=unixTimeUTC.Format(time.RFC3339)
	fmt.Println(txTime)
	buyeracc, selleracc := server.getBalance(tx)

	txm := TxReply{Buyeracc: buyeracc, Selleracc: selleracc, Blcid: blcid, Txid: txid, TxFrom: string(tx.From), TxTo: string(tx.To), TxTime: txTime, TxItem: string(tx.Item), TxPrice: tx.Price, TxSig: txSig}
	//reply, _ := json.MarshalIndent(txm, "", " ")
	//buff := bytes.NewBuffer(reply)
	fmt.Printf("구매자 계좌: %s\n", buyeracc)
	fmt.Printf("판매자 계좌: %s\n", selleracc)
	fmt.Printf("tx아이디: %x\n", tx.Hash)
	fmt.Printf("blc아이디: %x\n", msg["b"])

	//send("localhost:8080/ClassProject1/mainForm.do", reply)
	server.c <- &txm

	// req, err := http.NewRequest("POST", "http://localhost:8080/ClassProject1/mainForm.do", buff)
	// if err != nil {
	// 	fmt.Println(err.Error())
	// 	os.Exit(0)
	// }

	// client := &http.Client{}
	// client.Do(req)
	//send("localhost:8080/ClassProject1/mainForm.do", reply)

}
func (server *Server) getBalance(tx *TX.Tx) (a, b string) {
	ws := server.ws
	// cnt := 0
	// for range ws.Wallets {
	// 	cnt++
	// }
	// if cnt == 1 {
	// 	ws.Wallets["class365"].Account = 100000000
	// }
	buyer := server.ws.FindWallet(string(tx.From))
	buyer.Account -= int64(tx.Price)

	seller := server.ws.FindWallet(string(tx.To))
	seller.Account += int64(tx.Price)

	jws, _ := json.MarshalIndent(ws, "", "  ")                 //ws를 json으로 변환
	ioutil.WriteFile("./wallets.json", jws, os.FileMode(0644)) //이미 파일이 있다면 덮어씌움
	return strconv.FormatInt(buyer.Account, 10), strconv.FormatInt(seller.Account, 10)
}

/*
func (server *Server) getKeyPair(writer http.ResponseWriter, request *http.Request) {
	gob.Register(elliptic.P256())
	client, err := rpc.Dial("tcp", "127.0.0.1:6000") //rpc서버 포트
	if err != nil {
		fmt.Println(err)
		return
	}
	defer client.Close()

	args := &Args{alias.SessionId}
	reply := new(Reply)
	err = client.Call("Rpcserv.CreatWallet", args, reply) //지갑 통째로 반환
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Printf("지갑주소 : %s\n", reply.User.Address)
}
*/
func (server *Server) getNewWallet(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "application/json")
	writer.Header().Set("Access-Control-Allow-Origin", "*")
	writer.Header().Set("Access-Control-Allow-Headers", "Content-Type,access-control-allow-origin, access-control-allow-headers")
	//gob.Register(elliptic.P256())
	wset := server.ws
	client, err := rpc.Dial("tcp", "127.0.0.1:7100") //rpc서버 포트
	if err != nil {
		fmt.Println(err)
		return
	}
	defer client.Close()

	//웹서비스 사용자가 지갑 생성 sessionId json으로 받아와서 alias에 입력
	var alias Alias
	jerr := json.NewDecoder(request.Body).Decode(&alias)
	if err != nil {
		fmt.Println(jerr)
		return
	}

	args := &Args{alias.SessionId}
	reply := new(Reply)
	err = client.Call("Rpcserv.CreatWallet", args, reply) //지갑 통째로 반환
	if err != nil {
		fmt.Println(err)
		return
	}
	wset.AddWallet(reply.User)
	wset.WalletJson()

	//추가
	var msg WalMsg
	msg.Adr = reply.User.GetAddress()
	w := server.ws.FindWallet(msg.Adr)
	msg.PK = hex.EncodeToString(w.PrivateKey)
	msg.Id = reply.User.Alias
	msg.Time = time.Unix(reply.User.Timestamp, 64).Format(time.UTC.String())
	jmsg, _ := json.MarshalIndent(msg, "", " ")
	writer.Write(jmsg)
	// _, werr := wset.WalletJson()
	// if werr != nil {
	// 	fmt.Println(werr)
	// 	return
	// }
	// //sendAndReturn("localhost:7001/test", jws)
	fmt.Printf("pk: %s\n", msg.PK)
	fmt.Printf("지갑주소: %s\n", reply.User.GetAddress())
	fmt.Println("지갑생성완료!")

}

func (server *Server) test(writer http.ResponseWriter, request *http.Request) {
	var ws w.Wallets
	//gob.Register(elliptic.P256())
	jerr := json.NewDecoder(request.Body).Decode(&ws)
	if jerr != nil {
		fmt.Println(jerr)
		return
	}
	fmt.Println("test")
	fmt.Println(ws)
}

func (server *Server) resolveRefTx(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "application/json")
	writer.Header().Set("Access-Control-Allow-Origin", "*")
	writer.Header().Set("Access-Control-Allow-Headers", "Content-Type,access-control-allow-origin, access-control-allow-headers")
	var msg RefMsg                                    // RefMsg구조체 타입의 변수 msg TxId, BlcId
	var rmsg BTMsg                                    // BTMsg 구조체 타입의 변수 rmsg Tx ,Block
	err := json.NewDecoder(request.Body).Decode(&msg) // Json형식으로  msg(TxId) 받아옴
	if err != nil {
		fmt.Println(err)
		return
	}
	// hblc, _ := hex.DecodeString(msg.Blcid)
	htx, _ := hex.DecodeString(msg.Txid)
	jrm, _ := json.MarshalIndent(msg, "", " ") // jrm := msg(헥사스트링 Txid, Blcid) -> json형식 []byte
	// fmt.Printf("%x\n", hblc)
	fmt.Printf("%x\n", htx)
	//리턴부분
	jt, _ := sendAndReturn("localhost:7200/reftx", jrm) // jrm json으로 변환후 /reftx 로 던짐

	json.Unmarshal(jt, &rmsg) //rmsg Txid, Blcid
	fmt.Println("*********************서버로 보낼 데이터*********************")
	// rmsg.Block.Bprint()
	rmsg.Tx.Txprint()
	fmt.Println("***************************************************************")

	jhs := hex.EncodeToString(rmsg.Tx.Hash)
	jfs := string(rmsg.Tx.From[:])
	jts := string(rmsg.Tx.To[:])
	jis := string(rmsg.Tx.Item[:])
	jss := hex.EncodeToString(rmsg.Tx.Sig[:])
	jtp := string(rmsg.Tx.Timestamp)
	jpr := rmsg.Tx.Price

	fmt.Println("----------------웹서버로 보내는 Tx 정보----------------------")
	fmt.Printf("Hash:%s\n", jhs)
	fmt.Printf("From:%s\n", jfs)
	fmt.Printf("To:%s\n", jts)
	fmt.Printf("Item:%s\n", jis)
	fmt.Printf("Price:%d\n", jpr)
	fmt.Printf("TimeStamp:%s\n", jtp)
	fmt.Printf("Sig:%s\n", jss)
	fmt.Println("---------------------------------------------------------------")

	wtmsg := WebTxMsg{jhs, jfs, jts, jis, jss, jtp, jpr}

	wtbytes, _ := json.Marshal(wtmsg)

	buff := bytes.NewBuffer(wtbytes)
	http.Post("http://localhost:8080/ClassProject1/mainForm.do", "application/json", buff)

	fmt.Println("웹으로 Tx정보 보냄 !!!!!!!!!", wtbytes)
}

func (server *Server) resolveRefBlc(writer http.ResponseWriter, request *http.Request) {
	writer.Header().Set("Content-Type", "application/json")
	writer.Header().Set("Access-Control-Allow-Origin", "*")
	writer.Header().Set("Access-Control-Allow-Headers", "Content-Type,access-control-allow-origin, access-control-allow-headers")
	var msg ReffMsg
	var rmsg BTTMsg
	err := json.NewDecoder(request.Body).Decode(&msg) // Json형식으로  msg(BlcId) 받아옴
	if err != nil {
		fmt.Println(err)
		return
	}

	hblc, _ := hex.DecodeString(msg.Blcid)
	jrm, _ := json.MarshalIndent(msg, "", " ") // jrm := msg(헥사스트링 Blcid) -> json형식 []byte
	fmt.Printf("%x\n", hblc)

	// 리턴부분
	jt, _ := sendAndReturn("localhost:7200/refBlc", jrm) // restful -> 인터페이스서버
	json.Unmarshal(jt, &rmsg)                            //rmsg Blcid
	fmt.Println("*********************서버로 보낼 데이터*********************")
	rmsg.Block.Bprint()
	fmt.Println("***************************************************************")

	bjhs := hex.EncodeToString(rmsg.Block.Hash)
	bpjhs := hex.EncodeToString(rmsg.Block.PrevBlockHash)
	bjps := hex.EncodeToString(rmsg.Block.Pow)
	bjts := hex.EncodeToString(rmsg.Block.Txs)
	btp := string(rmsg.Block.Timestamp)
	bht := rmsg.Block.Height

	fmt.Println("----------------웹서버로 보내는 Block 정보----------------------")
	fmt.Printf("Hash:%s\n", bjhs)
	fmt.Printf("Pre:%s\n", bpjhs)
	fmt.Printf("Timestamp:%d\n", rmsg.Block.Timestamp)
	fmt.Printf("Pow:%s\n", bjps)
	fmt.Printf("Nonce:%d\n", rmsg.Block.Nonce)
	fmt.Printf("bits:%d\n", rmsg.Block.Bit)
	fmt.Printf("TxId:%s\n", bjts)
	fmt.Printf("Height:%d\n", rmsg.Block.Height)
	fmt.Println("---------------------------------------------------------------")

	wbmsg := WebBlcMsg{bjhs, bpjhs, bjps, bjts, bht, btp}

	wbbytes, _ := json.Marshal(wbmsg)
	buff := bytes.NewBuffer(wbbytes)
	http.Post("http://localhost:8080/ClassProject1/mainForm.do", "application/json", buff)

	// req, err := http.NewRequest("POST", "http://localhost:8080/ClassProject1/mainForm.do", nil)
	// if err != nil {
	// 	fmt.Println(err.Error())
	// 	os.Exit(0)
	// }

	// client := &http.Client{}
	// client.Do(req)
	//send("localhost:8080/ClassProject1/mainForm.do", wbbytes)

	fmt.Println("웹으로 블록정보 보냄 !!!!!!!!!", wbbytes)

}

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
