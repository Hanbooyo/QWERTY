package Qwerty.qwerty.WorldCup.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("qBoardVO")
public class QboardVO {
	private int level;
	private int q_ano;
	private int q_pno;
	private String q_title;
	private String q_content;
	private String q_img;
	private Date q_date;
	private int i_num;
	private int memNo;
	private String id;
	
	public QboardVO() {
		
	}

	
	public QboardVO(int level, int q_ano, int q_pno, String q_title, String q_content, String q_img, int i_num,
			int memNo, String id) {
		super();
		this.level = level;
		this.q_ano = q_ano;
		this.q_pno = q_pno;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_img = q_img;
		this.i_num = i_num;
		this.memNo = memNo;
		this.id = id;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getQ_ano() {
		return q_ano;
	}

	public void setQ_ano(int q_ano) {
		this.q_ano = q_ano;
	}

	public int getQ_pno() {
		return q_pno;
	}

	public void setQ_pno(int q_pno) {
		this.q_pno = q_pno;
	}

	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_img() {
		try {
			if(q_img != null && q_img.length() != 0) {
				q_img = URLDecoder.decode(q_img,"utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println("이미지 파일 이름 불러오기 중 에러!");
		}
		return q_img;
	}

	public void setQ_img(String q_img) {
		try {
			if(q_img != null && q_img.length() != 0) {
				this.q_img = URLEncoder.encode(q_img, "utf-8");						
			}else {
				this.q_img = null;
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println("이미지 파일 이름 저장 중 에러!");
		}
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
