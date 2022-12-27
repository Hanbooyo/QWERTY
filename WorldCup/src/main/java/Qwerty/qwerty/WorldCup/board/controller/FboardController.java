package Qwerty.qwerty.WorldCup.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import Qwerty.qwerty.WorldCup.board.vo.FarticleVO;

public interface FboardController {

	public ModelAndView listArticles(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ResponseEntity addArticle(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception;	
	
	public ModelAndView viewArticle(@RequestParam("f_aNo") int f_aNo,
			HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	public ModelAndView modArticle(@ModelAttribute("farticleVO") FarticleVO farticleVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView removeArticle(@RequestParam("f_aNo") int f_aNo,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public  ModelAndView addReply(@ModelAttribute("farticleVO") FarticleVO farticleVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public  ModelAndView searchArticle(@RequestParam("search")String search,HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
}
