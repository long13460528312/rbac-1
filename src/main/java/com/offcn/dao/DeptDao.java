package com.offcn.dao;

import com.offcn.bean.DeptBean;

import java.util.List;
import java.util.Map;

public interface DeptDao {

    List<DeptBean> findAllDept();

    int deleteDept(int deptno);

    DeptBean findDeptByDeptNo(int deptno);



}
