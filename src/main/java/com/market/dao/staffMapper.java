package com.market.dao;



import com.market.bean.Staff;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface staffMapper {

    List<Staff> selectByExample();

    Staff selectByPrimaryKey(Integer staffid);

   //long selectCount();

    List<Staff> selectByName(String name);

    int insertStaff(Staff staff);

     int deleteByPrimaryKey(Integer id);

     int updateStaff(Staff staff);

     int deletList(List<Integer> list);
}