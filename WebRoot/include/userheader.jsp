<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
   <title></title>
<!-- 	   用户头像轮播 -->
   <link href="css/default.css" rel="stylesheet" type="text/css" />

	<link href="css/demo2.css" rel="stylesheet" type="text/css" />
	
	<script src="lib/jquery/jquery.js" type="text/javascript"></script>
	
	<script src="lib/jquery/jquery.easing.js" type="text/javascript"></script>
	
	<script src="js/scroller.js" type="text/javascript"></script>
	
	<script src="js/init.js" type="text/javascript"></script>

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
    </head><body style="font-weight: bolder;">
	<nav class="navbar navbar-default navbar-fixed-top" style="height: 80px;">
  	<div class="container">
  		<!-- navbar-brand -->
	   	 <a class="navbar-left" href="${pageContext.request.contextPath }" style="margin-left: 60px;margin-top: 15px;">
        <img alt="Brand" src="img/logo.png" height="50px">
      	</a>
	<form action="help_seo.action" class="navbar-form navbar-left" role="search" style="margin-top: 20px;margin-left: 20px;">
	  <div class="input-group input-group-lg">
	  <input type="hidden" value="all" name="type">
      <input type="text" class="form-control" style="width: 420px;" name="seo" required="required">
      <span class="input-group-btn">
        <button class="btn btn-primary" type="submit">搜索答案 </button>
      </span>
    </div>
    <div class="input-group input-group-lg">
      <span class="input-group-btn">
        <a href="help_add.action" class="btn btn-default">我要提问</a>
      </span>		
    </div>	  
	</form> 	
	
  				<ul class="nav navbar-nav navbar-right" style="margin-top: 10px;"> 
				<c:if test="${sessionScope.user == null }">
					    <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span>注册</a></li> 
			            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>登录</a></li> 
				</c:if>
				<c:if test="${sessionScope.user != null }">
					    <li><a href="#"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.name },个人中心</a></li>
					    <li><a href="user_logout.action"><span class="glyphicon glyphicon-log-in"></span>退出</a></li> 
				</c:if>	
			    </ul> 

	  </div>
	</nav>  
       <!-- jQuery (necessary for Bootstrap's JavaScript p-->
    <script src="lib/jquery/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
     <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script src="js/main.js"></script>
   </body></html>