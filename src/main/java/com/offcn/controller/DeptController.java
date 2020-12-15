package com.offcn.controller;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.DeptBean;
import com.offcn.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("dept")
public class DeptController {

    @Autowired
    private DeptService service;

    @RequestMapping("find")
    public String pageDept(String pageNo, HttpSession session){
        if(pageNo==null){
            pageNo="1";
        }
        int no = Integer.parseInt(pageNo);
        PageInfo<DeptBean> allDept = service.findAllDept(no);
        session.setAttribute("allDept",allDept);
        return "list-dept";
    }

    @RequestMapping("delete")
    @ResponseBody
    public boolean deleteDept(String ids){
        boolean b = service.deleteDept(ids);
        return b;
    }

    @RequestMapping("deleteOne")
    public String deleteOne(String deptno){
        boolean b = service.deleteOne(deptno);
        if(b) {
            return "redirect:/dept/find";
        }else {
            return "login";
        }
    }

    @RequestMapping("show")
    public String showDept(String deptno, Model model){
        DeptBean deptbean = service.findDeptByDeptNo(deptno);
        model.addAttribute("deptbean",deptbean);
        return "list-dept";
    }
}
