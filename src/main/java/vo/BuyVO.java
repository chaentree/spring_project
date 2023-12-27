package vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.web.multipart.MultipartFile;

public class BuyVO {
	private String filename,p_size, orderid, p_name,addr_user,userid, email,user_addr,user_phone,orderdate;
	private int p_price, b_count,deliverycost,ordersaleprice,ordersavepoint,orderfinalprice,product_id, order_info;
	private MultipartFile photo;
	
	
	
	
	public int getOrder_info() {
		return order_info;
	}
	public void setOrder_info(int order_info) {
		this.order_info = order_info;
	}
	public String getOrderid() {
		return orderid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getAddr_user() {
		return addr_user;
	}
	public void setAddr_user(String addr_user) {
		this.addr_user = addr_user;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public int getDeliverycost() {
		return deliverycost;
	}
	public void setDeliverycost(int deliverycost) {
		this.deliverycost = deliverycost;
	}
	public int getOrdersaleprice() {
		return ordersaleprice;
	}
	public void setOrdersaleprice(int ordersaleprice) {
		this.ordersaleprice = ordersaleprice;
	}
	public int getOrdersavepoint() {
		return ordersavepoint;
	}
	public void setOrdersavepoint(int ordersavepoint) {
		this.ordersavepoint = ordersavepoint;
	}
	public int getOrderfinalprice() {
		return orderfinalprice;
	}
	public void setOrderfinalprice(int orderfinalprice) {
		this.orderfinalprice = orderfinalprice;
	}

	

	@Override
	public String toString() {
	  return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
	}
	
	
	
	
	
}
