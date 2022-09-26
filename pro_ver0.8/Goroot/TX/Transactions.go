package TX

import (
	"log"

	"github.com/boltdb/bolt"
)

const (
	TxsBucket = "Txs"
	TxsdbFile = "t1.db"
)

type TxsData struct {
	Db *bolt.DB
	// Txs []*Tx
	End []byte
}

func (txsdata *TxsData) AddTx(tx *Tx) {
	err := txsdata.Db.Update(func(txb *bolt.Tx) error {
		b := txb.Bucket([]byte(TxsBucket))
		err := b.Put(tx.Hash, tx.Serialize())
		if err != nil {
			log.Panic(err)
		}

		err = b.Put([]byte("end"), tx.Hash)
		if err != nil {
			log.Panic(err)
		}

		txsdata.End = tx.Hash
		return nil
	})
	if err != nil {
		log.Panic(err)
	}

}

/*
func (txsdata *TxsData) AddTx(t *Tx) {
	// txs.Txs = append(txs.Txs, t)
	return NewTxs()

}
*/

func NewTxs() *TxsData {
	db, err := bolt.Open(TxsdbFile, 0600, nil) // &bolt.Options{Timeout: 1 * time.Second}
	if err != nil {
		log.Panic(err)
	}
	var end []byte

	err = db.Update(func(tx *bolt.Tx) error { //읽기 쓰기 트랜잭션 db.Update()
		b := tx.Bucket([]byte(TxsBucket)) //트랜잭션을 저장하고 있는 Bucket
		if b == nil {                     // Bucket이 존재하지 않은 경우
			b, err := tx.CreateBucket([]byte(TxsBucket)) // Bucket을 만들고
			if err != nil {
				log.Panic(err)
			}
			genTx := NewGenesisTx()                    // 제네시스 Tx 생성하여
			err = b.Put(genTx.Hash, genTx.Serialize()) // 직렬화 하여 Bucket에 저장하고
			if err != nil {
				log.Panic(err)
			}
			err = b.Put([]byte("end"), genTx.Hash) //
			if err != nil {
				log.Panic(err)
			}
			end = genTx.Hash
		} else {
			end = b.Get([]byte("end"))
		}
		if err != nil {
			log.Panic(err)
		}
		return nil
	})
	return &TxsData{db, end} // TxsData 구조체 ?.?
	//return &TxsData{[]*Tx{}}
}

/*
func (txs *TxsData) TxsString() string {
	s := ""
	for _, tx := range txs {
		s = s + string(tx.From) + string(tx.To) + string(tx.Sig) + strconv.Itoa(tx.Price) + "/n"
	}
	return s
}
*/
