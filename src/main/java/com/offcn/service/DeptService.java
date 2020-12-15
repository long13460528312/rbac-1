package com.offcn.service;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.DeptBean;

public interface DeptService {

    PageInfo<DeptBean> findAllDept(int pageNo);

    boolean deleteDept(String ids);

    boolean deleteOne(String no);

    DeptBean findDeptByDeptNo(String deptno);
}
