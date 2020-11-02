package com.xxxx.mapper;

import com.xxxx.entity.User;

import java.util.List;

/**
 * 用户接口类
 */
public interface UserMapper {
    public User queryUserByName(String userName);

    public Integer insertinfo(User user);

    public List<User> selectAll(User user);

    public Integer dell(Integer item);
}


