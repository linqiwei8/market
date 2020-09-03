package com.market.service;

import com.market.bean.User;

import java.util.List;

public interface UserService {
    public User login(User user);
    public int updatePassword(User user);
    public int addUser(User user);
    public User selectByUserName(String username);
}
