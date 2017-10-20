<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
   <title>登录</title>

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
    </head><body>
    <div class="container">
    	<div class="row">
    		<div class="col-md-6 col-md-offset-3" style="margin-top: 20px;margin-bottom: 15px;"><img alt="" src="img/logo.png"></div>
    	</div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">请登录</h3>
                    </div>
                    <div class="panel-body" style="margin-bottom: 5px;">
                        <form role="form" action="user_checkUser.action" method="post">
                            
                                <div class="form-group">
								      <input type="text" class="form-control" id="tm" placeholder="邮箱/号码" name="account" required="required">
								  </div>
								  <div class="form-group">
								      <input type="text" class="form-control" id="pw" placeholder="密码" name="password" required="required" maxlength="6">
								  </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">请记住我
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="登录"><br />
                              <div class="row">
                                    <div class="col-xs-2">
							        </div>
							         <div class="col-xs-2"><a href="register.jsp">注册账号</a>
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
    <div id="footer"><%@include file="include/footer.jsp" %></div> 
       <!-- jQuery (necessary for Bootstrap's JavaScript p-->
    <script src="lib/jquery/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
      <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script src="js/main.js"></script>
   </body></html>

