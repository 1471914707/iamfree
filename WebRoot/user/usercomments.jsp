<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${comments }" var="comment" varStatus="s">
		<div>回答自<a href="help_detail.action?id=${comment.THelp.id }">${comment.THelp.title.length()>140?comment.THelp.title.substring(0,30):comment.THelp.title}${comment.THelp.title.length()>30?"...":""}</a>
		</div><b>${comment.content }</b>
		<a onclick="deleteComment($(this),${comment.id})">删除</a>
		<script>document.write(getTimeFormatText("${comment.time }"));</script>	<br /><br />	
</c:forEach>

<div id="pan">
				    		<c:if test="${comments != null }">
				      		<div style="font-size: 18px;margin:0 auto; width:600px; height:30px;text-align: right;">
				       		<s:set name="page" value="#request.page"></s:set>
				       		<a href="${pageContext.request.contextPath }/comment_mycomments.action?pageNow=1">首页</a>
								<s:if test="#page.hasPre">
									<a href="${pageContext.request.contextPath }/comment_mycomments.action?pageNow=<s:property value="#page.pageNow-1"/>">上一页</a>
								</s:if>
								<s:else>
									<a href="${pageContext.request.contextPath }/comment_mycomments.action?pageNow=1">上一页</a>
								</s:else>
									<a href="${pageContext.request.contextPath }/comment_mycomments.action?pageNow=<s:property value="#page.pageNow+1"/>">下一页</a>
				       		</div>
				      </c:if>     
				    	</div>

<script>

function deleteComment(obj,id){
	$.post("${pageContext.request.contextPath}/comment_delete.action",
				{
					id:id
				},
				function(data,status){//回调函数
					var data = JSON.parse(data);
					if("true"==data.result){
						alert(data.msg);
						$("#h"+id).remove();
					}else{
						alert(data.msg);
					}
				});
}
	
</script>