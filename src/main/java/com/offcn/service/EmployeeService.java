package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.EmployeeBean;
import org.omg.CORBA.ObjectHelper;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    PageInfo<Map<String,Object>> findEmpByCondition(Map<String,Object> condition);

    List<String> findColumnId();

    boolean addEmpList(Map<String, Object> addList);

    boolean deleteEmp(String ids);

    boolean deleteOneEmp(String eid);

    Map<String,Object> findEmpByEid(String e);

    boolean updataEmp(Map<String,Object> newEmp);

}
