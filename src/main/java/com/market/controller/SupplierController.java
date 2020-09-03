package com.market.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.market.bean.Result;
import com.market.bean.Supplier;
import com.market.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * @description:供应商控制层
 * @author: linqiwei
 * @createDate: 2020/7/29
 * @version: 1.0
 */
@Controller
@RequestMapping("/supplier")
public class SupplierController {


    @Autowired
    private SupplierService supplierService;

    /*跳转员工信息界面*/
    @RequestMapping("/tosupplierbill")
    public String toStaffBill(){
        return "supplierMain";

    }

    /*查询员工所有信息*/
    @RequestMapping("/toSelectAllSupplier")
    @ResponseBody
    public Result<Supplier> selectAll(Integer page, Integer limit, String name, Model mode) {
        Result<Supplier> result=new Result<>();
        List<Supplier> data=new ArrayList<Supplier>();
        /*根据姓名查询*/
        if (name!=null && name.trim().length()!=0) {
            data=selectByName(name);
            if (data.isEmpty() == true) {
                result.setCode(200);
                result.setMsg("该供应商数据不存在，请检查名称是否正确！");
            }
            result.setData(data);
        }else {
            /*
             * 紧跟着PageHelper的第一个select方法会被分页
             *page:当前页码  limit:每页条数
             *  */
            PageHelper.startPage(page, limit);
            data=this.supplierService.selectAll();
            result.setData(data);
        }
        //获取分页相关数据
        PageInfo<Supplier> staffPageInfo = new PageInfo<>(result.getData());
        long count=staffPageInfo.getTotal();
        result.setCount(count);
        return result;
    }


    /*添加供应商
     * @param 供应商
     * @throw supplier 如果为空 则抛出异常
     * */
    @RequestMapping("/toInsertSupplier")
    @ResponseBody
    public int  insertStaff(Supplier supplier) {
        if (supplier==null) {
            throw new NullPointerException();
        }

        int res=this.supplierService.insertSupplier(supplier);
        return res;
    }
    /*跳转员工信息添加界面*/
    @RequestMapping("/toinsertSupplierBill")
    public String  toinsertStaffBill(){
        return "insertSupplierBill";
    }

    /*跳转员工信息编辑界面*/
    @RequestMapping("/toupdateSupplierBill")
    public String  toupdateStaffBill(Integer id,Model model){
        Supplier supplier=this.supplierService.selectByPrimaryKey(id);
        model.addAttribute("supplier", supplier);
        return "updateSupplierBill";
    }
    /*编辑员工信息*/
    @RequestMapping("/toEditSupplier")
    @ResponseBody
    public int toEditStaff(Supplier supplier){
        if (supplier ==null) {
            throw new NullPointerException();
        }
        //System.out.println(supplier);
        int res =this.supplierService.updateSupplier(supplier);
        //System.out.println("修改返回"+res);
        return res;
    }
    /*根据名称查询
     * @param 姓名
     * @throw null 没有该用户
     * */
    public  List<Supplier> selectByName(String name) {
        if (name==null) {
            throw new NullPointerException();
        }
        List<Supplier> suppliers=this.supplierService.selectByName(name);
        if (suppliers!=null) {
            return suppliers;
        }
        return null;
    }
    /*根据id删除信息
     * @param id 供应商id
     * @throw null 没有该供应商
     * */
    @RequestMapping("/toDelSupplier")
    @ResponseBody
    public  int delByid(Integer  id) {
        if (id==0) {
            return 0;
        }
        int res=this.supplierService.deleteByPrimaryKey(id);
        return res;
    }


}
