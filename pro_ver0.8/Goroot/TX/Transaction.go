package TX

import (
	"bytes"
	"crypto/ecdsa"
	"crypto/elliptic"
	"crypto/rand"
	"crypto/sha256"
	"crypto/x509"
	"encoding/gob"
	"encoding/pem"
	"fmt"
	"log"
	"math/big"
	"strconv"
	"time"
	W "wallet"
)

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

func (tx *Tx) setHash() {

	timestamp := strconv.FormatInt(tx.Timestamp, 10)
	timeBytes := []byte(timestamp)
	txBytes := bytes.Join([][]byte{
		timeBytes,
		tx.From,
		tx.To,
		tx.Item,
		IntToHex(int64(tx.Price)),
		//TODO nonce
	}, []byte{})

	hash := sha256.Sum256(txBytes)
	tx.Hash = hash[:]

}

func NewTx(fw string, tw string, item string, pri int) *Tx {

	tx := &Tx{}
	tx.Timestamp = time.Now().UTC().Unix() //utc기준 시간
	tx.Price = pri
	tx.From = []byte(fw)
	tx.To = []byte(tw)
	tx.Item = []byte(item)
	tx.setHash()
	//tx.Sign(fw)
	return tx
}

func NewGenesisTx() *Tx {

	tx := &Tx{}
	tx.Timestamp = time.Now().UTC().Unix() //utc기준 시간
	tx.Price = 10000000000000000
	tx.From = []byte("charge")
	tx.To = []byte("1F89ZS5m6u5tzLYE16ZMunToya5S6ZGxmk")
	tx.Nonce = 0
	tx.Sig = nil
	//TODO Nonce,Sig 나중에 제대로
	tx.setHash()

	return tx
}

func (tx *Tx) Txprint() {

	fmt.Println("----------------------Tx정보--------------------------------")
	fmt.Printf("Hash:%x\n", tx.Hash)
	fmt.Printf("From:%s\n", string(tx.From))
	fmt.Printf("To:%s\n", string(tx.To))
	fmt.Printf("Item:%s\n", string(tx.Item))
	fmt.Printf("Price:%d\n", tx.Price)
	fmt.Printf("Nonce:%d\n", tx.Nonce)
	fmt.Printf("Sig:%x\n", tx.Sig)
	fmt.Println("---------------------------------------------------------------")
}

func (t *Tx) EqualHash(e []byte) bool {
	return bytes.Equal(t.Hash, e)
}

func (tx *Tx) Sign(w *W.Wallet) {
	privencode := decode(w.PrivateKey)

	privateKey := privencode
	r, s, err := ecdsa.Sign(rand.Reader, privateKey, tx.Hash[:])
	if err != nil {
		panic(err)
	}
	tx.Sig = append(r.Bytes(), s.Bytes()...)
}

func (tx *Tx) ValidateTx(pk []byte) bool {
	curve := elliptic.P256()

	//서명
	var r, s big.Int
	//서명 만들때 r,s를 그냥 append했으니까
	//sig의 길이 절반으로 잘라서 r,s분리
	siglen := len(tx.Sig)
	r.SetBytes(tx.Sig[:siglen/2])
	s.SetBytes(tx.Sig[siglen/2:])

	//public key byte형태로 왔던거 다시 ecdsa.PublicKey로 바꾸기
	var x, y big.Int
	keylen := len(pk)
	x.SetBytes(pk[:keylen/2])
	y.SetBytes(pk[keylen/2:])

	pubkey := ecdsa.PublicKey{curve, &x, &y}

	return ecdsa.Verify(&pubkey, tx.Hash, &r, &s)

}

func (t *Tx) Serialize() []byte {
	var buf bytes.Buffer

	encoder := gob.NewEncoder(&buf)

	err := encoder.Encode(t)

	if err != nil {
		log.Panic(err)
	}
	return buf.Bytes()
}

func DeserializeTx(encodedTx []byte) *Tx {
	var buf bytes.Buffer
	var Tx Tx

	buf.Write(encodedTx)
	decoder := gob.NewDecoder(&buf)

	err := decoder.Decode(&Tx)
	if err != nil {
		log.Panic()
	}
	return &Tx
}

func decode(pemEncoded []byte) *ecdsa.PrivateKey {
	block, _ := pem.Decode(pemEncoded)
	x509Encoded := block.Bytes
	privateKey, _ := x509.ParseECPrivateKey(x509Encoded)

	return privateKey
}
