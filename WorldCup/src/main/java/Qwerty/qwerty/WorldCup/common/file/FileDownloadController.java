package Qwerty.qwerty.WorldCup.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static String IMG_REPO_PATH = "C:\\Boo\\upload_images";
	private static String IMG_REPO_PATH2 = "C:\\Boo\\upload_images2";
	
	@RequestMapping("/fdownload") // �޼ҵ� ��������, �α����̳� �׷��� �ƴ϶�
	public void download(@RequestParam("f_img") String f_img, 
				@RequestParam("f_aNo") String f_aNo,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = IMG_REPO_PATH + "\\" + f_aNo + "\\" + f_img;
		File file=new File(downFile); //�ٿ�ε� ��ο� �Բ� �̹��� �̸�
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName=" + f_img);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer,0,count); //buffer�� ���� 0��°���� count��ŭ
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download") // �޼ҵ� ��������, �α����̳� �׷��� �ƴ϶�
	public void qdownload(@RequestParam("f_img") String f_img, 
				@RequestParam("f_aNo") String f_aNo,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = IMG_REPO_PATH2 + "\\" + f_aNo + "\\" + f_img;
		File file=new File(downFile); //�ٿ�ε� ��ο� �Բ� �̹��� �̸�
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment;fileName=" + f_img);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer,0,count); //buffer�� ���� 0��°���� count��ŭ
		}
		in.close();
		out.close();
	}
}
