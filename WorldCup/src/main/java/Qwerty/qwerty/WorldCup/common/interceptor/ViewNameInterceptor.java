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
	
	// request ��ü���� URL ��û���� ������ .do�� ������ ��û���� ���ϴ� �޼ҵ�
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
				begin = contextPath.length(); // ��ü ��û���� ���̸� ����
			}
			int end;
			if (uri.indexOf(";") != -1) {
				end = uri.indexOf(";"); // ��û uri�� ;�� ���� ��� ;������ ��ġ�� ����
			} else if (uri.indexOf("?") != -1) {
				end = uri.indexOf("?"); // ��û uri�� ?�� ���� ��� ?������ ��ġ�� ����
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
