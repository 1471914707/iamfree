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
    			<div style="margin-bottom: 10px;">搜索结果</div>
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
    		</div>
    		<div class="col-md-1"></div>
    	</div>
    	<div id="pan">
    		<c:if test="${helps != null }">
      		<div style="font-size: 18px;margin:0 auto; width:600px; height:30px;text-align: right;">
       		<s:set name="page" value="#request.page"></s:set>
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
    </div>
    <%@include file="include/footer.jsp" %>
  </body>
</html>
