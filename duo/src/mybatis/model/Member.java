package mybatis.model;

public class Member
{
	// member field
	private String mId;
	private String mPass;
	private String mName;
	private String mGender;
	private String mBirth;
	private String mTel;
	private String mJob;
	private String mSal;
	private String mEdu;
	private String mPic;
	private String mRank;
	private String mRemarry;
	private String mMarry;
	private int mHeart;//보유 하트갯수 
	private String mHstat;

	
	// constructor method 
	public Member()
	{		
	}
	public Member(String mId, String mPass, String mName, String mGender, String mBirth, String mTel, String mJob,
			String mSal, String mEdu, String mPic, String mRank, String mRemarry, String mMarry, int mHeart,
			String mHstat) {
		super();
		this.mId = mId;
		this.mPass = mPass;
		this.mName = mName;
		this.mGender = mGender;
		this.mBirth = mBirth;
		this.mTel = mTel;
		this.mJob = mJob;
		this.mSal = mSal;
		this.mEdu = mEdu;
		this.mPic = mPic;
		this.mRank = mRank;
		this.mRemarry = mRemarry;
		this.mMarry = mMarry;
		this.mHeart = mHeart;
		this.mHstat = mHstat;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPass() {
		return mPass;
	}
	public void setmPass(String mPass) {
		this.mPass = mPass;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmGender() {
		return mGender;
	}
	public void setmGender(String mGender) {
		this.mGender = mGender;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getmTel() {
		return mTel;
	}
	public void setmTel(String mTel) {
		this.mTel = mTel;
	}
	public String getmJob() {
		return mJob;
	}
	public void setmJob(String mJob) {
		this.mJob = mJob;
	}
	public String getmSal() {
		return mSal;
	}
	public void setmSal(String mSal) {
		this.mSal = mSal;
	}
	public String getmEdu() {
		return mEdu;
	}
	public void setmEdu(String mEdu) {
		this.mEdu = mEdu;
	}
	public String getmPic() {
		return mPic;
	}
	public void setmPic(String mPic) {
		this.mPic = mPic;
	}
	public String getmRank() {
		return mRank;
	}
	public void setmRank(String mRank) {
		this.mRank = mRank;
	}
	public String getmRemarry() {
		return mRemarry;
	}
	public void setmRemarry(String mRemarry) {
		this.mRemarry = mRemarry;
	}
	public String getmMarry() {
		return mMarry;
	}
	public void setmMarry(String mMarry) {
		this.mMarry = mMarry;
	}
	public int getmHeart() {
		return mHeart;
	}
	public void setmHeart(int mHeart) {
		this.mHeart = mHeart;
	}
	public String getmHstat() {
		return mHstat;
	}
	public void setmHstat(String mHstat) {
		this.mHstat = mHstat;
	}
	

}
