package com.offcn.controller;

import com.offcn.bean.EmployeeBean;
import com.offcn.myexception.UsernameException;
import com.offcn.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp/")
public class LoginController {

    @Autowired
    private LoginService service;

    @RequestMapping("login")
    public String login(EmployeeBean emp, HttpSession session){
        List<Map<String, Object>> employee = service.login(emp);
        if(employee!=null){
            session.setAttribute("emp",employee);
            return "index";
        }
        else{
            return "login";
        }
    }

    @RequestMapping("cleckUsername")
    @ResponseBody
    public boolean cleckUsername(EmployeeBean emp){
        try {
            service.regist(emp,false);
            return true;
        } catch (UsernameException e) {
            e.printStackTrace();
            return false;
        }
    }

    @InitBinder
    public void initBinder(WebDataBinder dataBinder){
        dataBinder.setDisallowedFields("pic");
    }

    @RequestMapping("regist")
    public String regist(MultipartFile pic, EmployeeBean emp) throws IOException, UsernameException {
        String path="D:\\idea\\workspace\\rbac\\src\\main\\webapp\\img";
        File filePath = new File(path);
        if(!filePath.exists()){
            filePath.mkdirs();
        }
        String filename = pic.getOriginalFilename();
        File file = new File(filePath, filename);
        pic.transferTo(file);
        emp.setPic(filename);
        service.regist(emp,true);
        return "redirect:/login.jsp";
    }

}
