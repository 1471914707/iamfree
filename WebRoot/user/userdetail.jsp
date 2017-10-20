<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人信息</title>
  </head>
  
  <body>
    <%@include file="../include/header.jsp" %><br /><br /><br /><br /><br />
    <div class="container">
    	<div class="row">
    		<div class="col-md-1"></div>
    		<div class="col-md-10" style="font-size: 18px;">
    			<div class="panel panel-info">
			   <div class="panel-heading">个人基本信息</div>
			      <div class="panel-body">
			         <table width="500px" class="table table-condensed">
			         <tr><td colspan="6" rowspan="3">
			         <c:if test="${sessionScope.user.imgpath == null ||  '' eq sessionScope.user.imgpath }">
			         	<img src="${pageContext.request.contextPath }${sessionScope.iconpath }/icon.png">		         	
			         </c:if>
			         <c:if test="${sessionScope.user.imgpath != null}">
			         	<img src="${pageContext.request.contextPath }${sessionScope.iconpath }/${sessionScope.user.imgpath}" width="100px" height="100px">
			         </c:if>
			         </td><td>昵称</td><td>${sessionScope.user.name }</td></tr>
			         <tr><td>号码</td><td>${sessionScope.user.telephone }</td></tr>
			         <tr><td>邮箱</td><td>${sessionScope.user.email }</td></tr>
			         <tr><td colspan="6" rowspan="4">个人简介：${sessionScope.user.intro }</td><td>F币</td><td>${sessionScope.user.fcoin }</td></tr>
			         <tr><td>提问</td><td>${sessionScope.user.THelps.size() }</td></tr>
			         <tr><td>回答</td><td>${sessionScope.user.TCommentsForUserid.size() }</td></tr>
			         <tr><td>评论</td><td>${sessionScope.user.TCommentsForReplyid.size() }</td></tr>
			         <tr></tr>
			         </table>
			   </div>
			   <ul class="list-group">
			      <li class="list-group-item">
			      <a data-toggle="collapse" data-parent="#accordion" href="#collapseXXXG">信息修改 </a>
			      <!-- <a id="stuId" class="navbar-link" data-toggle="modal" data-target="#myModal">信息修改 </a> -->
			      <div id="collapseXXXG" class="panel-collapse collapse">
			      <div class="panel-body" id="XXXG">
			       		<div class="panel-body" style="margin-bottom: 5px;">
                       
                         	<div class="input-group">
						            <span class="input-group-addon">昵称</span>
						            <input type="text" class="form-control" name="name" required="required" id="name1" value="${sessionScope.user.name }">
						        </div>
						        <div class="input-group">
						            <span class="input-group-addon">原密码</span>
						            <input type="password" class="form-control" id="password1" required="required">
						        </div>
						        <div class="input-group">
						            <span class="input-group-addon">新密码</span>
						            <input type="password" class="form-control" id="password_repeat" id="password_new1" required="required">
						        </div>				        
						        <div class="input-group">
						            <span class="input-group-addon">个人简介</span>
						            <textarea class="form-control" rows="3" id="intro1" value="${sessionScope.user.intro }"></textarea>
						        </div>
								<br />
                                <!-- Change this to a button or input when using this as a form -->
                                <button onclick="modify()" class="btn btn-lg btn-success btn-block">修改</button><br />
                        
                    </div>
			       </div></div>
			      
			      </li>
			      
			      <li class="list-group-item"> 
			     <!--  href="#collapseWDTW" onclick="h1()"
			       href="#collapseWDHD" onclick="h2()"
			        href="#collapseWDPL" onclick="h3()" -->
			      <a data-toggle="collapse" data-parent="#accordion" id="d1">我的提问</a>&nbsp;&nbsp;&nbsp;
			      <a data-toggle="collapse" data-parent="#accordion" id="d2">我的回答</a>&nbsp;&nbsp;&nbsp;
			      <a data-toggle="collapse" data-parent="#accordion" id="d3">我的评论</a>&nbsp;&nbsp;&nbsp;
			      <div id="collapseWDTW" class="panel-collapse collapse">
			      <div class="panel-body" id="WDTW">
			      	<div id="wdtwBody" style="padding-bottom: 3px;font-weight: normal;">
			      	 	<%@include file="userhelps.jsp" %>				 		
			      	</div>  					
				  </div>
				  
				  <div id="collapseWDHD" class="panel-collapse collapse">
			      <div class="panel-body" id="WDHD">
			      <div id="wdtwBody" style="padding-bottom: 3px;font-weight: normal;">
			      	 	<%@include file="usercomments.jsp" %>				 		
			      	</div>  
			      </div>
			      </div>
			      
			     <div id="collapseWDPL" class="panel-collapse collapse">
			      <div class="panel-body" id="WDPL">
			      <div id="wdtwBody" style="padding-bottom: 3px;font-weight: normal;">
			      	 	<%@include file="userpl.jsp" %>	 		
			      	</div>  
			      </div></div>
			      
				  
				  </div>
			      
			      </li>
			   </ul></div>
    		</div>
    		<div class="col-md-1"></div>
    	</div>
    	
    </div>
    <%@include file="../include/footer.jsp" %>  
  </body>
  <script>
  $(document).ready(function(){
  $("#collapseWDTW").show();
  
  if(${f} == 0)
  	$("#collapseWDTW").show();
  else if (${f} == 1)
  	$("#collapseWDHD").show();
  else if (${f} == 2)
  	$("#collapseWDPL").show();
  	
  $("#d1").click(function(){
  	 $("#collapseWDHD").hide();
    $("#collapseWDPL").hide();
  	$("#collapseWDTW").toggle();
  });
  
  $("#d2").click(function(){
  	$("#collapseWDTW").hide();
    $("#collapseWDPL").hide();
  	$("#collapseWDHD").toggle();
  });
  
  $("#d3").click(function(){
  	$("#collapseWDHD").hide();
    $("#collapseWDTW").hide();
  	$("#collapseWDPL").toggle();
  });
    
});
     function save(){
	    	   	var name1 = $("#name1").val();
	    		var password1 = $("#password1").val();
	    		var password_new1 = $("#password_new1").val();
	    		var intro1 = $("#intro1").val();
	    		$.ajax({
	    			  url: "${pageContext.request.contextPath}/user_modify.action",
	    			  data: {
	    			    name:name1,
	    			    password:p,
	    			    password_new:password_new1,
	    			    intro:intro1
	    			  },
	    			  success: function(result) {
	    				$("#myModal").modal('hide');
	    			    $("#pwd").val(result);
	    			  }
	    			}); 
    	}
    	
    function modify(){
     			var name1 = $("#name1").val();
	    		var password1 = $("#password1").val();
	    		var password_new1 = $("#password_new1").val();
	    		var intro1 = $("#intro1").val();
	$.post("${pageContext.request.contextPath}/user_modify.action",
				{
					 name:name1,
	    			 password:password1,
	    			 password_new:password_new1,
	    			 intro:intro1
				},
				function(data,status){//回调函数
					var data = JSON.parse(data);
					if("true"==data.result){
						window.location.reload();
					}else{
						alert(data.msg);
					}
				});
}
  </script>
</html>
