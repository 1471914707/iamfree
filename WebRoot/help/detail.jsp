<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>问题详情</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/ckeditor/ckeditor.js"></script>
   <style type="text/css">
   	.ask-title {
    display: inline;
    font-size: 24px;
    font-weight: 400;
    color: #999;
	}
	dl dd{
	 padding-bottom: 5px;
	 }
   </style>
  </head>
  <body>
    <%@include file="../include/header.jsp" %>
      	<br /><br /><br /><br /><br />
	    <div class="container">
  		<div class="row">
  			<div class="col-md-1"></div>
  			<div class="col-md-8">
  				<div style="border-right:1px solid #bbb;">
  					<div id="title">
  					<div class="ask-title">
	  				<img alt="" src="img/huiwenhao.png" height="26px" width="26px" style="margin-right: 10px;">
	  				<span style="margin-left: -5px;font-size: 25px;font-weight: normal;color:#000;">${help.title }</span></div>
  					</div>
  					<br />
  					<div id="content1" style="margin-top: 10px;font-weight: normal;margin-left: 5px;">${help.content }</div><br />
  					<div id="imgs"></div><br />
  					<div id="footer" style="color:#bbb;font-size: 10px;display: inline;margin-left: 5px;">
  						<div id="name" style="display: inline;margin-right: 10px;">
  							<c:if test="${'F' eq help.anonymous }">
  								${user.name }
  							</c:if>
  							<c:if test="${'T' eq help.anonymous}">
  								用户匿名
  							</c:if>
  						</div>
  						<div id="time" style="display: inline;margin-right: 10px;"></div>
  						<div id="look" style="display: inline;margin-right: 10px;">浏览${help.look}次</div>
  						<div id="tabs" style="display: inline;margin-right: 10px;">
  						<img alt="" src="img/biaoqian.png" height="15px" width="15px" style="margin-right: 10px;">${help.tab }</div>
  						<div id="fcoin" style="display: inline;margin-right: 10px;">
  							<c:if test="${help.fcoin > 0 }">
  								<img src="${pageContext.request.contextPath}/img/coin.png" height="18px" width="18px">&nbsp;悬赏金币：${help.fcoin }
  							</c:if>
  						</div>
  					</div><br /><br />
  					
  					<!-- 评价框 -->
  					<c:if test="${sessionScope.user != null }">
  						<div style="width: 600px;">
  					<form action="comment_commit.action" method="post">
  						<textarea rows="4" name="content">回答...</textarea>
						<script type="text/javascript">CKEDITOR.replace('content')</script><br />
						<input type="hidden" name="helpId" value="${help.id }"><input type="hidden" name="userId" value="${sessionScope.user.id }">
						<input type="submit" value="提交回答" class="btn btn-success pull-right">
  					</form>  						
  					</div> 	
  					</c:if>
  					
  					<div style="border-bottom:1px solid #bbb;width: 650px;"><br /><br /></div>	
  					<!-- 答案采纳 -->
  					<div style="font-weight: normal;">
  					<c:if test="${help.bestpid != null }">
  						<div style="font-size:18px;color:#111;">提问者采纳</div>
	  					<div>${bestComment.content }</div>					
							<div style="color:#888;font-size: 12px;">											
								<span>${bestComment.TUserByUserid.name }</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>发布于<script>document.write(getTimeFormatText("${bestComment.time }"));</script></span>
								<div class="pull-right" style="margin-right: 160px;">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapse${bestComment.id }">追问</a>
								</div>
								<div id="collapse${bestComment.id }" class="panel-collapse collapse">
								<div class="panel-body" style="background-color: #ecffff;width: 650px;">
										 <form action="" method="post">
										 	<input type="hidden" name="helpId" value="${help.id }">
										 	<input type="hidden" name="replyId" value="${bestComment.id }">
										 	<textarea rows="5" cols="100" name="replycontent"></textarea><br />
										 	<input type="submit" class="btn btn-success pull-right" value="发布评论" style="margin-right: 20px;margin-top: 5px;">
										 </form>
									</div>
								</div>		
							</div><br />	
  					</c:if></div>	
  								
  					<!-- 评论列表 -->
  					<div style="font-weight: normal;">
  					<c:if test="${help.TComments.size() == 0 }">
  						<div style="font-size:18px;color:#666;">暂无回答</div><br />
  					</c:if>
  					<c:if test="${help.TComments.size() != 0 }">
  					<div style="color:#333;font-size:18px;font-weight: lighter;padding-bottom: 10px;">${help.TComments.size() }条回答</div>
  						 <c:forEach items="${help.TComments }" var="comment" varStatus="s">	
  						 	<div>${comment.content }</div>					
							<div style="color:#888;font-size: 12px;">
							<c:if test="${sessionScope.user.id == help.TUser.id }">
								<a href="help_agree.action?id=${help.id }&commentId=${comment.id}">采纳</a>&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>												
								<span>${comment.TUserByUserid.name }</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>发布于<script>document.write(getTimeFormatText("${comment.time }"));</script></span>
								<div class="pull-right" style="margin-right: 160px;">
									<a data-toggle="collapse" data-parent="#accordion" href="#collapse${comment.id }">评论</a>
								</div>
								<div id="collapse${comment.id }" class="panel-collapse collapse">
								<div class="panel-body" style="background-color: #ecffff;width: 650px;">
										 <form action="" method="post">
										 	<input type="hidden" name="helpId" value="${help.id }">
										 	<input type="hidden" name="replyId" value="${comment.id }">
										 	<textarea rows="5" cols="100" name="replycontent"></textarea><br />
										 	<input type="submit" class="btn btn-success pull-right" value="发布评论" style="margin-right: 20px;margin-top: 5px;">
										 </form>
									</div>
								</div>		
							</div><br />
					 	 </c:forEach>   
  					</c:if>  					
  					</div>					
  				</div>
  				<div style="border-bottom:2px solid #aaa;width: 650px;"><br /></div>
  				<div>
  					<div id="dengnilaida" style="color:#aaa;font-size:18px;font-weight: lighter;padding-bottom: 10px;"><br />等你来答</div>
  					<div id="dengnilaidacontent" style="color:#333;font-weight: lighter;padding-bottom: 6px;margin-right: 100px;">
  						<c:forEach items="${dnHelps }" var="help" varStatus="s">
						   	<div><a href="help_detail.action?id=${help.id }" title="${help.title}">${help.title.length()>20?help.title.substring(0,20):help.title}${help.title.length()>20?"...":""}</a>
						   	<span class="pull-right"><script>document.write(getTimeFormatText("${help.begintime }"));</script></span></div>
					     </c:forEach>
  					</div>
  				</div>
  			</div>
  			<div class="col-md-3">
  				<p class="lead">${sessionScope.user.name }&nbsp;&nbsp;<span id="great"></span></p>
  				<dl class="newer-guide">
				<dt>新手上路</dt>
				<dd>
				<i class="glyphicon glyphicon-search"></i>
				<a href="http://tieba.baidu.com/p/3629741633" target="_blank" log="pid:102,type:2014,action:click,area:guide,page:newer-guide">如何在百度知道答题</a>
				</dd>
				<dd>
				<i class="glyphicon glyphicon-zoom-in"></i>
				<a href="http://tieba.baidu.com/p/3615829242?pid=65420615204&amp;cid=0#65420615204" target="_blank" log="pid:102,type:2014,action:click,area:guide,page:newer-guide">如何获得用户采纳</a>
				</dd>
				<dd>
				<i class="glyphicon glyphicon-time"></i>
				<a href="http://tieba.baidu.com/p/3615827221?pid=65372921312&amp;cid=0#65372921312" target="_blank" log="pid:102,type:2014,action:click,area:guide,page:newer-guide">知道财富值有什么用</a>
				</dd>
				<dd>
				<i class="glyphicon glyphicon-cog"></i>
				<a href="http://tieba.baidu.com/p/3615827221?pid=65372921312&amp;cid=0#65372921312" target="_blank" log="pid:102,type:2014,action:click,area:guide,page:newer-guide">去哪里寻找一起答题的朋友</a>
				</dd>
				</dl>
  			</div>
  			<div class="col-md-1">  			
  	  	</div>
  	  	 
  	  	</div>
  	  	
  	  	
  	  	
  	  	 <br /><br /><br /><br /><br />  <br /><br /><br /><br /><br />
  	  	 
  	 	</div>
    
    <%@include file="../include/footer.jsp" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script> 
  	<script>
    	$(function() {
    		var path = "${help.imgPath }";
    		var paths = path.split(";");
    		for (var p=0; p < paths.length-1; p++){
    			$("#imgs").append("<img src=\"${pageContext.request.contextPath}${ImgPath}//"+paths[p]+"\" height=\"300px\" width=\"550px\"><br/><br/>");
    		}    		
    		$("#great").text(getTimeGreat());
			$("#time").text(getTimeFormatText("${help.begintime}"));
/* 	  		$("#look").text("浏览"+${help.look}+"次");
	  		$("#tabs").text("标签："+${help.tab }); */
	});  
	
 	</script>
  </body>
</html>