package com.offcn.controller;

import com.github.pagehelper.PageInfo;
import com.offcn.bean.EmployeeBean;
import com.offcn.dao.EmployeeDao;
import com.offcn.service.EmployeeService;
import com.offcn.utils.ExcelUtil;
import com.offcn.utils.MD5Util;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/emp/")
public class EmployeeController {

    @Autowired
    private EmployeeService service;

    @RequestMapping("find")
    public String findByCondition(@RequestParam Map<String,String> param, HttpSession session){

        Map<String,Object> condition = new HashMap<>();
        List<Map<String,Object>> emp = (List<Map<String, Object>>) session.getAttribute("emp");
        if(param.get("pageNo")==null){
            condition.put("pageNo",1);
        }

        Iterator<Map.Entry<String,String>> entries = param.entrySet().iterator();
        while(entries.hasNext()){
            Map.Entry<String, String> entry = entries.next();
            if ("pageNo".equals(entry.getKey())){
                condition.put(entry.getKey(),Integer.parseInt(entry.getValue()));
            }if ("selectName".equals(entry.getKey())){
                condition.put(entry.getValue(),param.get("selectValue"));
            }
        }

        PageInfo<Map<String,Object>> page = service.findEmpByCondition(condition);

        List<String> columnId = service.findColumnId();
        columnId.remove("password");
        columnId.remove("pic");
        columnId.add("dname");
        session.setAttribute("column",columnId);
        session.setAttribute("page",page);
        session.setAttribute("condition",param);

        return "list-employee";
    }

    @RequestMapping("add")
    public String addEmployee(@RequestParam Map<String,String> param){

        Map<String,Object> addList = new HashMap<>();
        Iterator<Map.Entry<String,String>> entries = param.entrySet().iterator();
        while(entries.hasNext()){
            Map.Entry<String, String> entry = entries.next();
            if ("eage".equals(entry.getKey()) || "dfk".equals(entry.getKey()) || "roleid".equals(entry.getKey())){
                addList.put(entry.getKey(),Integer.parseInt(entry.getValue()));
            }else {
                addList.put(entry.getKey(),entry.getValue());
            }
        }

        String s = (String) addList.get("password");
        String password = MD5Util.md5Encode(s);
        addList.put("password",password);
        boolean b = service.addEmpList(addList);
        if (b){
            return "redirect:/emp/find";
        }else {
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping("deleteEmp")
    @ResponseBody
    public boolean deleteEmp(String ids){
        boolean b = service.deleteEmp(ids);
        if (b){
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping("deleteOneEmp")
    @ResponseBody
    public boolean deleteOneEmp(String eid){
        boolean b = service.deleteOneEmp(eid);
        if(b){
            return true;
        }else {
            return false;
        }
    }

    @RequestMapping("show")
    public String findEmpByEid(String eid,Model model){
        Map<String, Object> map = service.findEmpByEid(eid);
        model.addAttribute("showemp",map);
        return "show-employee";
    }

    @RequestMapping("updata")
    public String updataEmp(@RequestParam Map<String,String> param){
        Map<String,Object> newEmp = new HashMap<>();
        Iterator<Map.Entry<String,String>> entries = param.entrySet().iterator();
        while(entries.hasNext()){
            Map.Entry<String, String> entry = entries.next();
            if ("eid".equals(entry.getKey()) || "eage".equals(entry.getKey())){
                newEmp.put(entry.getKey(),Integer.parseInt(entry.getValue()));
            }else {
                newEmp.put(entry.getKey(),entry.getValue());
            }
        }


        boolean b = service.updataEmp(newEmp);
        if(b){
            return "redirect:/emp/find";
        }else {
            return "/show-employee.jsp";
        }
    }


    @RequestMapping("export")
    @ResponseBody
    public void export(HttpServletRequest request, HttpServletResponse response) throws Exception {
        PageInfo<Map<String, Object>> pg = (PageInfo<Map<String, Object>>) request.getSession().getAttribute("page");

        String[] title = {"姓名", "职位", "性别", "联系电话", "入职时间", "所属部门"};

        String fileName = "员工信息表" + System.currentTimeMillis() + ".xls";

        String sheetName = "员工信息表";
        String[][] content = new String[pg.getList().size()][title.length];
        for (int i = 0; i < pg.getList().size(); i++) {
            Map<String, Object> obj = pg.getList().get(i);
            content[i][0] = obj.get("ename").toString();
            content[i][1] = obj.get("remark").toString();
            content[i][2] = obj.get("esex").toString();
            content[i][3] = obj.get("telephone").toString();
            content[i][4] = obj.get("hiredate").toString();
            content[i][5] = obj.get("dname").toString();
        }


        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);


        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();

            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(), "ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
