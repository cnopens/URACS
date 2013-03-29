<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../../common/include_tag.jsp" %>
<%@ include file="../../common/page_var.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=pageTitle%> - 用户操作日志</title>

    <%@ include file="../../common/page_head.jsp" %>

    <script type="text/javascript">
        
        $().ready(function(){
        	pilicat.alternately('list');

        });

    </script>
</head>
<body>

    <div style="height: 60px; overflow: hidden">
		<%@ include file="../u_top.jsp" %>
    </div>
    
    <div id="frame_side">
        <%@ include file="../u_login_info.jsp" %>

		<jsp:include page="../u_left_menu.jsp"  flush="true">
        	<jsp:param name="current" value="roles"/>
       	</jsp:include>

    </div>
    <div id="body_box">
        <table cellpadding="0" cellspacing="0" border="0" class="icon">
            <tr>
                <td>
                </td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" border="0" class="table">
			<tbody>
			<tr>
				<td valign="top" align="right">
					<form action="" method="get" name="search" id="search">
					<table cellpadding="0" cellspacing="5" border="0">
						<tbody>
						<tr>							
							<td>
							<!-- 搜索条件 搜索按钮 -->
							</td>
						</tr>
					</tbody></table>			
					</form>
				</td>
			</tr>
		</tbody>
	</table>
        
        <div class="rounded table">
            <form action="" method="get" name="search_form" id="search_form">
                <table width="100%" cellpadding="0" cellspacing="0" border="0" class="box_top">
                    <tr>
                        <td class="title">用户日志列表</td>
                        <td>                            
                        </td>
                    </tr>
                </table>
            </form>

                <table class="list td_align" cellpadding="0" cellspacing="1" border="0">
                    <tr>
                        <td class="field_head">用户昵称</td>
                        <td class="field_head">日志类型</td>
                        <td class="field_head">用户IP</td>
                        <td class="field_head">日志内容</td>
                        <td class="field_head">记录时间</td>
                        
                    </tr>
                    
                    <c:if test="${totalCount==0}">
                    <tr>
                        <td colspan="5" class="field_head">没有相关数据</td>
                    </tr>
                    </c:if>
                    
                    <c:forEach items="${dataList}"  var="dataItem" varStatus="rowStatus" >
                    
                    <c:choose>
						<c:when test="${rowStatus.index%2==0}">
							<tr class="odd">
						</c:when>												
						<c:otherwise>
							<tr class="even">
						</c:otherwise>
					</c:choose>

						<td>${dataItem.userNick}</td>
						<td>
						
						<c:choose>
							<c:when test="${dataItem.logType==0}">
								<font color='blue'>系统日志</font>
							</c:when>
							<c:when test="${dataItem.logType==1}">
								<font color='green'>登录日志</font>
							</c:when>
							<c:when test="${dataItem.logType==2}">
								<font color='orange'>操作日志</font>
							</c:when>
							<c:when test="${dataItem.logType==3}">
								<font color='red'>中差评告警</font>
							</c:when>	
							<c:otherwise>
								<font color='red'>未知:${dataItem.logType}</font>
							</c:otherwise>
						</c:choose>
					
						</td>
						<td>
							${dataItem.userIp}
							
						</td>
						<td style="text-align:left;word-wrap:break-word;word-break:break-all;">	
                           ${dataItem.logDesc}    
						
						</td>
						<td>
							<fmt:formatDate value="${dataItem.logTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						
						
					</tr>
					</c:forEach>
					
                </table>
                <table class="table top_line">
                    <tr>
                        <td>
                            
                        </td>
                    </tr>
                </table>
            
            <table class="page" cellpadding="0" cellspacing="5">
                <tr>                    
                    <td>
                    <div  id="pageNav" class="scott">
						<font color="#88af3f">共${totalCount} 条数据，  ${totalPage} 页</font>  ${pageNav}
                    </div>
                    
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>

		<%@ include file="../u_bottom.jsp" %>

    </div>
</body>
</html>
