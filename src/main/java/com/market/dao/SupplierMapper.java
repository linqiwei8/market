package com.market.dao;

import com.market.bean.Supplier;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: linqiwei
 * @createDate: 2020/7/29
 * @version: 1.0
 */
@Repository
public interface SupplierMapper {
    List<Supplier> selectByExample();

    Supplier selectByPrimaryKey(Integer staffid);

    //long selectCount();

    List<Supplier> selectByName(String name);

    int insertSupplier(Supplier supplier);

    int deleteByPrimaryKey(Integer id);


    int updateSupplier(Supplier supplier);
}
