package com.offcn.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.offcn.bean.DeptBean;
import com.offcn.dao.DeptDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptDao dao;

    @Override
    public PageInfo<DeptBean> findAllDept(int pageNo) {

        PageHelper.startPage(pageNo,3);
        List<DeptBean> allDept = dao.findAllDept();
        PageInfo<DeptBean> deptPage = new PageInfo<>(allDept);
        return deptPage;
    }

    @Override
    public boolean deleteDept(String ids) {
        String[] eids = ids.split(",");
        int rows=0;
        for (int i=0;i<eids.length;i++) {
            int eid = Integer.parseInt(eids[i]);
            int row = dao.deleteDept(eid);
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
    public boolean deleteOne(String no) {
        int dno = Integer.parseInt(no);
        int row = dao.deleteDept(dno);
        if (row>0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public DeptBean findDeptByDeptNo(String deptno) {
        int dno = Integer.parseInt(deptno);
        DeptBean deptone = dao.findDeptByDeptNo(dno);
        return deptone;
    }
}
