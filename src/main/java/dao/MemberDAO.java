package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//회원가입하기
	public int sign(MemberVO vo) {
		int res = sqlSession.insert("n.sign",vo);
		
		return res;
		
	}
	//아이디 중복 체크
	public MemberVO id_check(String userid) {
		
		MemberVO vo = sqlSession.selectOne("n.id_check", userid);

		return vo;
	}
	//아이디 비번 일치여부 확인_로그인기능
	public MemberVO pwd_check(MemberVO basevo) {
		
		MemberVO vo = sqlSession.selectOne("n.pwd_check", basevo);
		
		return vo;
	}
	//로그인 비번찾기이나 원리는 id체크와 같음
	public MemberVO pwd_search(String userid) {
		
		MemberVO vo = sqlSession.selectOne("n.id_check",userid);
		
		return vo;
		
	}
	//비밀번호를 잊어버렸을 경우 비번찾기에서 비밀번호를 수정
	public int pwd_modi(MemberVO baseVO) {
		
		int	res = sqlSession.update("n.modi_pwd",baseVO);
		
		return res;
	}
	
	//멤버지우기
	public int del_member(MemberVO vo) {
		
		int res= 0;
		
		res = sqlSession.delete("n.del_mem", vo);
		if(res>=1) {
			sqlSession.delete("n.del_cart", vo);
			sqlSession.delete("n.del_buy", vo);
		}
		
		
		return res;
	}
	
	//멤버 수정하기
	public int modi_member(MemberVO basevo) {
		
		int res = sqlSession.update("n.modi_mem",basevo);
		
		return res;
	}
	
	//주소수정하기
	public int addr_modi(MemberVO vo) {
		
		int res = sqlSession.update("n.modi_addr",vo);
		
		return res;
	}
	
	
}
