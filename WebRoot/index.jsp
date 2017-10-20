<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页</title>
  </head>
  
  <body>
    <%@include file="include/header.jsp" %><br /><br /><br /><br /><br />
    <div class="container">
    	<div class="row">
    		<div class="col-md-1"></div>
    		<div class="col-md-10" style="font-size: 18px;">
    		<div class="panel-body">
			      	<div style="padding-bottom: 3px;font-weight: normal;">

			      	 	<c:forEach items="${helps }" var="help" varStatus="s">
			      	 	
			      	 	<div class="media well well-lg">
   						<a class="pull-left" href="#">
						      <c:choose>
								<c:when test="${(help.TUser.imgpath != null && !('' eq help.TUser.imgpath)) && 'F' eq help.anonymous}">
									<img src="${pageContext.request.contextPath }${IconPath }/${help.TUser.imgpath}" class="media-object" title="${help.TUser.name }" width="56.996px" height="56.996px">
								</c:when>
								<c:when test="${(help.TUser.imgpath == null || '' eq help.TUser.imgpath) && 'F' eq help.anonymous}">
								 	<img src="${pageContext.request.contextPath }${IconPath }/icon.png" class="media-object" width="56.996px" height="56.996px" title="${help.TUser.name }"> 
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath }${IconPath }/icon.png" class="media-object" width="56.996px" height="56.996px">
								</c:otherwise>
							   </c:choose>
						   </a>
						   <div class="media-body">
						      <h4 class="media-heading"><a href="help_detail.action?id=${help.id }" target="_blank"><b>${help.title }</b></a></h4>
						      <div style="margin-right:20px;margin-top:5px;">${help.content.length()>140?help.content.substring(0,140):help.content}${help.content.length()>140?"...<a>展开</a>":""}&nbsp;&nbsp;&nbsp;</div>
						      
						      <div class="pull-right">
					      		悬赏金币：${help.fcoin }&nbsp;&nbsp;&nbsp;回答（${help.TComments.size() }）&nbsp;&nbsp;&nbsp;
					      		<script>document.write(getTimeFormatText("${help.begintime }"));</script>&nbsp;&nbsp;&nbsp;
					      		</div>
						   </div>
						</div>
			      	 	
			      	 	
			      	 	
			      	 <%-- 	<div class="well well-lg">
						<c:choose>
						<c:when test="${(help.TUser.imgpath != null && !('' eq help.TUser.imgpath)) && 'F' eq help.anonymous}">
							<img src="${pageContext.request.contextPath }${IconPath }/${help.TUser.imgpath}" class="img-circle" title="${help.TUser.name }" width="56.996px" height="56.996px">
						</c:when>
						<c:when test="${(help.TUser.imgpath == null || '' eq help.TUser.imgpath) && 'F' eq help.anonymous}">
						 	<img src="${pageContext.request.contextPath }${IconPath }/icon.png" class="img-circle" width="56.996px" height="56.996px" title="${help.TUser.name }"> 
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }${IconPath }/icon.png" class="img-circle" width="56.996px" height="56.996px">
						</c:otherwise>
						</c:choose>
						<b>${help.title }</b>
						<div style="margin-right:20px;margin-top:5px;">${help.content.length()>140?help.content.substring(0,140):help.content}${help.content.length()>140?"...<a>展开</a>":""}&nbsp;&nbsp;&nbsp;<a href="help_detail.action?id=${help.id }" target="_blank"><span style="color:blue;">详情</span></a></div>
			      		<div class="pull-right">
			      		悬赏金币：${help.fcoin }&nbsp;&nbsp;&nbsp;回答（${help.TComments.size() }）&nbsp;&nbsp;&nbsp;
			      		<script>document.write(getTimeFormatText("${help.begintime }"));</script>&nbsp;&nbsp;&nbsp;
			      		</div></div><br /> --%>
				 		</c:forEach> 
				 		
			      	</div>  					
				  </div></div>
    			<%-- <div style="margin-bottom: 10px;">即时发布</div>
    			<c:forEach items="${helps }" var="help" varStatus="s"><div style="padding-bottom: 5px;font-weight: normal;">
						<c:choose>
						<c:when test="${(help.TUser.imgpath != null && !('' eq help.TUser.imgpath)) && 'F' eq help.anonymous}">
							<img src="${pageContext.request.contextPath }${IconPath }/${help.TUser.imgpath}" class="img-circle" title="${help.TUser.name }" width="56.996px" height="56.996px">
						</c:when>
						<c:when test="${(help.TUser.imgpath == null || '' eq help.TUser.imgpath) && 'F' eq help.anonymous}">
						 	<img src="${pageContext.request.contextPath }${IconPath }/icon.png" class="img-circle" width="56.996px" height="56.996px" title="${help.TUser.name }"> 
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }${IconPath }/icon.png" class="img-circle" width="56.996px" height="56.996px">
						</c:otherwise>
						</c:choose>
						 <a href="help_detail.action?id=${help.id }" style="color:#2d64b6;">${help.content }</a>
						 <span class="pull-right"><script>document.write(getTimeFormatText("${help.begintime }"));</script>
						 </span><br /></div>
				 </c:forEach>    			
    		</div> --%>
    		<div class="col-md-1"></div>
    	</div>
    	<div id="pan">
    		<c:if test="${helps != null }">
      		<div style="font-size: 18px;margin:0 auto; width:600px; height:30px;text-align: right;">
       		<s:set name="page" value="#request.page"></s:set>
       		<a href="${pageContext.request.contextPath }/user_index.action?pageNow=1">首页</a>
				<s:if test="#page.hasPre">
					<a href="${pageContext.request.contextPath }/user_index.action?pageNow=<s:property value="#page.pageNow-1"/>">上一页</a>
				</s:if>
				<s:else>
					<a href="${pageContext.request.contextPath }/user_index.action?pageNow=1">上一页</a>
				</s:else>
					<a href="${pageContext.request.contextPath }/user_index.action?pageNow=<s:property value="#page.pageNow+1"/>">下一页</a>
       		</div>
      </c:if>     
    	</div>
    	<%@include file="include/userscorller.jsp" %>
    </div>
    <%@include file="include/footer.jsp" %>
  </body>
</html>