# BlockClassProject <a href="https://www.youtube.com/watch?v=ZxV86RR2kP8&t=1s"> <img src="https://img.shields.io/badge/YouTube-FF0000?style=flat-square&logo=YouTube&logoColor=white"/></a>

지난 프로젝트에서 강의를 사고 파는 사이트를 만들었습니다.   
이를 블록체인에 적용하여 강의 거래가 이루어지면 거래 내용을 블록에 넣어 대쉬보드에 보여주는 기능을 추가하여 블록체인을 활용하는 강의 거래 사이트로 바꾸려고 합니다. 
![image](https://user-images.githubusercontent.com/61136630/192709044-edb49a90-4722-409f-a33f-0c32de7f6ab3.png)

## :fire: What is the problem?
#### 1. 잔고 조회는 어떻게 해야하는가? 
  - BlockChain내부의 TXs를 조회하여 해당하는 지갑의 tx를 모두 모아서 잔고를 계산한다.  
  - Wallet내부에 잔고데이터를 포함시킨다.   
   :heavy_check_mark: Wallet 내부에 account를 만들어 잔고를 저장하도록 하였다. 거래가 이루어지면 `getBalance()`를 통해 account가 조정된다.

#### 2. TX에는 어떤 데이터를 넣어야 하는가? 
  - 어떤 서비스인지에 따라 TX에 넣는 데이터가 달라진다.   
  :heavy_check_mark: **강의 거래** 이므로 강의의 고유 번호와 가격, 판매자와 구매자의 지갑 정보가 포함되어야한다.
#### 3. TX의 SIGN를 어디에서 해야하는가 ?  TX검증은 언제 어디서 해야하는가?
  - RESTFUL로 생성요청이 왔을때   	
  - TX서버에서 TX를 생성할때    
:heavy_check_mark: 트랜잭션의 내용은 안에 들어갈 데이터만 있으면 만들 수 있다. 트랜잭션의 life cycle은 생성만 했다고 끝나는게 아니라 검증까지 해야지 끝나는 것이므로 restfulapi서버에 요청이 들어왔을때 **임시 트랜잭션** 을 생성하여 SIGN을 붙여서 tx서버로 보낸다. 그리고 이후에 tx서버에서 검증을 하여 트랜잭션을 완전히 만들어내면 블록서버로 보내 추가한다.
#### 4. BLOCK에 TX를 여러 개 넣을 것인가?
  - 블록을 만드는 비용을 줄이기 위해 여러 개를 넣는다. 
  - 거래 하나하나가 중요하므로 한 개만 넣는다.   
:heavy_check_mark: 거래의 내용을 담기 때문에 사용자가 지불했는데 블록을 기다려야하는 상황은 좋지 않다. 따라서 **한 트랜잭션 당 한 블록** 에 넣기로 했다

#### 5. PBFT합의 중 한번에 많은 요청이 들어오면 처리하는 과정에서 데이터가 유실되기도 한다. 데이터 유실을 막기 위해 어떻게 해야하는가?
  :heavy_check_mark: state를 확인하여 현재 처리 중이라면 새로운 요청은 **버퍼** 에 쌓아두고, 처리를 완료하면 버퍼에서 하나씩 꺼내어 다음 요청을 수행한다.





## :hammer: Setting
### 1. enviroment   
**go** 1.18.3   

### 2. import
`pro_ver0.8/Goroot` 내부에 있는 `BLC`, `TX`, `wallet` 파일은 `import`하여 사용해야합니다. `본인의Goroot/src`에 `BLC`, `TX`, `wallet`를 추가해주세요.   
`pro_ver0.8/Goroot` contains files such as `BLC`, `TX`, `wallet`. Please add those to `your Goroot/src`.

### 3. class365 wallet   
관리자는 유저가 코인 교환 요청을 하면 코인을 바꿔주어야 합니다.    
따라서 임의로 관리자 지갑에 코인을 넣어 두고 이를 유저에게 주는 방식으로 만들었습니다.   
관리자 지갑은 pro_ver0.8/restfulapi/wallet.json파일에 임의로 넣어두었습니다.   
블록 서버를 실행하면 자동으로 account가 충전됩니다.   
You can see the class365 wallet in `pro_ver0.8/restfulapi/wallet.json`.   
When you run a block server, the class365 wallet is automatically charged.   
(웹 서버와 연동하려면 웹 db에 관리자 지갑에 wallet.json에 있는 지갑 주소와 잔액을 추가해두어야 합니다.)

## :wink: How to perform
### 1. run `start.bat`    
배치 파일을 통해 restfulapi, rpc, interface, block, tx 서버를 실행하고, 합의에 필요한 4개의 노드를 실행합니다.   
This batch file will run servers and nodes. 

### 2. create wallet
![image](https://user-images.githubusercontent.com/61136630/192698867-cc256dfb-d42a-40dd-ac69-7fb3aa3e4933.png)   
![image](https://user-images.githubusercontent.com/61136630/192698912-a35c4f9d-abfb-45fb-bcd1-5bcfdf35b960.png)    
![image](https://user-images.githubusercontent.com/61136630/192698265-306cce7b-818b-4080-9b6b-c4764cd1e2ac.png)   
wallets.json 파일에 새로운 지갑이 추가된 모습.   

### 3. new trasaction & block   
 #### 1. recharging user wallet (store - user)  
 class365 wallet에서 user wallet으로 코인을 전달하여 사용자의 지갑을 충전한다. 이때 item 데이터 "charge"를 넣었습니다.   
![image](https://user-images.githubusercontent.com/61136630/192734414-df8f5fb6-34f5-4e9f-8963-bbc955d427a4.png)   

다음은 4개의 노드에서 합의가 이루어지는 과정입니다.
![image](https://user-images.githubusercontent.com/61136630/192735004-14635a25-2484-462e-ab7e-985b9ebd7914.png)   

합의 이후 각 서버에 정보가 전달되는 것을 보여줍니다.   
![image](https://user-images.githubusercontent.com/61136630/192735063-4143bd4e-a30c-4d43-94e8-8199aefe5646.png)   

 #### 2. user - user   
 user 간의 거래도 마찬가지입니다. user간의 거래에서는 `from: 판매자의 지갑주소, to: 구매자의 지갑주소, item: 강의 고유 번호, price : 강의 가격` 에 해당합니다.   
![image](https://user-images.githubusercontent.com/61136630/192747099-73e875e0-f6b7-4fda-b1d1-e51ba653fbd7.png)    
![image](https://user-images.githubusercontent.com/61136630/192747439-56f9b605-4306-4b13-9cde-b21ca6026101.png)    

 거래 후 잔고 변화가 wallet.json에 반영된 모습입니다.
![image](https://user-images.githubusercontent.com/61136630/192747720-df68a6cb-77b9-4944-8c94-b15f5ea285d6.png)   

### 4. tx & block 조회   
조회를 위해 트랜잭션과 블록을 생성하면 hash를 웹 db에 저장하도록 하였습니다.
이 부분은 웹 서버에서 확인 할 수 있도록 웹 서버로 보내는 부분이 포함되어 있습니다.   
웹에서 대쉬보드를 통해 블록과 트랜잭션을 조회 할 수 있습니다.   
이 부분은 시연 영상에 포함되어 있습니다.   

### 5. PBFT consensus   
![image](https://user-images.githubusercontent.com/61136630/192787182-b53619c5-eaf0-4d54-bee5-c992c1050ab0.png)

## :sparkles: More 
웹 사이트와 연동하여 시연한 영상입니다.   
<a href="https://www.youtube.com/watch?v=ZxV86RR2kP8&t=1s"> <img src="https://img.shields.io/badge/YouTube-FF0000?style=flat-square&logo=YouTube&logoColor=white"/></a>

