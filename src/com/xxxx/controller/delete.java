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

@WebServlet(name = "Delete",urlPatterns = "/delete")
public class delete extends HttpServlet {
    @Autowired
    public UserService userService=new UserService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Integer count=0;
        String[] ids =request.getParameter("sids").split(",");
        if (ids==null)return;
        for (int i=0;i<ids.length;i++)
        {
            try {
                count+= userService.deleteAll(Integer.valueOf(ids[i]));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        if (count!=0)
        {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
//        idscopy=ids;
//        if (ids==null)ids=idscopy;
//        String[]temp=ids.split(",");
//        for (int i=0;i<temp.length;i++)
//        {
//            System.out.println(temp[i]+"second");
//        }
//        Integer[] idsarr={51,52,53};
//        for (int i=0;i<temp.length;i++)
//        {
//            idsarr[i]=Integer.valueOf(temp[i]);
//            System.out.println(idsarr[i]+"third");
//        }
//        System.out.println("别报错");
//        Integer resault= userService.deleteAll(idsarr);

//        if (resault!=0)
//        {
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//        }
    }
}
