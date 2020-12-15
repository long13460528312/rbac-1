package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.EmployeeBean;
import com.offcn.dao.EmployeeDao;
import com.offcn.dao.EmproleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao dao;
    @Autowired
    private EmproleDao erdao;

    @Override
    public PageInfo<Map<String,Object>> findEmpByCondition(Map<String,Object> condition) {
        PageHelper.startPage((Integer) condition.get("pageNo"),3);
        List<Map<String,Object>> pageList = dao.findAllEmpBycondition(condition);
        PageInfo<Map<String,Object>> list = new PageInfo<>(pageList);
        return list;
    }

    @Override
    public List<String> findColumnId() {
        return dao.findColumnId();
    }

    @Override
    public boolean addEmpList(Map<String, Object> addList) {
        int i = dao.addEmployee(addList);
        if(i>0){
            int i1 = erdao.addEmpRole(addList);
            if (i1>0){
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean deleteEmp(String ids) {
        String[] eids = ids.split(",");
        int rows=0;
        for (int i=0;i<eids.length;i++) {
            int eid = Integer.parseInt(eids[i]);
            int r = erdao.delteEmpRole(eid);
            int row=0;
            if(r>0) {
                row = dao.deleteEmp(eid);
            }
            if(row>0){
                rows++;
            }
        }
        if (rows>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean deleteOneEmp(String e) {
        int eid = Integer.parseInt(e);
        int r = erdao.delteEmpRole(eid);
        int row=0;
        if(r>0){
            row = dao.deleteEmp(eid);
        }
        if(row>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Map<String, Object> findEmpByEid(String e) {
        int eid = Integer.parseInt(e);
        Map<String, Object> map = dao.findEmpByEid(eid);
        return map;
    }

    @Override
    public boolean updataEmp(Map<String, Object> newEmp) {

        int r = dao.updataEmployee(newEmp);
        int row=0;
        if(r>0){
            row = erdao.updataEmprole(newEmp);
        }
        if(row>0){
            return true;
        }else {
            return false;
        }
    }
}
