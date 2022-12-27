package Qwerty.qwerty.WorldCup.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("farticleVO")
public class FarticleVO {
	private String id;
	private int f_aNo;
	private int f_pNo;
	private String f_title;
	private String f_content;
	private String f_img;
	private Date f_date;
	


	

	public FarticleVO(String id, int f_aNo, int f_pNo, String f_title, Date f_date) {
		super();
		this.id = id;
		this.f_aNo = f_aNo;
		this.f_pNo = f_pNo;
		this.f_title = f_title;
		this.f_date = f_date;
	}



	public FarticleVO(String id, int f_aNo, int f_pNo, String f_title, String f_content, String imageFileName,
			String f_img) {
		super();
		this.id = id;
		this.f_aNo = f_aNo;
		this.f_pNo = f_pNo;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_img = f_img;
	}
	
	
	
	public FarticleVO(String id, String f_content, Date f_date) {
		super();
		this.id = id;
		this.f_content = f_content;
		this.f_date = f_date;
	}


	
	public FarticleVO() {
		
	}

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public int getF_aNo() {
		return f_aNo;
	}



	public void setF_aNo(int f_aNo) {
		this.f_aNo = f_aNo;
	}



	public int getF_pNo() {
		return f_pNo;
	}



	public void setF_pNo(int f_pNo) {
		this.f_pNo = f_pNo;
	}



	public String getF_title() {
		return f_title;
	}



	public void setF_title(String f_title) {
		this.f_title = f_title;
	}



	public String getF_content() {
		return f_content;
	}



	public void setF_content(String f_content) {
		this.f_content = f_content;
	}



	public String getF_img() {
		return f_img;
	}



	public void setF_img(String f_img) {
		this.f_img = f_img;
	}



	public Date getF_date() {
		return f_date;
	}



	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}

	public String getImageFileName() {
		try {
			if(f_img != null && f_img.length() != 0) {
				f_img=URLDecoder.decode(f_img, "utf-8"); //이미지의 이름에 한글이나 특수문자가 들어갈 경우 load가 안될 수 있어서.
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println(e + " 이미지 파일 에러 ");
		}
		return f_img;
	}

	public void setImageFileName(String f_img) {
		try {
			if(f_img != null && f_img.length() != 0) {
				this.f_img = URLEncoder.encode(f_img, "utf-8"); //마찬가지
			}else {
				this.f_img=null;
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println("이미지 파일이름 저장 중 에러");
		}
	}

	

}
