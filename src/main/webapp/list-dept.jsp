<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!DOCTYPE html>
<html>
<!-- Mirrored from www.gzsxt.cn/theme/hplus/table_basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 20 Jan 2016 14:20:01 GMT -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>办公系统 - 基础表格</title>
    <meta name="keywords" content="办公系统">
    <meta name="description" content="办公系统">

    <link rel="shortcut icon" href="/favicon.ico">
    	<link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    	<link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="/css/plugins/select/bootstrap-select.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper2 wrapper-content2 animated fadeInRight">
	    <div class="row">
	    		<div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>添加部门</h5>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" action="">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">部门编号：</label>

                                <div class="col-sm-8">
                                    <input name="deptno" value="${deptbean.deptno}" type="email" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">部门名称：</label>

                                <div class="col-sm-8">
                                    <input type="email" name="dname" value="${deptbean.dname}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">区域：</label>

                                <div class="col-sm-8">
                                    <input type="email" name="local" value="${deptbean.local}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-8">
                                    <button class="btn btn-sm btn-white" type="submit"><i class="fa fa-save"></i> 保存</button>
                                    <button class="btn btn-sm btn-white" type="submit"><i class="fa fa-undo"></i> 重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
	    		<div class="col-sm-7">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>部门列表 <small>点击修改信息将显示在左边表单</small></h5>
                    </div>
                    <div class="ibox-content">                    	
                        <div class="hr-line-dashed2"></div>
                        <div class="row">
                            <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                    <tr>		
                                        <th>选择</th>
                                        <th>部门编号</th>
                                        <th>部门名称</th>
                                        <th>区域</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allDept.list}" var="dept">
                                    <tr>
                                        <td><input name="checkbox" value="${dept.deptno}" type="checkbox"></td>
										<td>${dept.deptno}</td>
										<td>${dept.dname}</td>
										<td>${dept.local}</td>
                                        <td>
	                                     <a href="/dept/show?deptno=${dept.deptno}"><i class="glyphicon glyphicon-edit  text-navy"></i></a>
	                                     <a href="/dept/deleteOne?deptno=${dept.deptno}" class="btndel"><i class="glyphicon glyphicon-remove  text-navy"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
	                        	<div class="col-sm-5">
	                        		<button id="all" class="btn btn-sm btn-primary" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
	                        		<button id="unall" class="btn btn-sm btn-primary" type="button"><i class="fa fa-square-o"></i> 反选</button>
	                        		<button id="deletebtn" class="btn btn-sm btn-primary" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
	                    
	                        	</div>
							<div class="col-sm-7 text-right">
								<div class="btn-group">
	                              
								    <span>共有${allDept.pages}页,当前是第${allDept.pageNum}页</span>
	                                <a href="/dept/find?pageNo=1">首页</a>
                                    <c:if test="${allDept.isFirstPage}">
                                        <a href="#">上一页</a>
                                    </c:if>
                                    <c:if test="${!allDept.isFirstPage}">
                                        <a href="/dept/find?pageNo=${allDept.prePage}">上一页</a>
                                    </c:if>
                                    <c:if test="${allDept.isLastPage}">
                                        <a href="#">下一页</a>
                                    </c:if>
                                    <c:if test="${!allDept.isLastPage}">
                                        <a href="/dept/find?pageNo=${allDept.nextPage}">下一页</a>
                                    </c:if>
	                                <a href="/dept/find?pageNo=${allDept.pages}">尾页</a>
	                            </div>
							</div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            
	    	</div>
	
	</div>       
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
     <script src="/js/plugins/select/bootstrap-select.min.js"></script>
    <script src="/js/plugins/sweetalert/sweetalert.min.js"></script>

   <script>

       $("#all").click(function () {
           $("input[name='checkbox']").prop("checked",true)
       })
       $("#unall").click(function () {
           $("input[name='checkbox']").prop("checked",false)
       })

	$(document).ready(function() {
		// 设置按钮的样式
		$('.selectpicker').selectpicker('setStyle', 'btn-white').selectpicker('setStyle', 'btn-sm');
		
		//点击删除
		$("#deletebtn").click(function () {
		    swal({
		        title: "您确定要删除这条信息吗",
		        text: "删除后将无法恢复，请谨慎操作！",
		        type: "warning",
		        showCancelButton: true,
		        confirmButtonColor: "#DD6B55",
		        confirmButtonText: "删除",
		        closeOnConfirm: false
		    }, function () {//此函数是点击删除执行的函数
		    		//这里写ajax代码
		    		// 以下是成功的提示框，请在ajax回调函数中执行

                var inputs=	$("input[name='checkbox']:checked");
                //ids =1,2,3
                var ids="";

                for(var i=0;i<inputs.length;i++) {
                    if (i == inputs.length - 1) {
                        ids += inputs[i].value;
                    } else {
                        ids += inputs[i].value + ",";
                    }
                }
                $.post("/dept/delete",{"ids":ids},function (d) {
                    if(d){
                        swal("删除成功！", "您已经永久删除了这条信息。", "success");
                        location.href="/dept/find";
                    }else {
                        swal("删除失败");
                    }
                },"json")

		    });
		});
		
		
		$("#demo1").click(function() {
			//基本消息框－留着备用
			swal({
				title: "欢迎使用SweetAlert",
				text: "Sweet Alert 是一个替代传统的 JavaScript Alert 的漂亮提示效果。"
			})
		});
	});
    </script>  
</body>


</html>
    
