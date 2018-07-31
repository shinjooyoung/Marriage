package mybatis.session;

import java.io.InputStream;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mybatis.model.Purchase;

public class PurchaseRepository {

	private String namespace = "mybatis.mapper.PurchaseMapper";

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

	public int insertPurchase(Purchase purchase) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {
			sess.update(namespace + ".updateMember",purchase);
			int result = sess.insert(namespace + ".insertPurchase", purchase);
			if (result > 0)
				sess.commit();
			else
				sess.rollback();
			return result;
		} finally {
			sess.close();
		}
	}

	public int checkPurchase(String id) {
		SqlSession sess = getSqlSessionFactory().openSession();
		try {

			HashMap hash = new HashMap<>();
			hash.put("pId", id);
			
			int result = sess.selectOne(namespace + ".selectAll", hash);
	
			return result;		
			
		} finally {
			sess.close();
		}
	}
}
