package mybatis.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



import mybatis.model.*;

public class ListRepository {
	private String namespace = "mybatis.mapper.PurchaseMapper";
	private String namespace2 = "mybatis.mapper.ListMapper";
	
	SqlSessionFactory getSqlSessionFactory() {
		InputStream in = null;
		try {
			in = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (Exception ex) {
			System.out.println("마이바티즈 설정 실패 : " + ex.getMessage());
		}
		SqlSessionFactory sessFac = new SqlSessionFactoryBuilder().build(in);
		return sessFac;
	}
	
	public List<Purchase> showPay(String pId) { // 출력
		SqlSession sess = getSqlSessionFactory().openSession();
		// JDBC의 연결객체 -> SqlSession
		
		try {
			
			HashMap hash = new HashMap<>();
			hash.put("pId", pId);
			
			return sess.selectList(namespace + ".selectPay",hash);
		} finally {
			sess.close();
		}
	}
		
	public List<HeartAndMember> selectHeartByOut(String userId) { // 출력
		SqlSession sess = getSqlSessionFactory().openSession();
		// JDBC의 연결객체 -> SqlSession
		try {
			HashMap hash = new HashMap<>();
			hash.put("userId", userId);
			 
			 return sess.selectList(namespace2 + ".selectOut",hash);
		} finally {
			sess.close();
		}
	}
	public List<HeartAndMember> selectHeartByIn(String userId) { // 출력
		SqlSession sess = getSqlSessionFactory().openSession();
		// JDBC의 연결객체 -> SqlSession
		try {
			HashMap hash = new HashMap<>();
			hash.put("userId", userId);
				 
			 return sess.selectList(namespace2 + ".selectIn",hash);
		} finally {
			sess.close();
		}
	} 
	
	
	
		
	
	/*public List<HeartAndMember> selectHeartById(String userId) { // 출력
		SqlSession sess = getSqlSessionFactory().openSession();
		// JDBC의 연결객체 -> SqlSession
		try {
			return sess.selectList(namespace + ".selectOut",userId);
		} finally {
			sess.close();
		}
	}*/
	
//	public Heart selectCommentByPk(String hNO,String hSendid,String hStat,String hDate)
//	{
//		SqlSession sess =getSqlSessionFactory().openSession();
//		try {	
//		
//		HashMap hash =new HashMap<>();
//		hash.put("hNO",hNO);			
//		hash.put("hSendid",hSendid);	
//		hash.put("hStat",hStat);			
//		hash.put("hDate",hDate);	
//		Heart result= sess.selectOne(namespace+".selectOut",hash);
//
//		return result;
//				
//		}
//		finally {sess.close();}	
//	}
//	
	
//	public Member selectMemberByPk(String id)
//	{
//		SqlSession sess =getSqlSessionFactory().openSession();
//		try {	
//		
//		HashMap hash =new HashMap<>();
//		hash.put("mId",id);
//		Member result= sess.selectOne(namespace+".selectAll2",hash);
//
//		return result;
//				
//		}
//		finally {sess.close();}	
//	}

	

//	public List<BoardRec> selectRec(int firstRow,int endRow) {
//		SqlSession sess = getSqlSessionFactory().openSession();
//		// JDBC의 연결객체 -> SqlSession
//		try {			
//			HashMap hash =new HashMap<>();
//			hash.put("first",firstRow);
//			hash.put("end",endRow);
//			return sess.selectList(namespace + ".selectAll",hash);
//		} finally {
//			sess.close();
//		}
//
//	}
//	public int total()
//	{
//		SqlSession sess = getSqlSessionFactory().openSession();
//		// JDBC의 연결객체 -> SqlSession
//		try {
//			return sess.selectOne(namespace + ".selectTotal");
//		} finally {
//			sess.close();
//		}		
//	}
//	public int insertComment(Comment c)
//	{
//		SqlSession sess =getSqlSessionFactory().openSession();
//		try {
//		int result =sess.insert(namespace +".insertComment",c);
//		if(result>0)
//			sess.commit();
//		else
//			sess.rollback();
//		return result;
//		}	 
//		finally {sess.close();}
//		
//	}
//	public Comment selectCommentByPk(long cId)
//	{
//		SqlSession sess =getSqlSessionFactory().openSession();
//		try {
//		HashMap hash =new HashMap<>();
//		hash.put("cId",cId);
//		String st =String.valueOf(cId);
//		Comment result= sess.selectOne(namespace+".selectAll",hash);
//		return result;
//		}
//		finally {sess.close();}
//	
//	}
//	public int deleteCommentByPk(String del)
//	{
//		SqlSession sess =getSqlSessionFactory().openSession();
//		try {
//		int result =sess.delete(namespace +".deleteOne",del);
//		if(result>0)
//			sess.commit();
//		else
//			sess.rollback();
//		return result;
//		}	 
//		finally {sess.close();}
//		
//		
//	}
//	public int ModifyComment(Comment c)
//	{
//		SqlSession sess =getSqlSessionFactory().openSession();
//		try {
//		int result =sess.update(namespace +".updateComment",c);
//		if(result>0)
//			sess.commit();
//		else
//			sess.rollback();
//		return result;
//		}	 
//		finally {sess.close();}
//		
//	}
	
}
