package com.offcn.bean;

public class DeptBean {
    private int deptno;
    private String dname;
    private String local;

    public int getDeptno() {
        return deptno;
    }

    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    @Override
    public String toString() {
        return "DeptBean{" +
                "deptno=" + deptno +
                ", dname='" + dname + '\'' +
                ", local='" + local + '\'' +
                '}';
    }
}
