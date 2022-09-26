package BLC

import (
	"crypto/rand"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"math/big"
	"os"
	"time"

	"github.com/boltdb/bolt"
)

const (
	BlocksBucket = "blocks"
	dbFile       = "b1.db"
)

type Blockchain struct {
	Db  *bolt.DB
	End []byte
}

type BcJson struct {
	Blocks []*BJson
}

func (blockchain *Blockchain) ChainingBlock(block *Block) []byte {
	err := blockchain.Db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(BlocksBucket))
		err := b.Put(block.Hash, block.Serialize()) //블록의 해쉬는 bolt DB Bucket의 Key! Serialize는 Value !!
		if err != nil {                             //boltDB Bucket에서 꺼내올떄는 Get으로 꺼내온뒤 DeSerialize 하면된다!
			log.Panic(err)
		}

		err = b.Put([]byte("end"), block.Hash)
		if err != nil {
			log.Panic(err)
		}
		blockchain.End = block.Hash

		return nil
	})
	if err != nil {
		log.Panic(err)
	}
	return block.Hash
}

//새 블록을 만들어서 기존의 블록체인(블록들)에 추가하는 함수
func (blockchain *Blockchain) AddBlock(txs []byte) *Block {
	//새 블록 만들기

	return NewBlock(txs, blockchain.End, blockchain.FindHeight()) //block.Height 추가하기  blockchain.Blocks[len(blockchain.Blocks)-1].
}

/*
//새 블록을 만들어서 기존의 블록체인(블록들)에 추가하는 함수
func (blockchain *Blockchain) AddBlock(txs *Tx.TxsData) {
	//------------------------------
	// 채우기
	//------------------------------
	//이전 블록을 찾아서 해시값을 알아내야함
	//기존의 블록체인의 블록들 중 가장 끝에거이므로 len함수를 사용해서 가장 끝의 블록을 가져온다.
	prev := blockchain.Blocks[len(blockchain.Blocks)-1] //--2
	//새로운 블록 만드는 코드
	//data와 이전블록의 해시값 필요 -> 이전 hash값 구해야함 --1
	nB := NewBlock(txs, prev.Hash[:], prev.Height)
	//기존의 블록체인에다가 새 블록을 추가하기
	//구조체
	//blockchain이라는 구조체 내의 Blocks에 값을 넣는거
	blockchain.Blocks = append(blockchain.Blocks, nB) //--3

}
*/
func NewBlockchain() *Blockchain {
	db, err := bolt.Open(dbFile, 0600, &bolt.Options{Timeout: 1 * time.Second})
	if err != nil {
		log.Panic(err)
	}
	var end []byte

	err = db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(BlocksBucket))
		if b == nil {
			b, err := tx.CreateBucket([]byte(BlocksBucket))
			if err != nil {
				log.Panic(err)
			}
			genBlock := NewGenesisBlock()
			err = b.Put(genBlock.Hash, genBlock.Serialize())
			if err != nil {
				log.Panic(err)
			}
			err = b.Put([]byte("end"), genBlock.Hash)
			if err != nil {
				log.Panic(err)
			}

			end = genBlock.Hash
		} else { //블록체인이 bolt에 있는경우
			end = b.Get([]byte("end"))
		}
		if err != nil {
			log.Panic(err)
		}
		return nil
	})
	return &Blockchain{db, end}
}

func (bc *Blockchain) FindHeight() int {

	var block *Block
	fmt.Println("findheigt 시작 ")
	bc.Db.View(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(BlocksBucket))
		v := b.Get(bc.End)
		block = DeserializeBlock(v)

		return nil
	})
	return block.Height
}

/*
func (bc *Blockchain) FindBlock(id []byte) *Block {
	for _, v := range bc.Blocks {
		if v.EqualHash(id) {
			return v
		}
	}
	return nil
}
*/

func (bc *Blockchain) BcJson() {
	bcj, _ := json.MarshalIndent(bc, "", " ")
	err := ioutil.WriteFile("./test.json", bcj, os.FileMode(0644))
	if err != nil {
		fmt.Println(err)
		return
	}
}

/*
func (bc *Blockchain) GetJson() BcJson {
	b, err := ioutil.ReadFile("./test.json") //파일읽기
	if err != nil {
		fmt.Println(err)
	}

	var bjs BcJson
	json.Unmarshal(b, &bjs)
	return bjs
}
*/

/*
func (bc *Blockchain) Comp(bcj BcJson) bool {
	bj := bcj.Blocks
	for i, b := range bc.Blocks {
		if !b.EqualHash(bj[i].Hash) {
			return false

		if cmp.Equal(b, bj[i]) { //두 구조체 자료 모두 비교
			return false
		}
	}
	return true
}
*/
func RandData(size int, datasize int64) []int {
	num := make([]int, size)
	for i := 0; i < size; i++ {
		check := 0
		nr, _ := rand.Int(rand.Reader, big.NewInt(datasize))
		num[i] = int(nr.Int64())
		if i > 0 {
			for {
				check = 0
				for j := 0; j < i; j++ {

					if num[i] == num[j] {
						nrr, _ := rand.Int(rand.Reader, big.NewInt(datasize))
						num[i] = int(nrr.Int64())
						check = 1
					}
				}
				if check != 1 {
					break
				}
			}
		}
	}
	return num

}

/*
func (b *Blockchain) GetTxCount(w *Wallet) int {
	cnt := 1
	for _, v := range b.Blocks {
		txs := v.Txs
		for _, t := range txs.Txs {
			if bytes.Equal(t.From, []byte(w.Address)) {
				cnt++
			}
		}
	}
	return cnt
}
*/
/*
func (b *Blockchain) FindTx(id []byte) *Tx {
	//inHash := b.Blocks[len(b.Blocks)-1].Hash
	for _, v := range b.Blocks {
		//if bytes.Equal(v.Hash, inHash) {
		for _, t := range v.Txs.Txs {
			if bytes.Equal(t.Hash, id) {
				return t
			}
		}
		//inHash = blc.PrevBlockHash
		//if bytes.Equal(inHash, b.Blocks[0].Hash) {
		//	break
		//}
	}
	return nil
}
*/
