package com.xxxx.controller;

import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.mapper.UserMapper;
import com.xxxx.service.UserService;
import com.xxxx.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Signin")
public class SignServlet extends HttpServlet {
   private UserService userService=new UserService();
   @Override
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       String name=request.getParameter("sign_uname");
       String realname=request.getParameter("sign_realname");
       String pwd=request.getParameter("sign_pwd");
       String email=request.getParameter("sign_email");
       String str = new String(request.getParameter("sign_prow").getBytes("iso-8859-1"), "utf-8");
       String str1 = new String(request.getParameter("sign_city").getBytes("iso-8859-1"), "utf-8");
       String addr=str+str1;

       MessageModel messageModel=userService.userSignin(name,realname,pwd,addr,email);
       if (messageModel.getCode()==1)
       {
           response.sendRedirect("login.jsp");
       }






   }
}
