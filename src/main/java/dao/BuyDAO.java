package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.BuyVO;

public class BuyDAO {
	
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<BuyVO> b_list(String userid){
		
		List<BuyVO> list = sqlSession.selectList("b.b_list", userid);
		
		return list;
		
	}
	
	public List<Map<String, String>> getProductList(String userid) {
		List<Map<String, String>> getProductList = sqlSession.selectList("b.getProductList", userid);
		return getProductList;
		
	}
	
	@RequestMapping
	public BuyVO b_one_list(String userid){
		
		BuyVO vo = sqlSession.selectOne("b.b_list", userid);
		
		return vo;
		
	}
	
	public int b_del(String orderid) {
		int res = sqlSession.update("b.b_del", orderid);
		
		return res;
				
		
	}
	
}
