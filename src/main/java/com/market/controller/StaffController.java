package com.market.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.market.bean.Result;
import com.market.bean.Staff;
import com.market.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLDecoder;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @description:员工控制层
 * @author: linqiwei
 * @createDate: 2020/7/28
 * @version: 1.0
 */
@Controller
@RequestMapping("/staff")
public class StaffController {

    @Autowired
    private StaffService staffService;

    /*跳转员工信息界面*/
    @RequestMapping("/tostaffbill")
    public String toStaffBill() {
        return "staffMain";

    }

    @RequestMapping("totest")
    public String toTest() {
        return "kkk";
    }

    /*查询员工所有信息*/
    @RequestMapping("/toSelectAllStaff")
    @ResponseBody
    public Result<Staff> selectAll(Integer page, Integer limit, String name, Model mode) {
        //System.out.println(page);
        //System.out.println(limit);
        Result<Staff> result = new Result<>();
        List<Staff> data = new ArrayList<Staff>();
        /*根据姓名查询*/
        if (name != null && name.trim().length() != 0) {
            data = selectByName(name);
            if (data.isEmpty() == true) {
                result.setCode(200);
                result.setMsg("该员工数据不存在，请检查姓名是否正确！");
            }
            result.setData(data);
        } else {
            /*
             * 紧跟着PageHelper的第一个select方法会被分页
             *page:当前页码  limit:每页条数
             *  */
            PageHelper.startPage(page, limit);
            data = this.staffService.selectAll();

            result.setData(data);
        }
        //获取分页相关数据
        PageInfo<Staff> staffPageInfo = new PageInfo<>(result.getData());
        long count = staffPageInfo.getTotal();
        result.setCount(count);
        return result;
    }

    @RequestMapping("/list")
    @ResponseBody
    public void delBySelect(String listId) {
        System.out.println(listId);
    }

    /*添加新员工
     * @param staff 新员工信息
     * @throw staff 如果为空 则抛出异常
     * */
    @RequestMapping("/toInsertStaff")
    @ResponseBody
    public int insertStaff(Staff staff) {
        if (staff == null) {
            throw new NullPointerException();
        }

        int res = this.staffService.insertStaff(staff);
        return res;
    }

    /*跳转员工信息添加界面*/
    @RequestMapping("/toinsertStaffBill")
    public String toinsertStaffBill() {
        return "insertStaffBill";
    }

    /*跳转员工信息编辑界面*/
    @RequestMapping("/toupdateStaffBill")
    public String toupdateStaffBill(Integer id, Model model) {
        Staff staff = this.staffService.selectByPrimaryKey(id);
        model.addAttribute("staff", staff);
        return "updateStaffBill";
    }

    /*编辑员工信息*/
    @RequestMapping("/toEditStaff")
    @ResponseBody
    public int toEditStaff(Staff staff) {
        if (staff == null) {
            System.out.println("员工对象空指针");
            throw new NullPointerException();
        }
        //System.out.println(staff);
        int res = this.staffService.updateStaff(staff);
        //System.out.println("修改返回"+res);
        return res;
    }

    /*根据姓名查询
     * @param 姓名
     * @throw null 没有该用户
     * */
    public List<Staff> selectByName(String name) {
        if (name == null) {
            throw new NullPointerException();
        }
        List<Staff> staff = this.staffService.selectByName(name);
        if (staff != null) {
            return staff;
        }
        return null;
    }

    /*根据id删除信息
     * @param id 员工id
     * @throw null 没有该用户
     * */
    @RequestMapping("/toDelStaff")
    @ResponseBody
    public int delByid(Integer id) {
        if (id == 0) {
            return 0;
        }
        int res = this.staffService.deleteByPrimaryKey(id);
        return res;
    }

    @RequestMapping("/delAll")
    @ResponseBody
    public int delAll(@RequestBody String listId) {

        List<Integer> listId1 = JSON.parseArray(JSON.parseObject(listId).getString("listId"),java.lang.Integer.class);
        System.out.println(listId1);
        int res = this.staffService.deletList(listId1);
        return res;
    }

}
