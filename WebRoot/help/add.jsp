<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<head>
   <title>提问</title>
   <style type="text/css">
   	.ask-title {
    display: inline;
    font-size: 24px;
    font-weight: 400;
    color: #999;
	}
	div.file{display:inline-block;width:100px;height:20px;line-height:20px;position:relative;}
/* div.file input{position:absolute;left:0px;top:0px;zoom:1;filter:alpha(opacity=0);opacity:0;font-size:20px;margin-left:-240px} */
   </style>
</head>

<body>
    <%@include file="../include/header2.jsp" %>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#txt").keyup(function(){  
               if($("#txt").val().length > 49){
                   $("#txt").val( $("#txt").val().substring(0,49) );
               }
               $("#word").text($("#txt").val().length ) ;
            });
	});
	</script>
    <br /><br /><br /><br /><br />
    <div class="container">
  		<div class="row">
  			<div class="col-md-3"></div>
  			<div class="col-md-3"><div class="ask-title">
  				<img alt="" src="img/wenhao.png" height="26px" width="26px" style="margin-right: 10px;">
  				<span style="margin-left: -5px;">提问</span></div>
  			</div>
  			<div class="col-md-3"></div>
  			<div class="col-md-3">  			
  	  	</div>
  	  	 </div><br />
  	  	 <s:form action="help_commit.action" method="post" enctype="multipart/form-data">
  		<div class="row">
  			<div class="col-md-3"></div>
  			<div class="col-md-3" style="width: 600px;">  		 
  				<div class="form-group">
		    		<input type="text" class="form-control" id="txt" required="required" placeholder="标题：写下你的问题" style="height: 60px;width: 600px;font-size: 20px;font-weight: normal;border-color: #6bf;" name="title" maxlength="49">
		  			<div><span id="word">0</span>/49</div>
		  		</div>
		  	
		  	<div class="form-group">
			    <textarea class="form-control" rows="10" required="required" placeholder="选填，详细说明您的问题，以便获得更好的答案" name="content" style="width: 600px;"></textarea>
		  </div>
		  	
		  <!-- 上传图片文件 --><div id="ImgUpload">
		  <div id="img0">
		  <input type="text" id="filepath" onchange="addImgUpload()" disabled="disabled" style="width: 350px;">
		  <input type="button" id="filebutton" value="上传描述图片（可选）" onclick="browsefile.click()">
		  <a href="javascript:removeThis('img0')" style="margin-left: 10px;"><i class="glyphicon glyphicon-remove"></i></a>
		  <a href="javascript:addImgUpload()" style="margin-left: 8px;"><i class="glyphicon glyphicon-menu-down"></i></a>
		  <input type="file" name="upload" id="browsefile" style="visibility:hidden" onchange="filepath.value=this.value">
		  </div>
		  </div>
		  	  <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapseOne">
							点击进行展开，可选择“问题标签”
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse">
					<div class="panel-body">
						   <c:forEach items="${ttab }" var="tab" varStatus="s">
						   		<label><input name="tabs" type="checkbox" value="${tab.tab }" />${tab.tab }</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						   		<c:if test="${(s.index+1) % 5 == 0}">
						   			<br />
						   		</c:if>
					      </c:forEach>
					</div>
				</div>			
			</div>
			<div><img src="${pageContext.request.contextPath}/img/coin.png" height="18px" width="18px">&nbsp;悬赏金币：<input type="number" name="fcoin" min="0" max="${sessionScope.user.fcoin }" value="0"></div>
		  	<div class="nav navbar-nav navbar-left" style="margin-top: 20px;"> 
			<c:if test="${sessionScope.user == null }">
				    <a class="btn btn-lg btn-warning" href="user_login.action" style="margin-bottom: 10px;width: 100px;">请先登录</a>
			</c:if>
			<c:if test="${sessionScope.user != null }">
				   <input type="submit" class="btn btn-lg btn-success btn-block" value="提交" style="margin-bottom: 10px;width: 100px;">
				   <label><input name="anonymous1" type="checkbox" value="T" />是否匿名</label>
			</c:if>	
		    </div> 
		
  			</div>
  			<div class="col-md-3"></div>
  			<div class="col-md-3">	  	
  	  	</div>
  	  	
  	  	
  	  	
  	  	 <br /><br /><br /><br /><br />   <br /><br /><br /><br /><br />
  	  	 
  	 </div>  </s:form> </div> <br /><br />
<%@include file="../include/footer.jsp" %>
<script type="text/javascript">
	var ImgNum = 1;
	function addImgUpload(){
		ImgNum = ImgNum + 1;
		if (ImgNum < 8){
			$("#ImgUpload").append("<div id=\"img"+ImgNum+"\"></div>");
			$("#img"+ImgNum).append("<input type=\"text\" id=\"filepath"+ImgNum+"\" disabled=\"disabled\" style=\"width: 350px;margin-right: 5px;\">");
			$("#img"+ImgNum).append("<input type=\"button\" id=\"filebutton"+ImgNum+"\" value=\"上传描述图片（可选）\" onclick=\"browsefile"+ImgNum+".click()\">");
			$("#img"+ImgNum).append("<a href=\"javascript:removeThis('img"+ImgNum+"')\" style=\"margin-left: 10px;\"><i class=\"glyphicon glyphicon-remove\"></i></a>");
			$("#img"+ImgNum).append("<input type=\"file\" name=\"upload\" id=\"browsefile"+ImgNum+"\" style=\"visibility:hidden\" onchange=\"filepath"+ImgNum+".value=this.value\">");
			$("#img"+ImgNum).append("");
		}else{
			alert("最多只能上传8张图片");
		}
	}
	function removeThis(imgn){
		ImgNum = ImgNum - 1;
		$("#"+imgn).remove();
	}
</script>
</body>
</html>

