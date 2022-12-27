package Qwerty.qwerty.WorldCup.shopping.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	private int c_num;
	private String id;
	private int i_num;
	private int c_count;
	
	public CartVO() {
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
	}

	public int getC_count() {
		return c_count;
	}

	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	
}
