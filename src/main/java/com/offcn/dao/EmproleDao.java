package com.offcn.dao;

import java.util.Map;

public interface EmproleDao {

    int addEmpRole(Map<String,Object> addList);

    int delteEmpRole(int eid);

    int updataEmprole(Map<String,Object> newEmp);
}
