package com.offcn.dao;

import com.offcn.bean.EmployeeBean;

import java.util.List;
import java.util.Map;

public interface LoginDao {

    int add(EmployeeBean emp);

    EmployeeBean findEmpByUsernameAndPassword(EmployeeBean emp);

    EmployeeBean findEmpByUsername(String username);

    List<Map<String,Object>> findEmpMessageByUsername(String username);
}
