<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
   <title></title>

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
	<nav class="navbar navbar-default navbar-fixed-top" style="height: 60px;">
  	<div class="container">
  		<div class="row">
  			<div class="col-md-3"></div>
  			<div class="col-md-3">
  				<img alt="" src="img/logo.png" style="margin-top: 10px;margin-bottom: 15px;" height="40px" width="100px">
  			</div>
  			<div class="col-md-3"></div>
  			<div class="col-md-3">
  				<ul class="nav navbar-nav navbar-right" style="margin-top: 10px;"> 
				<c:if test="${sessionScope.user == null }">
					    <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span>注册</a></li> 
			            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>登录</a></li> 
				</c:if>
				<c:if test="${sessionScope.user != null }">
					    <li><a href="user_detail.action"><span class="glyphicon glyphicon-user"></span>${sessionScope.user.name },个人中心</a></li>
					    <li><a href="user_logout.action"><span class="glyphicon glyphicon-log-in"></span>退出</a></li> 
				</c:if>	
			    </ul> 
  			</div>
  	  	</div>
  	  	</div>
	</nav>   
       <!-- jQuery (necessary for Bootstrap's JavaScript p-->
    <script src="lib/jquery/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
     <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script src="js/main.js"></script>
   </body></html>

