package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;
import vo.MarketVO;

public class CartDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<CartVO> selectList(String userid) {
		
		List<CartVO> list = sqlSession.selectList("c.c_list",userid);
		
		return list;
		
	}
	//장바구니안에 기존에 카트가 존재하는지 확인
	public CartVO cart_check(CartVO cartvo) {
		
		CartVO basevo = sqlSession.selectOne("c.cart_check", cartvo);
		
		return basevo;
	}
	
	//장바구니에 기존 카트가 존재한다면 기존 카트 수량에 +1을 하는 코드
	public int cart_up(CartVO cartvo) {
		
		int res = sqlSession.update("c.cart_up", cartvo);
		
		return res;
	}
	
	
	//장바구니추가
	public int cart_add(CartVO cartvo) {
		
		int res = sqlSession.insert("c.cart_add", cartvo);
		
			
		return res;
		
		
	}
	
	//총가격
	public CartVO total(String userid) {
		int res= 0;
		
		CartVO vo = sqlSession.selectOne("c.totalprice", userid);
		
		return vo;
	}
	
	//수량에따른 가격
	public List<CartVO> subprice(String userid) {
		int res= 0;
		
		List<CartVO> list = sqlSession.selectList("c.subprice", userid);
		
		return list;
	}
	
	
	public int update_count(CartVO vo) {
		
		
		int res = sqlSession.update("c.update_count", vo);
		
		return res;
	}
	
	// 장바구니 삭제 
	public int delete(HashMap<String, Object> map) {
		
		int res = sqlSession.delete("c.c_delete", map);
		
		return res;
	}
	
}
