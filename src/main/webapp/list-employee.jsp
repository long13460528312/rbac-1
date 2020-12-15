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
    <meta name="keywords" content="综合办公系统">
    <meta name="description" content="综合办公系统">

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
    <div class="ibox float-e-margins">
                   <div class="ibox-content">
                        <div class="row">

                            <form action="/emp/find" method="post">
                                <input type="hidden" name="pageNo" value="1">
                        		<div class="col-sm-3 col-sm-offset-2 text-right">
                        			<h3><small>搜索条件:</small></h3>
                        		</div>
                            <div class="col-sm-2">
                                <select class="selectpicker form-control" name="selectName">
                                    <option>请选择查询条件</option>
                                    <c:forEach items="${column}" var="col">
                                        <option value="${col}" <c:if test="${condition.selectName == col}" >selected</c:if> >${col}</option>
                                    </c:forEach>
                                </select>
                            </div>
                           
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <input type="text" name="selectValue" value="${condition.selectValue}" placeholder="请输入关键词" class="input-sm form-control">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-sm btn-primary" ><i class="fa fa-search"></i>搜索</button>
                                    </span>
                                </div>                                
                            </div>
                           </form>

                            <div class="col-sm-2 text-right">
                            	 <a href="/save-employee.jsp" class="btn btn-sm btn-primary" type="button"><i class="fa fa-plus-circle"></i> 添加员工</a>
                            </div>
                        </div>
                        <div class="hr-line-dashed2"></div>
                        <div class="table-responsive">
                            <table class="table table-striped list-table">
                                <thead>
                                    <tr>
                                        <th>选择</th>
                                        <th>序号</th>
                                        <th>姓名</th>
                                        <th>职位</th>
                                        <th>性别</th>
                                        <th>年龄</th>
                                        <th>联系电话</th>
                                        <th>入职时间</th>
                                        <th>所属部门</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.list}" var="emp">
                                    <tr>
                                        <td><input  type="checkbox" name="checkbox" value="${emp.eid}"></td>
										<td>${emp.eid}</td>
										<td>${emp.ename}</td>
										<td>${emp.remark}</td>
										<td>${emp.esex}</td>
										<td>${emp.eage}</td>
										<td>${emp.telephone}</td>
										<td>${emp.hiredate}</td>
                                        <td>${emp.dname}</td>
                                        <td class="text-right">
	                                       <a href="/emp/show?eid=${emp.eid}" class="btn btn-primary btn-xs"><i class="fa fa-edit"></i>编辑</a>
	                                       <button class="delsingle" value="${emp.eid}" style="background-color: #1AB394"><i class="fa fa-close"></i>删除</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                       
                        <div class="row">
	                        	<div class="col-sm-5">
	                        		<button class="btn btn-sm btn-primary" id="all" type="button"><i class="fa fa-check-square-o"></i> 全选</button>
	                        		<button class="btn btn-sm btn-primary" id="unall" type="button"><i class="fa fa-square-o"></i> 反选</button>
	                        		<button class="btn btn-sm btn-primary" id="btndel" type="button"><i class="fa fa-times-circle-o"></i> 删除</button>
	                        		<button id="demo1" class="btn btn-sm btn-primary" type="button"><i class="fa fa-table"></i> 导出Excel</button>
	                        	</div>
							<div class="col-sm-7 text-right">
						
								    <span>共有${page.pages}页,当前是第${page.pageNum}页</span>
	                                <a href="/emp/find?pageNo=1">首页</a>
                                <c:if test="${page.isFirstPage}">
                                    <a href="#">上一页</a>
                                </c:if>
                                <c:if test="${!page.isFirstPage}">
                                    <a href="/emp/find?pageNo=${page.prePage}">上一页</a>
                                </c:if>
                                <c:if test="${page.isLastPage}">
                                    <a href="#">下一页</a>
                                </c:if>
                                <c:if test="${!page.isLastPage}">
                                    <a href="/emp/find?pageNo=${page.nextPage}">下一页</a>
                                </c:if>
	                                <a href="/emp/find?pageNo=${page.pages}">尾页</a>
	                           
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
       
       $("#demo1").click(function () {
          location.href="/emp/export";
       })

       $(".delsingle").click(function () {
               var eid=this.value;

               $.post("/emp/deleteOneEmp",{"eid":eid},function (d) {
                   if(d){
                      alert("删除成功");
                       location.href="/emp/find?pageNo=${page.pageNum}";
                   }else {
                       alert("删除失败");
                   }
               },"json")
       });

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
		$("#btndel").click(function () {
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
                $.post("/emp/deleteEmp",{"ids":ids},function (d) {
                    if(d){
                        swal("删除成功！", "您已经永久删除了这条信息。", "success");
                        location.href="/emp/find";
                    }else {
                        swal("删除失败");
                    }
                },"json")

		    });
		});		
	});
    </script>
    
</body>


</html>
    