package mybatis.session;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sun.xml.internal.ws.api.ha.HaInfo;

import mybatis.model.Member;

public class SearchRepository {
	private String namespace = "mybatis.mapper.SearchMapper";

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
	
	
	
	public List<Member> searchMember(String gender,String age,String sal,String edu,String job)
	{
		SqlSession sess =getSqlSessionFactory().openSession();
		try {
			
//			String startage = age;
//			String endage=null;
//			System.out.println(age+" age ser");
//			if(age==null)
//			{
//				
//				startage=null;
//				endage=null;
//			}else
//			{
//				int start = Integer.parseInt(age);
//				int end= start+4;
//				endage = String.valueOf(end);	
//			}			
//			
			int startage =Integer.parseInt(age);
			int endage =startage+4;
			
			HashMap hash =new HashMap<>();
			hash.put("gender", gender);
			hash.put("startage",startage);
			hash.put("endage",endage);
			hash.put("sal",sal);
			hash.put("edu",edu);
			hash.put("job",job);
			
			
			List<Member> result =sess.selectList(namespace +".searchMember",hash);
	
		return result;
		}	 
		finally {sess.close();}
		
	}
	
	
	public int SendHeart(String sId,String rId)
	{
		SqlSession sess =getSqlSessionFactory().openSession();
		try {
			
			HashMap hash =new HashMap<>();
			hash.put("sId",sId);
			hash.put("rId",rId);
			
			
			int result =sess.insert(namespace +".sendHeart",hash);
			if (result > 0)
				sess.commit();
			else
				sess.rollback();
			return result;

		}	 
		finally {sess.close();}
		
	}

	
}
