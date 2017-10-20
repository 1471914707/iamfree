<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${myhelps }" var="help" varStatus="s"><div id="h${help.id }" class="well well-lg">
						<b>${help.title }&nbsp;&nbsp;&nbsp;<a href="help_detail.action?id=${help.id }" target="_blank">详情</a></b>
						<div>${help.content.length()>140?help.content.substring(0,140):help.content}${help.content.length()>140?"...<a>展开</a>":""}</div>
			      		<div class="pull-right" style="cursor:pointer;">
			      		悬赏金币：${help.fcoin }&nbsp;&nbsp;&nbsp;回答（${help.TComments.size() }）&nbsp;&nbsp;&nbsp;
			      		<script>document.write(getTimeFormatText("${help.begintime }"));</script>&nbsp;&nbsp;&nbsp; 
			      		<a onclick="deleteHelp($(this),${help.id})">删除</a>
			      		&nbsp;&nbsp;&nbsp;<a>修改</a>
			      		</div></div><br />
				 		</c:forEach> 
				 		<div id="pan">
				    		<c:if test="${myhelps != null }">
				      		<div style="font-size: 18px;margin:0 auto; width:600px; height:30px;text-align: right;">
				       		<s:set name="page" value="#request.page"></s:set>
				       		<a href="${pageContext.request.contextPath }/help_myhelps.action?pageNow=1">首页</a>
								<s:if test="#page.hasPre">
									<a href="${pageContext.request.contextPath }/help_myhelps.action?pageNow=<s:property value="#page.pageNow-1"/>">上一页</a>
								</s:if>
								<s:else>
									<a href="${pageContext.request.contextPath }/help_myhelps.action?pageNow=1">上一页</a>
								</s:else>
									<a href="${pageContext.request.contextPath }/help_myhelps.action?pageNow=<s:property value="#page.pageNow+1"/>">下一页</a>
				       		</div>
				      </c:if>     
				    	</div>
			      	</div>  					
				  </div>
<script>

function deleteHelp(obj,id){
	$.post("${pageContext.request.contextPath}/help_delete.action",
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