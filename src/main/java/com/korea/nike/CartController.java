package com.korea.nike;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.BuyDAO;
import dao.CartDAO;
import dao.MarketDAO;
import dao.MemberDAO;
import vo.CartVO;

@Controller
public class CartController {

	 MemberDAO member_dao;
	 MarketDAO market_dao;
	 BuyDAO buy_dao;
	 CartDAO cart_dao;
	 
	 public void setBuy_dao(BuyDAO buy_dao) {
		this.buy_dao = buy_dao;
	}
	 
	 public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	 
	 public void setMarket_dao(MarketDAO market_dao) {
		this.market_dao = market_dao;
	}
	 
	 public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	 
	 @RequestMapping("cart_add.do")
	 @ResponseBody
	 public Map<String, String> cart_add(int product_id, int p_price, String p_size, String p_material, String p_name, String filename, String userid) {
		
		 
		 int res = 0;
		 
		 
		 CartVO cartvo = new CartVO();
		
		 //cartvo.setCart_quantity(cart_quantity);
		 cartvo.setFilename(filename);
		 cartvo.setP_price(p_price);
		 cartvo.setP_material(p_material);
		 cartvo.setP_name(p_name);
		 cartvo.setP_size(p_size);
		 cartvo.setUserid(userid);
		 cartvo.setProduct_id(product_id);
		 
		 CartVO basevo = cart_dao.cart_check(cartvo); 
		 
		 //basevo가 존재한다면 기존 카트에 수량을 1 추가하는 코드 작성
		 if(basevo != null) {
			 res = cart_dao.cart_up(cartvo);
		 }
		 else {	//카트가 기존에 존재하지않는다면 새 카트 생성
			 res = cart_dao.cart_add(cartvo);	 
		 }
		 
		 String result = "no";	 
			 if(res >= 1) {	
				  result ="yes";
			 }
			 
			 
			 Map<String, String> map = new HashMap<String, String>();
			 map.put("result", result);
			 
			 return map;
	 }
	 
	 //수량 변경
	 @RequestMapping("count.do")
	 @ResponseBody
	 public Map<String, String> count(String userid,int cart_quantity,int product_id){
		 
		 int res=0;
		 
		 
		 CartVO vo = new CartVO();
		 
		 vo.setUserid(userid);
		 vo.setCart_quantity(cart_quantity);
		 vo.setProduct_id(product_id);
				 
		 
		res = cart_dao.update_count(vo);
		 
		 String result = "no";	 
		 if(res >= 1) {	
			  result ="yes";
		 }
		 
		 
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("result", result);
		 
		 return map;
		 
	 }
	 
		// 장바구니  삭제
		@RequestMapping("/c_del.do")
		@ResponseBody
		public String delete(String userid, int cart_id) {
			 
			HashMap<String, Object> map = new HashMap<String, Object>();
			 
			map.put("userid", userid);
			map.put("cart_id", cart_id);
			 
			int res = cart_dao.delete(map);
			 
			String result = "no";
			String resultFn = String.format("[{'param':'%s'}]", result);
			 
			if(res > 0) {
				result = "yes";
				resultFn = String.format("[{'param':'%s'}]", result);
				return resultFn;
			} else {
				
			return resultFn;
		}
	 
	 
	
		}
}
