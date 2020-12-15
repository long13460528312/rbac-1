package com.offcn.dao;

import com.offcn.bean.SourcesBean;

import java.util.List;

public interface SourcesDao {

    SourcesBean selectById(int id);

    List<SourcesBean> findByPid(int pid);
}
