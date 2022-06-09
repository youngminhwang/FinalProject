package web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor{
	private static Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("+ + + 인터셉터 시작 + + +");
		
		//세션
		HttpSession session = request.getSession();
		
		if(session.getAttribute("adminlogin")==null) {
			logger.info(">>접속 불가: 비로그인 상태");
			
			//메인페이지로 리다이렉트
//			response.sendRedirect("/admin/index");
			
			//에러페이지로 리다이렉트
			response.sendRedirect("/admin/error");
			
			//컨트롤러 접근 금지
			return false; //반환값이 불린인것을 이용해 접근을 금지한다
		}else {
			logger.info(">>로그인 상태");
			if(!((session.getAttribute("adminid")).toString()).contains("admin")) {
				logger.info(">>접속 불가: 비로그인 상태");
				
				//메인페이지로 리다이렉트
//				response.sendRedirect("/admin/index");
				
				//에러페이지로 리다이렉트
				response.sendRedirect("/admin/error");
				
				//컨트롤러 접근 금지
				return false; //반환값이 불린인것을 이용해 접근을 금지한다
			}
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
