<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
   <title>注册</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.css">
<!--     <link href="css/bootstrap.min.css" rel="stylesheet"> -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="lib/html5shiv/html5shiv.min.js"></script>
      <script src="lib/respond/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="css/main.css">
           <!-- jQuery (necessary for Bootstrap's JavaScript p-->
    <script src="lib/jquery/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script src="js/main.js"></script>
    </head>
    <body>
    <div class="container">
    	<div class="row">
    		<div class="col-md-6 col-md-offset-3" style="margin-top: 20px;margin-bottom: 15px;"><img alt="" src="img/logo.png"></div>
    	</div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">注册账号<span style="color: red;" id="error"></span></h3>
                    </div>
                    <div class="panel-body" style="margin-bottom: 5px;">
                        <form role="form" action="user_register.action" method="post" enctype="multipart/form-data">
                                <div class="input-group">
						            <span class="input-group-addon">邮箱</span>
						            <input type="email" class="form-control" name="email" required="required" id="email">
						        </div>
						        <div class="input-group">
						            <span class="input-group-addon">手机</span>
						            <input type="tel" class="form-control" name="telephone" id="phone" required="required">
						        </div>
						        <div class="input-group">
						        	<span class="input-group-addon">验证码</span>
						            <input type="text" class="form-control" style="height: 40px;" id="vercodeId" name="code" required="required">
						            <span class="input-group-addon" style="margin: 0px;padding:0px;"><a class="btn btn-warning" id="btn_code" onclick="timedCount()">获取验证码</a></span>
						        </div>
						        <div class="input-group">
						            <span class="input-group-addon">密码</span>
						            <input type="password" class="form-control" id="password" name="password" required="required">
						        </div>
						        <div class="input-group">
						            <span class="input-group-addon">确定密码</span>
						            <input type="password" class="form-control" id="password_repeat" name="password_repeat" required="required">
						        </div>
						        <div class="input-group">
						            <span class="input-group-addon">昵称</span>
						            <input type="text" class="form-control" name="name" required="required" id="name">
						        </div>
						       <div class="input-group">
						            <span class="input-group-addon">头像</span>
						            <input type="file" class="form-control" name="upload">
						        </div>						        
						        <div class="input-group">
						            <span class="input-group-addon">个人简介</span>
						            <textarea class="form-control" rows="3" name="intro"></textarea>
						        </div>
								<br />
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="注册"><br />
                              <div class="row">
                                    <div class="col-xs-2">
							        </div>
							         <div class="col-xs-2"><a href="login.jsp">登录</a>
							        </div>
							         <div class="col-xs-4">
							        </div>
							        <div class="col-xs-2"><a href="">找回密码</a>
							        </div>
							        <div class="col-xs-2">
							        </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <%@include file="include/footer.jsp" %>

    
<!-- js脚本 -->
<script>
	var wait=60;  
	function time(o) {  
	        if (wait == 0) {  
	        	o.attr("disabled",false);
	        	o.html("免费获取验证码");
	            wait = 60;  
	        } else {  
	        	o.attr("disabled",true);
	        	o.html("重新发送(" + wait + "s)");
	            wait--;  
	            setTimeout(function() {  
	                time(o)  
	            },  
	            1000)  
	        }  
	    }  
	    
	function timedCount(){
		$("#error").html("");
		if (!$("#phone").val().match("[1][358][0-9]{9}")) { 
			alert("电话号码错误！");
			$("#phone").focus();
		}else{
			$.post("${pageContext.request.contextPath}/user_postemail.action",
				{
					telephone:$("#phone").val(),
					email:$("#email").val()
				},
				function(data,status){//回调函数
					var data = JSON.parse(data);
					alert("验证码："+data.code);
					if("true"==data.result){
						alert("短信发送成功");
						wait = 60 ;
						time($("#btn_code"));
					}else{
						$("#error").html("["+data.msg+"]");
						alert("验证码发送失败");
					}
				});
		}
	}
	
	$(function() {//两次密码要一致的校验
		$('#password_repeat').change(function(){
	        if ($('#password').val() != $('#password_repeat').val())
	        	$('#password_repeat')[0].setCustomValidity("两次密码必须输入一致!!");//加上[0]是为了把jQuery对象转换成html元素
	        else
	        	$('#password_repeat')[0].setCustomValidity("");
		});
	});
</script>
    
   </body></html>

