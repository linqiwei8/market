package com.market.dao;

import com.market.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserMapper {

    /*addUser*/
    int addUser(User user);

    /*login*/
    User login(User user);

    //userlist
    List<User> userList();

    //selectById
    User selectByUserName(String username);

    //updateUser
    int updatePassword(User user);

    //deluser
    int deluser(Integer id);
    int updateByPrimaryKey(User record);
}
