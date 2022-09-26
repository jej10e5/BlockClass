package wallet

import (
	"crypto/ecdsa"
	"crypto/elliptic"
	crypto "crypto/rand"
	"crypto/sha256"
	"crypto/x509"
	"encoding/json"
	"encoding/pem"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"time"

	base58 "github.com/btcsuite/btcd/btcutil/base58"
	"golang.org/x/crypto/ripemd160"
)

type Wallet struct {
	PrivateKey []byte `json:privateKey`
	PublicKey  []byte `json:publicKey`
	Alias      string `json:alias`
	Timestamp  int64  `json:timestamp`
	Account    int64  `json:account`
}

type Wallets struct {
	Wallets map[string]*Wallet `json:wallets`
}

//기존 wallets읽어오기
func GetWallets() *Wallets {
	//gob.Register(elliptic.P256())

	bws, err := ioutil.ReadFile("./wallets2.json")
	if err != nil {
		return &Wallets{make(map[string]*Wallet)}
	}
	var data *Wallets
	json.Unmarshal(bws, &data)
	return data
}

//지갑 json 저장
func (ws *Wallets) WalletJson() error {
	//gob.Register(elliptic.P256())
	jws, _ := json.MarshalIndent(ws, "", "  ")                         //ws를 json으로 변환
	err := ioutil.WriteFile("./wallets2.json", jws, os.FileMode(0644)) //이미 파일이 있다면 덮어씌움
	if err != nil {
		return err
	}
	return nil
}

func NewWallet(alias string) *Wallet {
	fmt.Println("NewWallet부분")
	var account int64 = 0
	private, public := newKeyPair()
	wallet := Wallet{PrivateKey: private, PublicKey: public, Alias: alias, Timestamp: time.Now().UTC().Unix(), Account: account}
	return &wallet
}

func NewWallets() *Wallets {
	return &Wallets{}
}
func (ws *Wallets) AddWallet(w *Wallet) {
	ws.Wallets[w.GetAddress()] = w
	fmt.Println("rpcserver addwallet")
}
func newKeyPair() ([]byte, []byte) {
	curve := elliptic.P256()
	private, _ := ecdsa.GenerateKey(curve, crypto.Reader)
	privencode := encode(private)
	public := append(private.PublicKey.X.Bytes(), private.PublicKey.Y.Bytes()...)
	return privencode, public
}
func HashPubKey(pubKey []byte) []byte {
	publicSHA256 := sha256.Sum256(pubKey)
	RIPEMD160Hasher := ripemd160.New()
	_, err := RIPEMD160Hasher.Write(publicSHA256[:])
	if err != nil {
		log.Panic(err)
	}
	publicRIPEMD160 := RIPEMD160Hasher.Sum(nil)
	return publicRIPEMD160
}
func (w *Wallet) GetAddress() string {
	fmt.Println("지갑 주소 getAddress부분")
	version := byte(0x00)
	pubKeyHash := HashPubKey(w.PublicKey)
	b := make([]byte, 0, 1+len(pubKeyHash)+4)
	b = append(b, version)
	b = append(b, pubKeyHash[:]...)
	cksum := checksum(b)
	b = append(b, cksum[:]...)
	addr := base58.Encode(b)
	return addr
}
func ValidateAddress(adr string, pk []byte) bool {
	fmt.Println("지갑 주소 validate부분")
	version := byte(0x00)
	pubKeyHash := HashPubKey(pk)
	b := make([]byte, 0, 1+len(pubKeyHash)+4)
	b = append(b, version)
	b = append(b, pubKeyHash[:]...)
	cksum := checksum(b)

	decoded := base58.Decode(adr)
	if len(decoded) < 5 {
		return false
	}
	if checksum(decoded[:len(decoded)-4]) != cksum {
		return false
	}
	return true
}
func checksum(input []byte) (cksum [4]byte) {
	h := sha256.Sum256(input)
	h2 := sha256.Sum256(h[:])
	copy(cksum[:], h2[:4])
	return
}

//추가6/30
func (ws *Wallets) FindWallet(adr string) *Wallet {
	return ws.Wallets[adr]
}

func encode(privateKey *ecdsa.PrivateKey) []byte {
	x509Encoded, _ := x509.MarshalECPrivateKey(privateKey)                                // RSA 개인키 형식을 PEM블록형식으로 인코딩
	pemEncoded := pem.EncodeToMemory(&pem.Block{Type: "PRIVATE KEY", Bytes: x509Encoded}) // []byte type 메모리로 인코드

	return pemEncoded
}

func decode(pemEncoded []byte) *ecdsa.PrivateKey {
	block, _ := pem.Decode(pemEncoded)
	x509Encoded := block.Bytes
	privateKey, _ := x509.ParseECPrivateKey(x509Encoded)

	return privateKey
}
