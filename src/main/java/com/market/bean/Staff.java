package com.market.bean;

import java.util.Date;
/**
 * @description:员工实体
 * @author: linqiwei
 * @createDate: 2020/7/29
 * @version: 1.0
 */

public class Staff {

    private Integer id;

    private String name;

    private String sex;


    private Integer salary;

    private String tel;

    private String address;

    private String position;

    private Date begindate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Date getBegindate() {
        return begindate;
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", salary=" + salary +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", position='" + position + '\'' +
                ", begindate=" + begindate +
                '}';
    }
}