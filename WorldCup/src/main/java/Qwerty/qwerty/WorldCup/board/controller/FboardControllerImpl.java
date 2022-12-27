package Qwerty.qwerty.WorldCup.board.controller;

import java.io.File;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import Qwerty.qwerty.WorldCup.board.service.FboardService;
import Qwerty.qwerty.WorldCup.board.vo.FarticleVO;
import Qwerty.qwerty.WorldCup.member.vo.MemberVO;

@Controller("fboardController")
public class FboardControllerImpl implements FboardController{
	private static final String ART_IMAGE_REPO="C:\\Boo\\upload_images";

	@Autowired
	private FboardService fboardService;
	
	@Autowired
	private FarticleVO farticleVO;
	
	@Override
	@RequestMapping(value = "/fBoard/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();	
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		int section = Integer.parseInt((_section == null ? "1" : _section));
		int pageNum = Integer.parseInt((_pageNum == null ? "1" : _pageNum));
		Map<String, Integer> pagingMap = new HashMap<String, Integer>();
		pagingMap.put("section", section);
        pagingMap.put("pageNum", pageNum);
        List articleList = fboardService.selectAllArticles(pagingMap);
        int totArticles = fboardService.totArticles();
        mav.addObject("totArticles" ,totArticles);
		mav.addObject("section", section);
		mav.addObject("pageNum", pageNum);
		mav.addObject("articleList", articleList);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/fBoard/FarticleForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		return mav;
		
	}

	@Override
	@RequestMapping(value = "/fBoard/viewArticle.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewArticle(@RequestParam("f_aNo") int f_aNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		farticleVO = fboardService.findArticle(f_aNo);
		List replyList = fboardService.findReplyList(f_aNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("replyList", replyList);
		mav.addObject("farticle" ,farticleVO);
		return mav;
	}

	@Override
	@RequestMapping(value = "/fBoard/modArticle.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modArticle(@ModelAttribute FarticleVO farticleVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/fBoard/removeArticle.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView removeArticle(@RequestParam("f_aNo") int f_aNo, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String) request.getAttribute("viewName");
		
		List<Integer> articleNoList = fboardService.removeArticle(f_aNo);
		for (int ano : articleNoList) {
			File imgDir = new File(ART_IMAGE_REPO + "\\" + ano);
			if (imgDir.exists()) { // ????????? ??? => ??????? ???? ???? ???????? ???????
				FileUtils.deleteDirectory(imgDir); // ??????? ????
			}
		}
		
		
		
		PrintWriter pw = response.getWriter();
		pw.print("<script>" + "  alert('???? ??????????.');" +  "</script>");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/fBoard/listArticles.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/fBoard/addArticle.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public ResponseEntity addArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>(); 
		// ???????? ??????????? hashMap, ??? String ???? Object?? ????, ????? ??? ??? ?? ???? ?? ?????
		Enumeration enu = multipartRequest.getParameterNames();
		//Enumeration?? ????? ???? ??????????? ????? ?? ???? ( ????? ???? ???? ?? ?? ???? )
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		String f_img = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member"); //member?????? ??????? MemberVO?? ????
		String id = memberVO.getId();
		articleMap.put("f_pNo", 0);
		articleMap.put("id", id);
		articleMap.put("f_img", f_img);
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int f_aNo = fboardService.addArticle(articleMap);
			System.out.println("addArticle ????" + f_aNo);
			if(f_img != null && f_img.length() != 0 ) {
				File srcFile=new File(ART_IMAGE_REPO + "\\temp\\" +  f_img);
				File destDir=new File(ART_IMAGE_REPO + "\\" +  f_aNo);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message="<script>";
			message+="alert('?????? ?????????');";
			message+="location.href='" + multipartRequest.getContextPath() + "/fBoard/listArticles.do'";
			message+="</script>";
			resEnt=new ResponseEntity (message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			System.out.println("addArticle ???????");
			File srcFile = new File(ART_IMAGE_REPO + "\\temp\\" + f_img);
			srcFile.delete();
			message="<script>";
			message+="alert('?????? ?????????. ??? ????? ?????');";
			message+="location.href='" + multipartRequest.getContextPath() + "/fBoard/FarticleForm.do'";
			message+="</script>";
			e.printStackTrace();
			resEnt=new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	
	
	private String upload(MultipartHttpServletRequest multipartRequest)throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames=multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName= mFile.getOriginalFilename();
			File file=new File(ART_IMAGE_REPO+"\\temp\\" + fileName);
			if(mFile.getSize() != 0) {
				if(! file.exists()) {
					file.getParentFile().mkdirs(); //??ο? ?????? ???? ????
				}
				mFile.transferTo(new File(ART_IMAGE_REPO + "\\temp\\" + imageFileName)); 	
			}
		}
		return imageFileName;
	}

	@Override
	@RequestMapping(value = "/fBoard/addReply.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addReply(@ModelAttribute("farticleVO") FarticleVO farticleVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String content = request.getParameter("f_content");
		String id = memberVO.getId();
		int f_pNo = farticleVO.getF_aNo();
		System.out.println("?θ???? : "+f_pNo);
		farticleVO.setId(id);
		farticleVO.setF_title("???");
		farticleVO.setF_pNo(f_pNo);
		farticleVO.setF_content(content);
		int result = fboardService.addReply(farticleVO);
		ModelAndView mav = new ModelAndView("redirect:/fBoard/viewArticle.do?f_aNo="+f_pNo);
		return mav;
	}
	
	@Override
	@RequestMapping(value= "/fBoard/search.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchArticle(@RequestParam("search") String search, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		return null;
	}



}
