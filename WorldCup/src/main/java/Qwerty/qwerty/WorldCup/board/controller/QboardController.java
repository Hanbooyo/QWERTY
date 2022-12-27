package Qwerty.qwerty.WorldCup.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface QboardController {
	public ModelAndView listArticles(HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView viewArticle(@RequestParam("q_ano") int q_ano,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewArticle(@RequestParam("i_name") String i_name,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception;
	
	public ResponseEntity removeArticle(@RequestParam("q_ano") int q_ano, 
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView replyForm(@RequestParam("q_pno") int q_pno,
			@RequestParam("i_num") int i_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
			
	public ResponseEntity addReply(@RequestParam("i_name") String i_name,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
