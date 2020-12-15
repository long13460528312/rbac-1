<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件 -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">

    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
          rel="stylesheet">
    <link href="/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link rel="stylesheet" href="/css/loginstyle.css" type="text/css" media="all" />
    <link href="/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">


    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script
            src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.24.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <title>Insert title here</title>
<!--
    <script>
    addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>
-->
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .bg {
            max-width: 530px;
            padding: 15px;
            margin: 0 auto;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

			var flag = true;
			//user_name失去焦点时发送ajax请求
			$("#username").blur(function(){
				var username = this.value;
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/emp/cleckUsername",
					//data:$("#regist").serialize(),
					data:{username:username},
                    dataType:"json",
					success:function(data){
						if (data) {
							$("#msg").html("该用户名可用");
							flag = true;
						}else{
							$("#msg").html("该用户名不可用");
							flag = false;
						}
					}
				});
			});

			$("#registForm").submit(function(){
				return flag;
			});
        });
    </script>
    <title>注册用户信息</title>
</head>
<body>
<!-- bg effect -->
<div id="bg">
    <canvas></canvas>
    <canvas></canvas>
    <canvas></canvas>
</div>
<div class="sub-main-w3">

<form role="form" class="bg" id="registForm"
      action="${pageContext.request.contextPath}/emp/regist"
      method="post" enctype="multipart/form-data">
    <h2>欢迎注册项目管理系统
        <i class="fa fa-level-down"></i>
    </h2>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">姓名<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="ename" name="ename" type="text" class="form-control input-sm"
                   placeholder="Enter user Ename">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">性别<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="esex" name="esex" type="text" class="form-control input-sm"
                   placeholder="Enter user Esex">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">年龄<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="eage" name="eage" type="text" class="form-control input-sm"
                   placeholder="Enter user eage">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">电话<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="telephone" name="telephone" type="text" class="form-control input-sm"
                   placeholder="Enter user telephone">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">工号<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="pnum" name="pnum" type="text" class="form-control input-sm"
                   placeholder="Enter user pum">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">用户名<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="username" name="username" type="text" class="form-control input-sm"
                   placeholder="Enter user Name"><span id="msg" style="color:green"></span>
        </div>

    </div>
    <div class="form-group">
        <label class="col-sm-4 control-label text-right">密码<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="password" name="password" type="text" class="form-control input-sm"
                   placeholder="Enter user Password">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">简介<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <textarea rows="4" cols="18" id="remark" name="remark">

            </textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">部门<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <select id="dfk" name="dfk">
                <option value="1">开发部</option>
                <option value="2">研发部</option>
                <option value="3">公关部</option>
                <option value="4">市场部</option>
                <option value="5">总裁部</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-4 control-label text-right">选择头像<i class="fa fa-user"></i></label>
        <div class="col-sm-6">
            <input id="pic" name="pic" type="file" class="form-control input-sm"
                   placeholder="Enter user Pic">
        </div>
    </div>

    <button type="submit" class="btn btn-default">注册</button>
</form>
</div>
<div class="footer">
    <p>Copyright &copy; 2020.项目理管系统 All rights reserved.</p>
</div>

<script src="/js/jquery.min.js"></script>

<script src="/js/canva_moving_effect.js"></script>

</body>
</html>