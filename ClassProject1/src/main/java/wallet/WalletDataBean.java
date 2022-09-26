package wallet;

public class WalletDataBean {
	private int wallet_no;
	private String id;
	private int cash;
	private int coin;
	private String waladdr;
	
	public int getWallet_no() {
		return wallet_no;
	}
	public void setWallet_no(int wallet_no) {
		this.wallet_no = wallet_no;
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
	public String getWaladdr() {
		return waladdr;
	}
	public void setWaladdr(String waladdr) {
		this.waladdr = waladdr;
	}
	
	
	
}
