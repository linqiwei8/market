package com.market.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * @author: linqiwei
 * @createDate: 2020/7/28
 * @version: 1.0
 */
public class Result<T> {

    private int code = 0;
    private String msg = "success";
    private long count = 0;
    private List<T> data = new ArrayList<T>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }


}
