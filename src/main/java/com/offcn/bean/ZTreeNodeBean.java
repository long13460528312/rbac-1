package com.offcn.bean;

import java.util.List;

public class ZTreeNodeBean {

    private Integer id;
    private String name;
    private boolean isParent;

    private List<ZTreeNodeBean> children;

    public ZTreeNodeBean(Integer id, String name, boolean isParent) {
        this.id = id;
        this.name = name;
        this.isParent = isParent;
    }

    public ZTreeNodeBean() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isParent() {
        return isParent;
    }

    public void setParent(boolean parent) {
        isParent = parent;
    }

    public List<ZTreeNodeBean> getChildren() {
        return children;
    }

    public void setChildren(List<ZTreeNodeBean> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "ZTreeNodeBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", isParent=" + isParent +
                ", children=" + children +
                '}';
    }
}
