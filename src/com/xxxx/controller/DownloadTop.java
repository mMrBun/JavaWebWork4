package com.xxxx.controller;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

public class DownloadTop extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String path="/WEB-INF/武汉纺织大学2020年专升本新生健康承诺书.doc";
       String filename="武汉纺织大学2020年专升本新生健康承诺书.doc";
            response.setHeader("content-disposition","attachment;filename="+ URLEncoder.encode(filename,"UTF-8"));
        InputStream inputStream =this.getServletContext().getResourceAsStream(path);
        ServletOutputStream outputStream=response.getOutputStream();
        int len=-1;
        byte[]buf=new byte[1024];
        while((len=inputStream.read(buf))!=-1)
        {
            outputStream.write(buf,0,len);
        }
        inputStream.close();
        outputStream.close();
    }
}