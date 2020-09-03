package com.market.service;


import com.market.bean.Staff;

import java.util.List;

public interface StaffService {
	public List<Staff> selectAll();
	//public long selectCount();
	public Staff selectByPrimaryKey(Integer id);
	public List<Staff> selectByName(String name);
	public int insertStaff(Staff staff);
	public int deleteByPrimaryKey(Integer id);
	public int updateStaff(Staff staff);
	public int deletList(List<Integer> list);
}
