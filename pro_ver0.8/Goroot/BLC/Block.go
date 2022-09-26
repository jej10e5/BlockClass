package BLC

import (
	"bytes"
	"crypto/sha256"
	"encoding/gob"
	"fmt"
	"log"
	"strconv"
	"time"
)

//commit

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

type BJson struct {
	Hash          []byte `json:"Hash"`
	PrevBlockHash []byte `json:"PrevBlockHash"`
	Timestamp     int64  `json:"Timestamp"`
	Pow           []byte `json:"Pow"`
	Nonce         int    `json:"Nonce"`
	Bit           int64  `json:"Bit"`
	Txs           []byte `json:"Txs"`
	Height        int    `json:"Height"`
}

func (block *Block) GetBlockBytes() []byte {
	timestamp := strconv.FormatInt(block.Timestamp, 10)
	timeBytes := []byte(timestamp)

	blockBytes := bytes.Join([][]byte{
		block.PrevBlockHash,
		block.Txs,
		timeBytes,
		block.Pow,
		IntToHex(int64(block.Nonce)),
		IntToHex(int64(block.Bit)),
	}, []byte{})
	return blockBytes
}
func (block *Block) setHash() {

	timestamp := strconv.FormatInt(block.Timestamp, 10)
	timeBytes := []byte(timestamp)

	//---------------------------------
	// blockBytes 값 채우기
	//---------------------------------

	blockBytes := bytes.Join([][]byte{
		block.PrevBlockHash,
		block.Txs,
		timeBytes,
		block.Pow,
		IntToHex(int64(block.Nonce)),
		IntToHex(int64(block.Bit)),
	}, []byte{})
	hash := sha256.Sum256(blockBytes)
	block.Hash = hash[:]

}

//블록 생성시 data값과 이전블록의hash값이 필요.
//Blockchain.go에서 AddBlock메서드에서 사용됨
func NewBlock(txs []byte, prevBlockHash []byte, pHeight int) *Block {

	block := &Block{}
	//----------------------------
	//  block element 값 채우기
	//----------------------------
	block.PrevBlockHash = prevBlockHash
	block.Timestamp = time.Now().UTC().Unix() //utc기준 시간
	block.Txs = txs                           //나중에처리
	//pow := newProofOfWork(block)
	//nonce, hash, bits := pow.Run()
	block.Pow = []byte{}
	block.Nonce = 0
	block.Bit = 0
	block.Height = pHeight + 1
	block.setHash()

	return block
}

func NewGenesisBlock() *Block { //hash값 32byte
	//gt := Tx.NewTxs()
	//newTx := Tx.NewGenesisTx()
	//gt.AddTx(newTx)
	return NewBlock([]byte{}, []byte{}, 0)
} //previous hash값--genesis니까 없음

func (block *Block) Bprint() {
	fmt.Println("----------------------Block--------------------------------")
	fmt.Printf("Hash:%x\n", block.Hash)
	fmt.Printf("Pre:%x\n", block.PrevBlockHash)
	fmt.Printf("Timestamp:%d\n", block.Timestamp)
	fmt.Printf("Pow:%x\n", block.Pow)
	fmt.Printf("Nonce:%d\n", block.Nonce)
	fmt.Printf("bits:%d\n", block.Bit)
	fmt.Printf("TxId:%x\n", block.Txs)
	fmt.Printf("Height:%d\n", block.Height)
	fmt.Println("---------------------------------------------------------------")
}
func (b *Block) EqualHash(e []byte) bool {
	return bytes.Equal(b.Hash, e)
}

func (b *Block) EqualData(e []byte) bool {
	return bytes.Equal(b.Txs, e)
}

func (b *Block) IsGenBlock() bool {
	return bytes.Equal(b.PrevBlockHash, []byte{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
}

/*
func (b *Block) setTxsHash() []byte {
	hash := []byte{}
	for _, t := range b.Txs.Txs {
		hash = append(hash, t.Hash...)
	}
	return hash[:]
}
*/
func (b *Block) Serialize() []byte {
	var buf bytes.Buffer

	encoder := gob.NewEncoder(&buf)

	err := encoder.Encode(b)

	if err != nil {
		log.Panic(err)
	}
	return buf.Bytes()
}

func DeserializeBlock(encodedBlock []byte) *Block {
	var buf bytes.Buffer
	var block Block

	buf.Write(encodedBlock)
	decoder := gob.NewDecoder(&buf)

	err := decoder.Decode(&block)
	if err != nil {
		log.Panic(err)
	}
	return &block
}
