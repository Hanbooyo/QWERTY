package Qwerty.qwerty.WorldCup.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import Qwerty.qwerty.WorldCup.board.dao.QboardDAO;
import Qwerty.qwerty.WorldCup.board.service.QboardService;
import Qwerty.qwerty.WorldCup.board.vo.QboardVO;
import Qwerty.qwerty.WorldCup.member.vo.MemberVO;
import Qwerty.qwerty.WorldCup.shopping.Service.ShoppingService;

@Controller("qBoardController")
public class QboardControllerImpl implements QboardController {
	private static final String ART_IMAGE_REPO = "C:\\Boo\\upload_images2";
	@Autowired
	private QboardService qboardService;
	@Autowired
	private QboardDAO qboardDAO;
	@Autowired
	private QboardVO qboardVO;
	@Autowired
	private ShoppingService shoppingService;
	
	//��ü �Խñ� ����
	@Override
	@RequestMapping(value = "/qBoard/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt((_section == null ? "1" : _section));
		int pageNum = Integer.parseInt((_pageNum == null ? "1" : _pageNum));
		System.out.println(section + "se");
		System.out.println(pageNum + "pg");
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		int totArticles = qboardService.totArticles();
		pagingMap.put("section", section);
        pagingMap.put("pageNum", pageNum);
		List q_articleList = qboardService.listArticles(pagingMap);
		mav.addObject("totArticles",totArticles);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("q_articleList", q_articleList);
		System.out.println(q_articleList);
		mav.setViewName(viewName);
		return mav;
	}
	
	//�� �󼼺���
	@Override
	@RequestMapping(value = "/qBoard/viewArticle.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewArticle(int q_ano, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		qboardVO = qboardService.viewArticle(q_ano);
		mav.addObject("article", qboardVO);
		int i_num = qboardVO.getI_num();
		String i_name = shoppingService.itemName(i_num);
		mav.addObject("i_name", i_name);
		mav.setViewName(viewName);
		return mav;
	}
	
	//�� �ۼ� �������� �̵�
	@RequestMapping(value = "/qBoard/articleForm.do", method = RequestMethod.GET)
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List allItemList = new ArrayList();
		allItemList = shoppingService.allItemName();
		System.out.println(allItemList);
		mav.addObject("allItemList", allItemList);
		mav.setViewName(viewName);
		return mav;
	}
	
	//�� �߰�
	@Override
	@RequestMapping(value = "/qBoard/addArticle.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity addNewArticle(@RequestParam("i_name") String i_name, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		int i_num = shoppingService.itemNo(i_name);
		System.out.println("addArticle i_num = " + i_num);
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		String q_img = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("i_num", i_num);
		articleMap.put("q_pno", 0);
		articleMap.put("id", id);
		articleMap.put("q_img", q_img);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int q_ano = qboardService.addArticle(articleMap);
			if(q_img != null && q_img.length() != 0) {
				File srcFile = new File(ART_IMAGE_REPO + "\\temp\\" + q_img);
				File destDir = new File(ART_IMAGE_REPO + "\\" + q_ano);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += "alert('�� ���� �߰��߽��ϴ�');";
			message += "location.href = '" + multipartRequest.getContextPath() + "/qBoard/listArticles.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			File srcFile = new File(ART_IMAGE_REPO + "\\temp\\" + q_img);
			srcFile.delete();
			message = "<script>";
			message += "alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
			message += "location.href = '" + multipartRequest.getContextPath() + "/shop.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//�� ����
	@Override
	@RequestMapping(value = "/qBoard/modArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		String q_img = upload(multipartRequest);
		articleMap.put("q_img", q_img);
		String q_ano = (String)articleMap.get("q_ano");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			qboardService.modArticle(articleMap);
			if(q_img != null && q_img.length() != 0) {
				File srcFile = new File(ART_IMAGE_REPO + "\\temp\\" + q_img);
				File destDir = new File(ART_IMAGE_REPO + "\\" + q_ano);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				String originalFileName = (String) articleMap.get("originalFileName");
				File oldFile = new File(ART_IMAGE_REPO + "\\" + q_ano + "\\" + originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message += "alert('���� �����߽��ϴ�');";
			message += "location.href='" + multipartRequest.getContextPath() + "/qBoard/viewArticle.do?q_ano=" + q_ano + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ART_IMAGE_REPO + "\\temp\\" + q_img);
			srcFile.delete();
			message = "<script>";
			message += "alert('���� �����߽��ϴ�');";
			message += "location.href='" + multipartRequest.getContextPath() + "/qBoard/viewArticle.do?q_ano=" + q_ano + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//�� ����
	@Override
	@RequestMapping(value = "/qBoard/removeArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(int q_ano, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=utf-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			qboardService.removeArticle(q_ano);
			File destDir = new File(ART_IMAGE_REPO + "\\" + q_ano);
			FileUtils.deleteDirectory(destDir);
			message = "<script>";
			message += "alert('���� �����߽��ϴ�');";
			message += "location.href='" + request.getContextPath() + "/qBoard/listArticles.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			message = "<script>";
			message += "alert('���� �۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
			message += "location.href'" + request.getContextPath() + "/qBoard/listArticles.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//��� ���� �������� �̵�
	@Override
	@RequestMapping(value = "/qBoard/replyForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView replyForm(@RequestParam("q_pno") int q_pno,
			@RequestParam("i_num") int i_num, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("q_pno", q_pno);
		String i_name = shoppingService.itemName(i_num);
		mav.addObject("i_name", i_name);
		mav.setViewName(viewName);
		return mav;	
	}
	
	//��� ���� ���
	@Override
	@RequestMapping(value = "/qBoard/addReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity addReply(@RequestParam("i_name") String i_name, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		int i_num = shoppingService.itemNo(i_name);
		HttpSession session = multipartRequest.getSession();
		int q_pno = (Integer)session.getAttribute("q_pno");
		session.removeAttribute("q_pno");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		String q_img = upload(multipartRequest);
		session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("i_num", i_num);
		articleMap.put("q_pno", q_pno);
		articleMap.put("id", id);
		articleMap.put("q_img", q_img);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int q_ano = qboardService.addReply(articleMap);
			if(q_img != null && q_img.length() != 0) {
				File srcFile = new File(ART_IMAGE_REPO + "\\temp\\" + q_img);
				File destDir = new File(ART_IMAGE_REPO + "\\" + q_ano);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += "alert('����� �߰��߽��ϴ�');";
			message += "location.href = '" + multipartRequest.getContextPath() + "/qBoard/viewArticle.do?q_ano=" + q_ano + "';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			File srcFile = new File(ART_IMAGE_REPO + "\\temp\\" + q_img);
			srcFile.delete();
			message = "<script>";
			message += "alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
			message += "location.href = '" + multipartRequest.getContextPath() + "/shop.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	//���� ���ε� ����
		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
			String q_img = null;
			Iterator<String> fileNames = multipartRequest.getFileNames();
			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				q_img = mFile.getOriginalFilename();
				File file = new File(ART_IMAGE_REPO + "\\temp\\" + fileName);
				if(mFile.getSize() != 0) {
					if(! file.exists()) {
						file.getParentFile().mkdir();
					}
					mFile.transferTo(new File(ART_IMAGE_REPO + "\\temp\\" + q_img));
				}
			}
			return q_img;
		}
}
