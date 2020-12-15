package com.offcn.service;

import com.offcn.bean.SourcesBean;
import com.offcn.bean.ZTreeNodeBean;
import com.offcn.dao.SourcesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class SourcesServiceImpl implements SourcesService {

    @Autowired
    private SourcesDao dao;



    @Override
    public ZTreeNodeBean initZTreeNode(int id) {
        List<ZTreeNodeBean> nodes = new ArrayList<>();

        SourcesBean sources = dao.selectById(id);
        ZTreeNodeBean node = new ZTreeNodeBean(sources.getId(),sources.getName(),true);
        initZTreeNodeChildren(node);

        //nodes.add(node);

        return node;
    }

    private void initZTreeNodeChildren(ZTreeNodeBean node) {
        List<SourcesBean> childrenBean = dao.findByPid(node.getId());
        List<ZTreeNodeBean> childNodes = new ArrayList<>();
        if(childrenBean.isEmpty()){
            return;
        }

        for (SourcesBean sourcesBean: childrenBean) {
            ZTreeNodeBean childnode = new ZTreeNodeBean(sourcesBean.getId(),sourcesBean.getName(),true);
            childNodes.add(childnode);
        }

        node.setChildren(childNodes);

        for (ZTreeNodeBean child:node.getChildren()) {
            initZTreeNodeChildren(child);
        }

    }
}
