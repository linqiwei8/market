package com.market.service;

import com.market.bean.Supplier;

import java.util.List;

/**
 * @description:
 * @author: linqiwei
 * @createDate: 2020/7/29
 * @version: 1.0
 */
public interface SupplierService {
    public List<Supplier> selectAll();
   // public long selectCount();
    public Supplier selectByPrimaryKey(Integer id);
    public List<Supplier> selectByName(String name);
    public int insertSupplier(Supplier supplier);
    public int deleteByPrimaryKey(Integer id);
    public int updateSupplier(Supplier supplier);
}
