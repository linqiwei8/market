package com.market.service.impl;

import com.market.bean.Supplier;
import com.market.dao.SupplierMapper;
import com.market.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: linqiwei
 * @createDate: 2020/7/29
 * @version: 1.0
 */
@Service
public class SupplierServiceImpl implements SupplierService {
    @Autowired
    private SupplierMapper supplierMapper;

    @Override
    public List<Supplier> selectAll() {
        return this.supplierMapper.selectByExample();
    }

/*    @Override
    public long selectCount() {
        return this.supplierMapper.selectCount();
    }*/

    @Override
    public Supplier selectByPrimaryKey(Integer id) {
        return this.supplierMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Supplier> selectByName(String name) {

        return this.supplierMapper.selectByName(name);
    }

    @Override
    public int insertSupplier(Supplier supplier) {
        return this.supplierMapper.insertSupplier(supplier);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return this.supplierMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateSupplier(Supplier supplier) {
        return this.supplierMapper.updateSupplier(supplier);
    }

}