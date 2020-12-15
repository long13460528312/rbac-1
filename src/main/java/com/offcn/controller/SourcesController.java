package com.offcn.controller;

import com.offcn.bean.ZTreeNodeBean;
import com.offcn.service.SourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("sources")
public class SourcesController {

    @Autowired
    private SourcesService service;


    @RequestMapping("showtree")
    @ResponseBody
    public ZTreeNodeBean showTree(String id){
        if(id==null){
            id="1";
        }
        int sid = Integer.parseInt(id);
        ZTreeNodeBean ztree = service.initZTreeNode(sid);
        return ztree;
    }

}
