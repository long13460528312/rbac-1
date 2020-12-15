package com.offcn.bean;

import java.util.Date;

public class EmployeeBean {
    private Integer eid;
    private String ename;
    private String esex;
    private Integer eage;
    private String telephone;
    private Date hiredate;
    private String pnum;
    private String username;
    private String password;
    private String remark;
    private Integer dfk;
    private String pic;

    public EmployeeBean() {
    }

    public EmployeeBean(Integer eid, String ename, String esex, Integer eage, String telephone, Date hiredate, String pnum, String username, String password, String remark, Integer dfk, String pic) {
        this.eid = eid;
        this.ename = ename;
        this.esex = esex;
        this.eage = eage;
        this.telephone = telephone;
        this.hiredate = hiredate;
        this.pnum = pnum;
        this.username = username;
        this.password = password;
        this.remark = remark;
        this.dfk = dfk;
        this.pic = pic;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getEsex() {
        return esex;
    }

    public void setEsex(String esex) {
        this.esex = esex;
    }

    public Integer getEage() {
        return eage;
    }

    public void setEage(Integer eage) {
        this.eage = eage;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public String getPnum() {
        return pnum;
    }

    public void setPnum(String pnum) {
        this.pnum = pnum;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getDfk() {
        return dfk;
    }

    public void setDfk(Integer dfk) {
        this.dfk = dfk;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public String toString() {
        return "EmployeeBean{" +
                "eid=" + eid +
                ", ename='" + ename + '\'' +
                ", esex='" + esex + '\'' +
                ", eage=" + eage +
                ", telephone='" + telephone + '\'' +
                ", hiredate=" + hiredate +
                ", pnum='" + pnum + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", remark='" + remark + '\'' +
                ", dfk=" + dfk +
                ", pic='" + pic + '\'' +
                '}';
    }
}
