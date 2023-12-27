package com.korea.nike;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.BuyDAO;
import dao.CartDAO;
import dao.MarketDAO;
import dao.MemberDAO;
import util.MyCommon;
import vo.CartVO;
import vo.MarketVO;
import vo.MemberVO;

@Controller
public class MarketController {
 
	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	MarketDAO market_dao;
	MemberDAO member_dao;
	BuyDAO buy_dao;
	CartDAO cart_dao;
	 
	 
	 public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	public void setBuy_dao(BuyDAO buy_dao) {
		this.buy_dao = buy_dao;
	}
	public void setMarket_dao(MarketDAO market_dao) {
		this.market_dao = market_dao;
	}
	
	public void setMember_dao(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	//마켓 메인페이지
	@RequestMapping("market.do")
	public String market_main(Model model, String userid) {
		
		//marketdao로부터 목록조회
		List<MarketVO> list = market_dao.selectList();
		
		//바인딩
		model.addAttribute("marketvo", list);
		
		if(userid ==null) {
			return MyCommon.MARKET_PATH+"market.jsp";
		}	
		else {
			
			
		//계정정보 저장
		MemberVO vo = member_dao.id_check(userid); 	
		
		//계정 정보 바인딩
		model.addAttribute("vo", vo);
		
		
		return MyCommon.MARKET_PATH+"market.jsp";
		}
	}
	
	//상품등록 페이지 이동
	@RequestMapping("p_insert.do")
	public String p_insert(Model model, String userid) {
		
		//계정정보 저장
		MemberVO vo = member_dao.id_check(userid); 	
		
		//계정 정보 바인딩
		model.addAttribute("vo", vo);
		
		return MyCommon.MARKET_PATH+"p_insert.jsp";
	}
	
	//파일 업로드
	@RequestMapping("/upload.do")
	public String upload(Model model, String userid, MarketVO filevo) {
		
		
		
		String webPath = "/resources/upload"; //우리가 실제로 접근해야하는 폴더
		
		
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
		//업로드 된 파일 정보
		
		MultipartFile photo = filevo.getPhoto();
		String filename = "no_file";
		
		if(!photo.isEmpty()) {
			
			//업로드될 실제 파일명
			filename = photo.getOriginalFilename();
			
			//파일을 저장할 경로
			File saveFile = new File(savePath,filename);
			
			//savePath경로까지 가서 filename이 있나 확인
			//없으면 만들어라
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				//동일한 이름의 파일일 경우 폴더형태로 변환이 불가하므로
				//업로드 시간을 붙여서 이름이 중복되는걸 방지
				//currentTimeMillis() 자바가 만들어진 1970년부터 현재 2022년 현재까지의 시간을
				//100분의1초로 저장하고 있습니다.
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time,filename);
				saveFile = new File(savePath,filename);
			}
			
			//실제로 파일을 업로드 하는 코드
			//물리적으로 파일을 업로드 하는 코드
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		filevo.setFilename(filename);
		
		int res = market_dao.p_insert(filevo);
		
		if(res>=1) {
		request.setAttribute("filevo", filevo);
		}
		
		//계정정보 저장
		MemberVO vo = member_dao.id_check(userid); 	
		
		//계정 정보 바인딩
		model.addAttribute("vo", vo);
		
		
		
		return "redirect:market.do?userid="+userid;
		
	}
	
	@RequestMapping("sorry.do")
	public String sorry(Model model, String userid) {
		
		if(userid ==null) {
			return MyCommon.VIEW_PATH+"sorry.jsp";
		}
		else {
			
		//계정정보 저장
		MemberVO vo = member_dao.id_check(userid);
		
		//계정 정보 바인딩
		model.addAttribute("vo", vo);
		
		
		return MyCommon.VIEW_PATH+"sorry.jsp";
		}
		
	}
	
	// 상품 상세 조회
	@RequestMapping("p_detail.do")
	public String product_detail(Model model,String userid, int product_id) {
		
		//계정정보 저장
		MemberVO vo = member_dao.id_check(userid);

		//계정 정보 바인딩
		model.addAttribute("vo", vo);
		
		
		// product_id에 해당하는 게시물 한건 조회 
		MarketVO marketvo = market_dao.selectOne(product_id);
		
		model.addAttribute("marketvo", marketvo);
		
		return MyCommon.MARKET_PATH+"p_detail.jsp";
	}
	
	// 장바구니 목록 조회
	@RequestMapping("cart.do")
	public String cart(Model model,String userid) {
		
		//계정정보 저장
		MemberVO vo = member_dao.id_check(userid);

		//계정 정보 바인딩
		model.addAttribute("vo", vo);
		
		// userid에 해당하는 장바구니 조회 
		List<CartVO> list = cart_dao.selectList(userid);
		
		
		//토탈값과 수량당 값 조회
		CartVO total  = cart_dao.total(userid);
		List<CartVO> list_subprice = cart_dao.subprice(userid);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		model.addAttribute("sub", list_subprice);
		

		return MyCommon.MARKET_PATH+"cart.jsp";
	}
	
}
