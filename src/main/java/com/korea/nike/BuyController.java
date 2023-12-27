package com.korea.nike;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BuyDAO;
import dao.CartDAO;
import dao.MarketDAO;
import dao.MemberDAO;
import util.MyCommon;
import vo.BuyVO;
import vo.CartVO;
import vo.MemberVO;

@Controller
public class BuyController {
	
	 @Autowired
	 HttpServletRequest request;
	 
	 @Autowired
	HttpSession session;
	 
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
	
	@RequestMapping("b_del.do")
	@ResponseBody
	public Map<String, String> b_del(String orderid){
		
		
		int res = buy_dao.b_del(orderid);
		
		String result = "no"; 
		if(res >= 1) {	//중복조회를 통해서 회원가입이 가능한 상태
			  result ="yes";
		 }
		 
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("result", result);
		 
		 return map;
		
	}
	
	@RequestMapping(value= {"buy_main.do"})
	public String main(Model model, String userid) {
		
	
	
	//계정정보 저장
	MemberVO vo = member_dao.id_check(userid);
	
	
	List<CartVO> va = cart_dao.selectList(userid);
	List<CartVO> list_subprice = cart_dao.subprice(userid);


	
	CartVO total  = cart_dao.total(userid);
	model.addAttribute("total",total);
	model.addAttribute("va",va);
	model.addAttribute("sub", list_subprice);
	
	

	//계정 정보 바인딩
	model.addAttribute("vo", vo);	
		
	//BuyVO buyvo = buy_dao.b_one_list(userid);
	
	//여기는 장바구니 상품 조회
	//List<Map<String, String>> productList = buy_dao.getProductList(userid);
	
	/* ProductVO productvo = buy_dao.total_price(userid); */
	
	
	/* model.addAttribute("productvo",productvo); */
	//model.addAttribute("buyvo",buyvo);
	//model.addAttribute("productList", productList);
	
	return MyCommon.VIEW_PATH + "buy_main.jsp";
	}

	
	
	
	
	@RequestMapping(value= {"buy_main_2.do"})
	public String main2(Model model, String userid) {
		
		//계정정보 저장
		MemberVO vo = member_dao.id_check(userid);
		
		
		BuyVO buyvo = new BuyVO();
		
		//총가격
		CartVO total  = cart_dao.total(userid);
		//상품당가격
		List<CartVO> list_subprice = cart_dao.subprice(userid);
		
		List<CartVO>  cart_list = cart_dao.selectList(userid);
		
		
		model.addAttribute("total",total);
		model.addAttribute("va",cart_list);
		model.addAttribute("vo",vo);
		model.addAttribute("buyvo",buyvo);
		model.addAttribute("sub", list_subprice);

		return MyCommon.VIEW_PATH +"buy_main_2.jsp";
		
	}
	
	
	
	 
	 
}
