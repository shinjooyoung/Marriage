package mybatis.model;

public class Purchase {
	int pNo;
	String pId;
	String pRank;
	String pStat;
	String pDate;
	String mName;
	
	
	public Purchase() {
		
	}
	
	public Purchase(int pNo, String pId, String pRank, String pStat,String pDate, String mName) {
		this.pNo = pNo;
		this.pId = pId;
		this.pRank = pRank;
		this.pStat = pStat;
		this.pDate = pDate;
		this.mName = mName;
	}
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpRank() {
		return pRank;
	}
	public void setpRank(String pRank) {
		this.pRank = pRank;
	}
	public String getpStat() {
		return pStat;
	}
	public void setpStat(String pStat) {
		this.pStat = pStat;
	}
	public String getpDate() {
		return pDate;
	}
	public void setpDate(String pDate) {
		this.pDate = pDate;
	}
	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	
	
}

