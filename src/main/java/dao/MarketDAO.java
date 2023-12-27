package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MarketVO;

public class MarketDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//상품 목록 조회
	public List<MarketVO> selectList(){
		
		List<MarketVO> list = sqlSession.selectList("m.p_list");
		
		return list;
	}
	
	
	//상품 등록
	public int p_insert(MarketVO vo) {
		
		int res = sqlSession.insert("m.p_insert", vo);
		
		
		return res;
	}
	
	// 상품 상세
	public MarketVO selectOne(int product_id) {
		MarketVO vo = sqlSession.selectOne("m.p_detail", product_id);
		return vo;
	}
	
}
