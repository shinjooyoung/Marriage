package mybatis.session;

import java.io.InputStream;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.model.Purchase;

public class SureRepository {

	private String namespace = "mybatis.mapper.SureMapper";

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

	public int updateHeart(int hNo,String hStat) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			HashMap hash =new HashMap<>();
			hash.put("hNo",hNo);			
			hash.put("hStat",hStat);	
			
			int result=sess.update(namespace + ".updateHeart",hash);
			
			if (result > 0)
				sess.commit();
			else
				sess.rollback();
			return result;
		} finally {
			sess.close();
		}
	}
	
	public int updateMember(String user,String Send,String mStat)
	{
		
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			HashMap hash =new HashMap<>();
			hash.put("user",user);			
			hash.put("send",Send);	
			hash.put("stat",mStat);	
			int result=sess.update(namespace + ".updateMember",hash);
			
			if (result > 0)
				sess.commit();
			else
				sess.rollback();
			return result;
		} finally {
			sess.close();
		}
	}
	public int updateHnum(String u1,String u2)
	{
		
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			HashMap hash =new HashMap<>();
			hash.put("u1",u1);			
			hash.put("u2",u2);
			int result=sess.update(namespace + ".updateHnum",hash);
			
			if (result > 0)
				sess.commit();
			else
				sess.rollback();
			return result;
		} finally {
			sess.close();
		}
	}
	public int deleteHeart(int Selho)
	{
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			HashMap hash =new HashMap<>();
			hash.put("selho",Selho);			
			
			int result=sess.delete(namespace + ".deleteHeart",hash);
			
			if (result > 0)
				sess.commit();
			else
				sess.rollback();
			return result;
		} finally {
			sess.close();
		}
		
		
	}
	
	
	
}
