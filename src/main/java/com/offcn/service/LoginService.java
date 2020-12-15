package com.offcn.service;

import com.offcn.bean.EmployeeBean;
import com.offcn.myexception.UsernameException;

import java.util.List;
import java.util.Map;

public interface LoginService {

    List<Map<String,Object>> login(EmployeeBean emp);

    void regist(EmployeeBean emp,boolean flag) throws UsernameException;

}
