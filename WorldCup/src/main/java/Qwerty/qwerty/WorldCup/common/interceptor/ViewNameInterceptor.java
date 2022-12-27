package Qwerty.qwerty.WorldCup.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			String viewName=getViewName(request);
			request.setAttribute("viewName", viewName);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
	// request 객체에서 URL 요청명을 가져와 .do를 제외한 요청명을 구하는 메소드
		private String getViewName(HttpServletRequest request) throws Exception {
			String contextPath = request.getContextPath();
			String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
			if (uri == null || uri.trim().equals("")) {
				uri = request.getRequestURI();
			}
			// http://127.0.0.1:8090/springMVC/member/login.do
			// http://127.0.0.1:8090/springMVC/member/memberInfo.do
			int begin = 0;
			if (!(contextPath == null) || ("".equals(contextPath))) {
				begin = contextPath.length(); // 전체 요청명의 길이를 구함
			}
			int end;
			if (uri.indexOf(";") != -1) {
				end = uri.indexOf(";"); // 요청 uri에 ;가 있을 경우 ;문자의 위치를 구함
			} else if (uri.indexOf("?") != -1) {
				end = uri.indexOf("?"); // 요청 uri에 ?가 있을 경우 ?문자의 위치를 구함
			} else {
				end = uri.length();
			}
			String fileName = uri.substring(begin, end);
			if (fileName.lastIndexOf(".") != -1) {
				fileName = fileName.substring(0, fileName.lastIndexOf("."));
			}
			if (fileName.lastIndexOf("/") != -1) {
				fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
			}
			return fileName;
		}
	
}
