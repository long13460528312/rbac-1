package com.offcn.service;

import com.offcn.bean.EmployeeBean;
import com.offcn.dao.LoginDao;
import com.offcn.myexception.UsernameException;
import com.offcn.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao dao;

    @Override
    public List<Map<String, Object>> login(EmployeeBean emp) {
        String s = emp.getPassword();
        String password = MD5Util.md5Encode(s);
        emp.setPassword(password);
        String username = emp.getUsername();
        EmployeeBean empByUsernameAndPassword = dao.findEmpByUsernameAndPassword(emp);
        if(empByUsernameAndPassword!=null) {
            List<Map<String,Object>> empMessageByUsername = dao.findEmpMessageByUsername(username);
            return empMessageByUsername;
        }else{
            return null;
        }
    }

    @Override
    public void regist(EmployeeBean emp,boolean flag) throws UsernameException {

        String username = emp.getUsername();
        EmployeeBean empbean = dao.findEmpByUsername(username);
        if(empbean!=null){
            throw new UsernameException("该用户名已存在");
        }
        if(flag){
            String s = emp.getPassword();
            String password = MD5Util.md5Encode(s);
            emp.setPassword(password);
            dao.add(emp);
        }

    }
}
