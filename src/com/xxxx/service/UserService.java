package com.xxxx.service;

import com.xxxx.entity.DwnFile;
import com.xxxx.entity.User;
import com.xxxx.entity.vo.MessageModel;
import com.xxxx.mapper.DownloadFile;
import com.xxxx.mapper.UserMapper;
import com.xxxx.util.GetSqlSession;
import com.xxxx.util.StringUtil;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 业务逻辑
 */
public class UserService {
    /**
     * 用户登录
         1. 参数的非空判断
             如果参数为空
                将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
         2. 调用dao层的查询方法，通过用户名查询用户对象
         3. 判断用户对象是否为空
            如果为空，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
         4. 判断数据库中查询到的用户密码与前台传递过来的密码作比较
            如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
         5. 登录成功，成功状态、提示信息、用户对象设置消息模型对象，并return
     * @param uname
     * @param upwd
     * @return
     */
    public MessageModel userLogin(String uname, String upwd,boolean same) {
        MessageModel messageModel = new MessageModel();

        // 回显数据
        User u = new User();
        u.setUserName(uname);
        u.setUserPwd(upwd);
        messageModel.setObject(u);
        DwnFile d1=new DwnFile();
        DwnFile d2=new DwnFile();
        DwnFile d3=new DwnFile();



        //  1. 参数的非空判断
        if (StringUtil.isEmpty(uname) || StringUtil.isEmpty(upwd)) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户姓名和密码不能为空！");
            return  messageModel;
        }


        // 2. 调用dao层的查询方法，通过用户名查询用户对象
        SqlSession session= GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        User user = userMapper.queryUserByName(uname);
        DownloadFile downloadFile=session.getMapper(DownloadFile.class);
        DwnFile dwnFile1=downloadFile.queryFileById1(1);
        DwnFile dwnFile2=downloadFile.queryFileById2(2);
        DwnFile dwnFile3=downloadFile.queryFileById3(3);
        d1.setId(dwnFile1.id);
        d1.setDescription(dwnFile1.description);
        d1.setImage(dwnFile1.image);
        d1.setName(dwnFile1.name);
        d1.setPath(dwnFile1.path);
        d1.setSize(dwnFile1.size);
        d1.setStart(dwnFile1.start);
        d2.setId(dwnFile2.id);
        d2.setDescription(dwnFile2.description);
        d2.setImage(dwnFile2.image);
        d2.setName(dwnFile2.name);
        d2.setPath(dwnFile2.path);
        d2.setSize(dwnFile2.size);
        d2.setStart(dwnFile2.start);
        d3.setId(dwnFile3.id);
        d3.setDescription(dwnFile3.description);
        d3.setImage(dwnFile3.image);
        d3.setName(dwnFile3.name);
        d3.setPath(dwnFile3.path);
        d3.setSize(dwnFile3.size);
        d3.setStart(dwnFile3.start);
        messageModel.setFile1(d1);
        messageModel.setFile2(d2);
        messageModel.setFile3(d3);

        // 3. 判断用户对象是否为空
        if (user == null ) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户不存在！");
            return  messageModel;
        }

        // 4. 判断数据库中查询到的用户密码与前台传递过来的密码作比较
        if  (!upwd.equals(user.getUserPwd())) {
            // 如果不相等，将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            messageModel.setMsg("用户密码不正确！");
            return  messageModel;
        }
        if (same==false)
        {
            messageModel.setCode(0);
            messageModel.setMsg("验证码不正确");
            return  messageModel;
        }
        // 登录成功，将用户信息设置到消息模型中
        messageModel.setObject(user);
        messageModel.setFile1(dwnFile1);
        messageModel.setFile2(dwnFile2);
        messageModel.setFile3(dwnFile3);
        return messageModel;
    }
    public MessageModel userSignin(String name,String realname,String pwd,String addr,String email)
    {
        MessageModel messageModel=new MessageModel();
        User u=new User();
        u.setUserName(name);
        u.setRealName(realname);
        u.setUserPwd(pwd);
        u.setAddress(addr);
        u.setEmail(email);
        messageModel.setObject(u);
        if (StringUtil.isEmpty(name) || StringUtil.isEmpty(pwd)|| StringUtil.isEmpty(realname)|| StringUtil.isEmpty(addr)|| StringUtil.isEmpty(email)) {
            // 将状态码、提示信息、回显数据设置到消息模型对象中，返回消息模型对象
            messageModel.setCode(0);
            return  messageModel;
        }
        SqlSession session= GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        Integer resault=userMapper.insertinfo(u);
        session.commit();
        if (resault<=0)
        {
            messageModel.setCode(0);
        }
        return messageModel;
    }
    public List<User> selectall(User user)
    {
        SqlSession session= GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        List<User> list=userMapper.selectAll(user);
//        request.setAttribute("UserList",list);
//        response.sendRedirect("index.jsp");
        return list;
    }
    public Integer deleteAll(Integer item)
    {
        SqlSession session= GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);
        Integer resault=userMapper.dell(item);
        session.commit();
        return resault;
    }
}
