package walletcharge;

public class WalletChargeDataBean {
	private int req_no;
	private String id;
	private int cash;
	private int coin;
	private int req_coin;
	private int status;
	private String waladdr;
	
	
	public int getReq_no() {
		return req_no;
	}
	public void setReq_no(int req_no) {
		this.req_no = req_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	public int getReq_coin() {
		return req_coin;
	}
	public void setReq_coin(int req_coin) {
		this.req_coin = req_coin;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getWaladdr() {
		return waladdr;
	}
	public void setWaladdr(String waladdr) {
		this.waladdr = waladdr;
	}
	
	
}
