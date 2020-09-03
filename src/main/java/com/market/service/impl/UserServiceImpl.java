package com.market.service.impl;

import com.market.service.UserService;
import com.market.bean.User;
import com.market.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    public User login(User user) {
        // TODO Auto-generated method stub
        User loginUser=this.userMapper.login(user);
        return loginUser;
    }
    @Override
    public int updatePassword(User user) {
        // TODO Auto-generated method stub
        return this.userMapper.updatePassword(user);
    }

    @Override
    public int addUser(User user) {
        return this.userMapper.addUser(user);
    }

    @Override
    public User selectByUserName(String username) {
        return this.userMapper.selectByUserName(username);
    }

}
