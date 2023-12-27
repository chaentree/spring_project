package com.korea.nike;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BuyDAO;
import dao.CartDAO;
import dao.MarketDAO;
import dao.MemberDAO;
import sun.text.normalizer.Replaceable;
import util.MyCommon;
import vo.BuyVO;
import vo.MarketVO;
import vo.MemberVO;

@Controller
public class MemberController {

 @Autowired
 HttpServletRequest request;
 
 MemberDAO member_dao;
 MarketDAO market_dao;
 BuyDAO buy_dao;
 CartDAO cart_dao;
 
 
 public void setCart_dao(CartDAO cart_dao) {
	this.cart_dao = cart_dao;
}
 public void setBuy_dao(BuyDAO buy_dao) {
	this.buy_dao = buy_dao;
}
 
 public void setMember_dao(MemberDAO member_dao) {
	this.member_dao = member_dao;
}
 
 public void setMarket_dao(MarketDAO market_dao) {
	this.market_dao = market_dao;
}
 

 //메인 페이지
@RequestMapping(value = {"/","/main.do"})
public String main() {
	return MyCommon.VIEW_PATH+"main.jsp";
}

//동의 페이지
@RequestMapping(value= {"/agree.do"})
public String agree() {
	
	return MyCommon.VIEW_PATH+"agree.jsp";
}
//회원가입(멤버쉽) 메인페이지로 이동
@RequestMapping("membership.do")
public String membership() {
	
	return MyCommon.VIEW_PATH+"sign_main.jsp";
}
//회원가입 폼 이동
 @RequestMapping(value= {"/insert_form.do"})
 public String insert_form() {
	 
	 return MyCommon.VIEW_PATH+"insert_form.jsp";
 }
 //로그인계속하기로 가기
 @RequestMapping("/sign_clear.do")
 public String sign_claer(Model model, String userid) {
	
	//계정정보 저장
	MemberVO vo = member_dao.id_check(userid);
	//계정 정보 바인딩
	model.addAttribute("vo", vo);
	 
	 
	 return MyCommon.VIEW_PATH+"main.jsp";
 }
//회원가입하기
 @RequestMapping("/sign.do")
 public String sign(Model model, String userid, String pwd,String gender, String email,String phone1,String phone2,String phone3
		 ,String first_name,String last_name, String birth_first, String birth_last) {
	 //sign.do?id=aaa&pwd=@@@@
	
	String phone = phone1+phone2+phone3;
	String birth = birth_first+birth_last;
	String fullname = last_name+" "+first_name;
	
	MemberVO vo = new MemberVO();	
	
	vo.setUserid(userid);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setBirth(birth);
	vo.setGender(gender);
	vo.setPhone(phone);
	vo.setFirst_name(first_name);
	vo.setLast_name(last_name);
	
	int res = member_dao.sign(vo);
	
	model.addAttribute("vo",vo);
	System.out.println(fullname+" 님이 가입하셨습니다!");
	
	
	 return MyCommon.VIEW_PATH+"sign_clear.jsp";
 }
 //로그인 폼1 아이디 체크
 @RequestMapping("check_id.do")
 @ResponseBody
 public Map<String, String> id_check(String userid){
	 
	 MemberVO vo = member_dao.id_check(userid);
	
	String result = "no"; 
	 if(vo == null) {	//중복조회를 통해서 회원가입이 가능한 상태
		  result ="yes";
	 }
	 
	 
	 Map<String, String> map = new HashMap<String, String>();
	 map.put("result", result);
	 
	 return map;
 }
 //아이디 비번 체크 js
 @RequestMapping("login_check.do")
 @ResponseBody
 public Map<String, String> login(String userid,String pwd){
	 
	 MemberVO basevo = new MemberVO();
	 basevo.setUserid(userid);
	 basevo.setPwd(pwd);
	 MemberVO vo = member_dao.pwd_check(basevo);
	 
	 String result = "no"; 
	 if(vo == null) {	//중복조회를 통해서 회원가입이 가능한 상태
		 result ="yes";
	 }
	 
	 
	 Map<String, String> map = new HashMap<String, String>();
	 map.put("result", result);
	 
	 return map;
 }
 //로그인 폼 1 단순 이동
 	@RequestMapping("login_form_1.do")
 	public String login_form_1() {
 		
 		 
 		return MyCommon.VIEW_PATH+"login_form_1.jsp";
 	}
 	//아이디가 있다면 로그인폼1_1이동
 	@RequestMapping("login_form_1_1.do")
 	public String login_form_1_1(Model model, String userid) {
 		
 		MemberVO vo = member_dao.id_check(userid);
 		//계정 정보 바인딩
 		model.addAttribute("vo",vo);
 		
 		return MyCommon.VIEW_PATH+"login_form_1_1.jsp";
 	}
 	//아이디가 있다면 로그인폼2이동
 	@RequestMapping("login_form_2.do")
 	public String login_form_2(Model model, String userid) {
 		
 		MemberVO vo = member_dao.id_check(userid);
 		//계정 정보 바인딩
 		model.addAttribute("vo",vo);
 		
 		return MyCommon.VIEW_PATH+"login_form_2.jsp";
 	}
 	//아이디와 비번이 일치한다면 로그인 완료
 	@RequestMapping("login.do")
 	public String login_main(Model model, String userid) {
 		
 		MemberVO vo = member_dao.id_check(userid);
 		//계정 정보 바인딩
 		model.addAttribute("vo", vo);
 		

 		return MyCommon.VIEW_PATH+"main.jsp";
 	}
 	
 	//비밀번호 찾기 폼으로 이동
 	@RequestMapping("pwd_search.do")
 	public String pwd_search(Model model,String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		
 		//개인정보 보호를 위해 이름 및 이메일 중간을 *으로 표시
 		String first_name = vo.getFirst_name();
 		first_name = first_name.replace(first_name.charAt(0),'*');
 		vo.setFirst_name(first_name);
 		String email = vo.getEmail();
 		for(int i=0; i < email.length();i++) {
 			if(email.charAt(i) == '@') {
 				for(int j=2 ;j<i; j++) {
 					email = email.replaceFirst(String.valueOf(email.charAt(j)), "*");
 				}
 			}
 		}
 		vo.setEmail(email);
 		//바인딩
 		model.addAttribute("vo", vo);
 		return MyCommon.VIEW_PATH+"pwd_search.jsp";
 	}

 	//비밀번호 찾기에서 비밀번호 변경
 	@RequestMapping("modi_pwd.do")
 	public String modi_pwd(Model model, String modi_pwd, int idx,String userid) {
 		
 		//바뀐비밀번호을 받기위해 baseVO선언
 		MemberVO baseVO = new MemberVO();
 		
 		baseVO.setUserid(userid);
 		baseVO.setPwd(modi_pwd);
 		baseVO.setIdx(idx);
 		
 		int res =member_dao.pwd_modi(baseVO);
 		
 		
 		
 		return "redirect:succes_modi_pwd.do?userid="+userid;
 	}
 	
 	//비번찾기에서 비밀번호변경 완료 폼 이동
 	@RequestMapping("succes_modi_pwd.do")
 	public String succes_modi_pwd(Model model, String userid) {
 		
 		
 		MemberVO vo = member_dao.id_check(userid);
 		//계정 정보 바인딩
 		model.addAttribute("vo", vo);
 
 		
 		return MyCommon.VIEW_PATH+"modi_pwd_succes.jsp";
 		
 	}
 	
 	//회원정보관리 폼으로 이동
 	@RequestMapping("member_modi_form.do")
 	public String member_modi_form(Model model,String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		
 		//바인딩
 		model.addAttribute("vo", vo);
 		return MyCommon.VIEW_PATH+"member_modi_form.jsp";
 	}
 	
 	//계정 탈퇴 동의 폼으로 이동
 	@RequestMapping("del_member_agree.do")
 	public String del_member_agree(Model model,String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		
 		//바인딩
 		model.addAttribute("vo", vo);
 		return MyCommon.VIEW_PATH+"del_member_agree.jsp";
 		
 	}
 	
 	//회원탈퇴 진행
 	@RequestMapping("del.do")
 	@ResponseBody
 	public Map<String, String>  del(String userid){
 		
 		//회원정보 가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		
 		int res = member_dao.del_member(vo);
 		 
 		String result = "no"; 
 		
 		 if(vo == null) {	//중복조회를 통해서 회원가입이 가능한 상태
 			 result ="yes";
 		 }
 		 
 		 
 		 Map<String, String> map = new HashMap<String, String>();
 		 map.put("result", result);
 		 
 		 return map;
 		
 		
 	}
 	
 	//계정정보 변경
 	@RequestMapping("modi_member")
 	public String modi_member(Model model, String userid,
 			String pwd, String last_name, String first_name, String phone, String email) {
 		
 		//회원정보가져오기
 		MemberVO basevo = member_dao.id_check(userid);
 		
 		basevo.setPwd(pwd);
 		basevo.setFirst_name(first_name);
 		basevo.setLast_name(last_name);
 		basevo.setPhone(phone);
 		basevo.setEmail(email);
 		
 		int res = member_dao.modi_member(basevo);
 		
 		//바인딩
 		model.addAttribute("vo", basevo);
 		return MyCommon.VIEW_PATH+"member_modi_form.jsp";
 	}
 	
 	@RequestMapping("myorder.do")
 	public String myorder(Model model, String userid) {
 		
 		
 		
 		//buy에서 구입한 품목 가져오기
 		List<BuyVO> list =  buy_dao.b_list(userid);
 		
 		//리스트에 바인딩
 		model.addAttribute("list",list);
 		
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"myorder.jsp";
 	}
 	

 	@RequestMapping("addr_form.do")
 	public String addr_form(Model model, String userid) {
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"addr_form.jsp";
 			
 		
 	}
 	
 	@RequestMapping("add_adrr_form.do")
 	public String add_adrr_from(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"addr_form_1.jsp";
 	}
 	
 	@RequestMapping("addr_modi.do")
 	@ResponseBody
 	public Map<String, String> addr_modi(String userid, String addr1, String addr2, String addr3){
 		
 		
 		//회원정보 가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		
 		String addr = addr1+addr2+addr3;
 		
 		vo.setAddr(addr);
 		
 		int res = member_dao.addr_modi(vo);
 		 
 		String result = "no"; 
 		
 		 if(res>=1) {	//중복조회를 통해서 회원가입이 가능한 상태
 			 result ="yes";
 		 }
 		 
 		 
 		 Map<String, String> map = new HashMap<String, String>();
 		 map.put("result", result);
 		 
 		 return map;	
 		
 		
 	}
 	
 	@RequestMapping("profile.do")
 	public String profile(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		
 		return MyCommon.VIEW_PATH+"profile.jsp";
 	}
 	
 	@RequestMapping("favorites.do")
 	public String favorites(Model model,String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"favorites.jsp";
 		
 	}
 	
 	//결제수단관리페이지 단순 이동
 	@RequestMapping("payment_method.do")
 	public String payment_method(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"payment_method.jsp";
 		
 	}
 	
 	//구매 맞춤 정보 설정 사이트로 이동
 	@RequestMapping("communication_preferences.do")
 	public String communication_prefereces(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"communication_preferences.jsp";
 	}
 	
 	@RequestMapping("shop_preferences.do")
 	public String shop_preferences(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"shop_preferences.jsp";
 		
 	}
 	
 	@RequestMapping("privacy.do")
 	public String privacy(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"privacy.jsp";
 		
 	}
 	@RequestMapping("profile_visibility.do")
 	public String profile_visibility(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"profile_visibility.jsp";
 		
 	}
 	@RequestMapping("linked_accounts.do")
 	public String linked_accounts(Model model, String userid) {
 		
 		//회원정보가져오기
 		MemberVO vo = member_dao.id_check(userid);
 		//바인딩
 		model.addAttribute("vo", vo);
 		
 		return MyCommon.VIEW_PATH+"linked_accounts.jsp";
 		
 	}
 	
 	
	
}
