package com.offcn.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String uri = request.getRequestURI();

        if(uri.endsWith(".js") || uri.endsWith(".css") ||
                uri.endsWith(".jpg") || uri.endsWith(".png") || uri.endsWith("login")){
            return true;
        }
        HttpSession session = request.getSession();
        Object emp = session.getAttribute("emp");
        if(emp == null){

            response.sendRedirect("/login.jsp");

            return false;
        }else {
            return true;
        }


    }


}
