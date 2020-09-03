package com.market.controller;


import com.market.bean.User;
import com.market.service.UserService;
import com.market.tools.Constants;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @description:管理员控制层
 * @author: linqiwei
 * @createDate: 2020/7/28
 * @version: 1.0
 */

@Controller
@RequestMapping(value = "/admin")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
//		退出清除esison
        session.removeAttribute(Constants.Staff_SESSION);
        return "login";

    }

    /*
     * 登录
     *
     * */
    @RequestMapping(value = "/toLogin")
    public String toLogin(String loginid, String password, String verCode, HttpServletRequest request, Model model) {
        //登录用户
        User user = new User();
        user.setUsername(loginid);
        user.setPassword(password);
        if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            model.addAttribute("yzm", "验证码错误");
            return "login";
        } else {
            HttpSession session = request.getSession();
            User login = this.userService.login(user);
            if (login != null) {
                // 将用户对象添加到Session
                model.addAttribute("user", login);
                session.setAttribute("user", login);
                return "adminMain";
            }
            model.addAttribute("msg", "账号或密码错误，请重新输入！");
            // 返回到登录页面
            return "login";
        }

    }

    //验证码
    @RequestMapping("/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
        CaptchaUtil.out(request, response);
    }

    /*
     * 跳转密码界面
     * */
    @RequestMapping("/topassword")
    public String toPassword() {
        return "userPassword";
    }

    /*
     * 修改密码
     * */
    @RequestMapping("/updatePassword")
    @ResponseBody
    public String updatePassword(String pass, String pass2, HttpServletRequest request) {
        if (pass == null || pass2 == null) {
            return "false";
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (pass.equals(user.getPassword())) {
            user.setPassword(pass2);
            this.userService.updatePassword(user);
            return "true";
        } else
            return "false";
    }

    /*
     * 跳转添加管理员页面
     * */
    @RequestMapping("/toAddAdmin")
    public String toAddUser() {

        return "addUser";
    }

    @RequestMapping("/addAdmin")
    @ResponseBody
    public int addAdmin(String password, String username) {
        if(this.userService.selectByUserName(username) != null){
            return -1;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        int res = this.userService.addUser(user);
        return res;
    }
}
