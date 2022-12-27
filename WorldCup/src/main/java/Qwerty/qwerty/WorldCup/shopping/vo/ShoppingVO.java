package Qwerty.qwerty.WorldCup.shopping.vo;

import org.springframework.stereotype.Component;

@Component("shoppingVO")
public class ShoppingVO {
	private Integer i_num;
	private String i_name;
	private Integer i_price;
	private String i_content;
	private String i_img;
	private Integer i_amount;
	private String i_option;
	
	public ShoppingVO() {
		
	}
	
	public ShoppingVO(Integer i_num, String i_name, Integer i_price, String i_img) {
		super();
		this.i_num = i_num;
		this.i_name = i_name;
		this.i_price = i_price;
		this.i_img = i_img;
	}
	
	public ShoppingVO(String i_name, Integer i_price, String i_img) {
		super();
		this.i_name = i_name;
		this.i_price = i_price;
		this.i_img = i_img;
	}
	
	
	public ShoppingVO(Integer i_num, String i_name, Integer i_price, String i_content, String i_img, String i_option) {
		super();
		this.i_num = i_num;
		this.i_name = i_name;
		this.i_price = i_price;
		this.i_content = i_content;
		this.i_img = i_img;
		this.i_option = i_option;
	}

	public Integer getI_num() {
		return i_num;
	}
	public void setI_num(Integer i_num) {
		this.i_num = i_num;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public Integer getI_price() {
		return i_price;
	}
	public void setI_price(Integer i_price) {
		this.i_price = i_price;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	public String getI_img() {
		return i_img;
	}
	public void setI_img(String i_img) {
		this.i_img = i_img;
	}
	public Integer getI_amount() {
		return i_amount;
	}
	public void setI_amount(Integer i_amount) {
		this.i_amount = i_amount;
	}

	public String getI_option() {
		return i_option;
	}

	public void setI_option(String i_option) {
		this.i_option = i_option;
	}
	
	
}
