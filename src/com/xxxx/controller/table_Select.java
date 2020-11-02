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
import java.util.List;

@WebServlet("/Selectall")
public class table_Select extends HttpServlet {
    private UserService userService=new UserService();
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String username=request.getParameter("in_username");
        String realname=request.getParameter("in_realname");
        String email=request.getParameter("in_email");
        String addr=request.getParameter("in_pro");
        if (username==null)username="";
        if (realname==null)realname="";
        if (email==null)email="";
        if (addr==null)addr="";
        User user=new User();
        user.setUserName("%"+username+"%");
        user.setRealName("%"+realname+"%");
        user.setEmail("%"+email+"%");
        user.setAddress("%"+addr+"%");
        List<User> userList=userService.selectall(user);
        request.setAttribute("UserList",userList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
