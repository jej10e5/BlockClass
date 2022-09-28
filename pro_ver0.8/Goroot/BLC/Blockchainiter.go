package BLC

import (
	"bytes"
	"fmt"
	"log"
	"time"

	"github.com/boltdb/bolt"
)

type BlockchainIterator struct {
	Db   *bolt.DB
	Hash []byte
}

func NewBlockchainIterator(bc *Blockchain) *BlockchainIterator {
	return &BlockchainIterator{bc.Db, bc.End}
}

func (i *BlockchainIterator) Next() *Block {
	var block *Block

	err := i.Db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(BlocksBucket))

		encodedBlock := b.Get(i.Hash)
		block = DeserializeBlock(encodedBlock)

		i.Hash = block.PrevBlockHash
		return nil
	})
	if err != nil {
		log.Panic(err)
	}
	return block
}
func (i *BlockchainIterator) HasNext() bool {
	return bytes.Compare(i.Hash, []byte{}) != 0
}

func (bc *Blockchain) List() {

	iter := NewBlockchainIterator(bc)

	for iter.HasNext() {
		block := iter.Next()
		fmt.Println("---------------------------------------------------")
		fmt.Printf("Height : %d\n", block.Height)
		fmt.Printf("Hash : %x\n", block.Hash)
		fmt.Printf("이전해쉬 : %x\n", block.PrevBlockHash)
		fmt.Printf("tx data : %x\n", block.Txs)
		fmt.Printf("논스 : %d\n", block.Nonce)
		fmt.Printf("난이도 : %d\n", block.Bit)
		fmt.Printf("Pow : %x\n", block.Pow)
		fmt.Println("생성시간 :", time.Unix(block.Timestamp, 0))
		fmt.Println("---------------------------------------------------")
	}
}

func (bc *Blockchain) FindBlc(id []byte) *Block {

	iter := NewBlockchainIterator(bc)
	for iter.HasNext() {
		block := iter.Next()
		if bytes.Equal(id, block.Hash) {
			fmt.Println("-------------------- found ------------------------")
			fmt.Printf("Height : %d\n", block.Height)
			fmt.Printf("Hash : %x\n", block.Hash)
			fmt.Printf("이전해쉬 : %x\n", block.PrevBlockHash)
			fmt.Printf("논스 : %d\n", block.Nonce)
			fmt.Printf("난이도 : %d\n", block.Bit)
			fmt.Printf("Pow : %x\n", block.Pow)
			fmt.Println("생성시간 :", time.Unix(block.Timestamp, 0))
			fmt.Println("---------------------------------------------------")
			return block
		}

	}
	fmt.Println("블럭없음")
	return nil
}
