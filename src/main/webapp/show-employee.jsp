<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>


<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>绿地中央广场综合物业办公系统 - 基础表格</title>
    <meta name="keywords" content="绿地中央广场综合物业办公系统">
    <meta name="description" content="绿地中央广场综合物业办公系统">

    <link rel="shortcut icon" href="/favicon.ico">
    	<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/customer.css" />
	<link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/customer.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        
      <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>档案管理<small>>修改档案</small></h5>
                    </div>
                    <div class="ibox-content">
                        <form method="post" action="/emp/updata" class="form-horizontal">
                            <input type="hidden" name="eid" value="${showemp.eid}">
                       	<div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-3 show-text">
                                    <input name="ename" value="${showemp.ename}" type="text" >
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">用户名</label>
                                <div class="col-sm-3 show-text">
                                    <input name="username" value="${showemp.username}" type="text">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-3 show-text">
                                    <input name="eage" value="${showemp.eage}" type="text">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">性别</label>
                                <div class="col-sm-3 show-text">
                                    <select name="esex">
                                        <option value="男" <c:if test="${showemp.esex == '男'}">selected</c:if> >男</option>
                                        <option value="女" <c:if test="${showemp.esex == '女'}">selected</c:if>>女</option>
                                    </select>
                                </div>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">身份证号码</label>
                                <div class="col-sm-3 show-text">
                                    <input name="pnum" value="${showemp.pnum}" type="text">
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">联系电话</label>
                                <div class="col-sm-3 show-text">
                                    <input name="telephone" value="${showemp.telephone}" type="text">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">职位</label>
                                <div class="col-sm-3 show-text">
                                    <input type="text" value="${showemp.remark}" name="remark" >
                                </div>
                                <label class="col-sm-2 col-sm-offset-1 control-label">入职时间</label>
                                <div class="col-sm-3 show-text">
                                    <!--时间控件的id都不能改-->
                                    <input name="hiredate" value="${showemp.hiredate}" id="start">
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">赋角色</label>
                                <div class="col-sm-3">
                                    <select name="roleid">
                                        <option value="5" <c:if test="${showemp.role_fk=='5'}">selected</c:if> >Customer</option>
                                        <option value="6" <c:if test="${showemp.role_fk=='6'}">selected</c:if>>VIP</option>
                                        <option value="7" <c:if test="${showemp.role_fk=='7'}">selected</c:if>>VVIP</option>
                                        <option value="8" <c:if test="${showemp.role_fk=='8'}">selected</c:if>>Seller</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注</label>
                                <div class="col-sm-9 show-text">
                                    <input type="text" value="${showemp.erdis}" name="erdis" >
                                </div>
                                
                            </div>
                        </div>
                        
                     	<div class="row">
                     		<div class="hr-line-dashed"></div>
                     	</div>
                          
                         <div class="row">
                            <div class="form-group">
                                <div class="col-sm-3 col-sm-offset-3 text-right">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 修改</button>

                                <div class="col-sm-3 col-sm-offset-4">
                                    <a href="list-employee.jsp" class="btn btn-white"><i class="fa fa-reply"></i> 返回</a>
                                </div>
                                </div>
                            </div>
                       </div>
                       </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <script >
     $(document).ready(function() {
         // 设置按钮的样式
         $('.selectpicker').selectpicker('setStyle', 'btn-white');
         //初始化日期控件
         laydate({elem: "#start"});
     });


 </script>
    
    
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script src="/js/plugins/select/bootstrap-select.min.js"></script>
	<script src="/js/plugins/layer/laydate/laydate.js"></script>
  
  
</body>


</html>

