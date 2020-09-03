package com.market.service.impl;


import com.market.bean.Staff;
import com.market.dao.staffMapper;
import com.market.service.StaffService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("staffBillService")
public class StaffserviceImp implements StaffService {
	@Autowired
	private staffMapper staffMapper;

	@Override
	public List<Staff> selectAll() {
		// TODO Auto-generated method stub
		return this.staffMapper.selectByExample();
	}

/*	@Override
	public long selectCount() {
		// TODO Auto-generated method stub
		return this.staffMapper.selectCount();
	}*/



	@Override
	public Staff selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		
		return this.staffMapper.selectByPrimaryKey(id);
	}

	@Override
	public  List<Staff> selectByName(String name) {

		return this.staffMapper.selectByName(name);
	}

	@Override
	public int insertStaff(Staff staff) {

		return this.staffMapper.insertStaff(staff);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {

		return this.staffMapper.deleteByPrimaryKey(id);
	}


	@Override
	public int updateStaff(Staff staff) {
		return  this.staffMapper.updateStaff(staff);
	}

	@Override
	public int deletList(List<Integer> list) {
		return this.staffMapper.deletList(list);
	}


}
