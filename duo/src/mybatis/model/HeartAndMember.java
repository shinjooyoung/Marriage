package mybatis.model;

public class HeartAndMember {
	   int hNO;
	   String hSendid;
	   String hReceiveid;
	   String hStat;
	   String hDate;
	   String mName;
	   String mBirth;
	   
	public HeartAndMember(){
		
	}
	public HeartAndMember(String hSendid,String hReceiveid,String hStat,String hDate,String mName,String mBirth) {
		super();
		this.hSendid = hSendid;
		this.hReceiveid = hReceiveid;
		this.hStat = hStat;
		this.hDate = hDate;
		this.mName = mName;
		this.mBirth = mBirth;
	}
	
	
	public int gethNO() {
		return hNO;
	}
	public void sethNO(int hNO) {
		this.hNO = hNO;
	}
	public String gethSendid() {
		return hSendid;
	}
	public void sethSendid(String hSendid) {
		this.hSendid = hSendid;
	}
	public String gethReceiveid() {
		return hReceiveid;
	}
	public void sethReceiveid(String hReceiveid) {
		this.hReceiveid = hReceiveid;
	}
	public String gethStat() {
		return hStat;
	}
	public void sethStat(String hStat) {
		this.hStat = hStat;
	}
	public String gethDate() {
		return hDate;
	}
	public void sethDate(String hDate) {
		this.hDate = hDate;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}

	   public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}


}
