package TX

import (
	"bytes"
	"fmt"
	"log"
	"time"

	"github.com/boltdb/bolt"
)

type TxsIterator struct {
	Db   *bolt.DB
	Hash []byte
}

func NewTxsIterator(txs *TxsData) *TxsIterator {
	return &TxsIterator{txs.Db, txs.End}
}

func (i *TxsIterator) Next() *Tx {
	var tx *Tx

	err := i.Db.Update(func(txb *bolt.Tx) error {
		b := txb.Bucket([]byte(TxsBucket))

		encodedTx := b.Get(i.Hash)
		tx = DeserializeTx(encodedTx)

		i.Hash = tx.Hash
		return nil
	})

	if err != nil {
		log.Panic(err)
	}
	return tx
}
func (i *TxsIterator) HasNext() bool {
	return bytes.Compare(i.Hash, []byte{}) != 0
}

func (t *TxsData) List() {

	iter := NewTxsIterator(t)

	for iter.HasNext() {
		tx := iter.Next()
		fmt.Println("------------------------------------------------")
		fmt.Printf("Hash : %x\n", tx.Hash)
		fmt.Println("생성시간 :", time.Unix(tx.Timestamp, 0))
		fmt.Printf("From : %x\n", tx.From)
		fmt.Printf("To : %x\n", tx.To)
		fmt.Printf("Item : %x\n", tx.Item)
		fmt.Printf("Price : %d\n", tx.Price)
		fmt.Printf("Nonce : %d\n", tx.Nonce)
		fmt.Printf("Sig : %x\n", tx.Sig)
		fmt.Println("---------------------------------------------------")
	}
}

func (t *TxsData) FindTx(id []byte) *Tx {
	iter := NewTxsIterator(t)
	for iter.HasNext() {
		tx := iter.Next()
		if bytes.Equal(id, tx.Hash) {
			fmt.Println("-------------------- found ------------------------")
			fmt.Printf("Hash : %x\n", tx.Hash)
			fmt.Println("생성시간 :", time.Unix(tx.Timestamp, 0))
			fmt.Printf("From : %x\n", tx.From)
			fmt.Printf("To : %x\n", tx.To)
			fmt.Printf("Item : %x\n", tx.Item)
			fmt.Printf("Price : %d\n", tx.Price)
			fmt.Printf("Nonce : %d\n", tx.Nonce)
			fmt.Printf("Sig : %x\n", tx.Sig)
			fmt.Println("---------------------------------------------------")
			return tx
		}
	}
	fmt.Println("트랜잭션 없음")
	return nil
}
