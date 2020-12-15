package com.offcn.dao;

import com.offcn.bean.EmployeeBean;

import java.util.List;
import java.util.Map;

public interface EmployeeDao {
    List<Map<String,Object>> findAllEmpBycondition(Map<String,Object> condition);

    List<String> findColumnId();

    int addEmployee(Map<String,Object> addList);

    int deleteEmp(int eid);

    Map<String,Object> findEmpByEid(int eid);

    int updataEmployee(Map<String,Object> newEmp);

}
