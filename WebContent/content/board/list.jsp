<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<c:if test="${sessionID==null}">
 	<script language="JavaScript">      
        alert("로그인후 이용가능 합니다.");
        history.go(-1);
 	</script>
</c:if>
<center>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title></head><body>
<div class="w3-container">
<span class="w3-center  w3-large">
		<br/>
	</span>
	<p class="w3-right w3-padding-right-large">
		<a href="writeForm?pageNum=${pageNum}">글쓰기</a>
	</p>
<c:if test="${count==0 }">
<table class="w3-table-all" width="700">
		<tr class="w3-grey">
			<td align="center" width="50">저장된 글이 없습니다</td>
		</tr></table></c:if> 

<c:if test="${count>0 }">

<table class="w3-table-all" width="700">
		<tr class="w3-grey">
			<td align="center" width="50">번호</td>
			<td align="center" width="250">제 목</td>
			<td align="center" width="100">작성자</td>
			<td align="center" width="150">작성일</td>
			<td align="center" width="50">조 회</td>
			<td align="center" width="100">IP</td>
		</tr>
<c:forEach   var="article"    items="${articleList }">
 
		<tr height="30">
			<td align="center" width="50"><c:out value="${number}"/></td>
			<c:set var="number"  value="${number-1 }"/>
			<td width="250">
		<c:if test="${article.re_level > 0 }">
			
				 <img src="<%=request.getContextPath() %>/images/level.gif"
				width="${5*article.re_level}" height="16">
				 <img src="<%=request.getContextPath() %>/images/re.gif">
				</c:if>
				
	
<a href="content?num=${article.num}&pageNum=${pageNum}">${article.subject}</a> 
	
	<c:if test="${article.readcount>= 5 }">
		 <img src="<%=request.getContextPath() %>/images/hot.gif" 
 border="0" height="16">
				</c:if>
			
			
			
			</td>
			<td align="center" width="100">${article.writer}</td>
			
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			
			
			
			
			<td align="center" width="150">
			<fmt:formatDate type="date" value="${article.reg_date}" />
		
		
		
		</td>
			<td align="center" width="50">${article.readcount}</td>
			<td align="center" width="100">${article.ip}</td>
		</tr>	
	</c:forEach>
	
	
	
	
</table>

  <div class="w3-center">
  <c:if test="${ startPage>bottomLine}">

    <a href="list?pageNum=${startPage - bottomLine}">[이전]</a> </c:if>
<c:forEach   var="i"  begin="${startPage }"   end="${endPage }">

     <a href="list?pageNum=${i}">[${i}] </a>
</c:forEach>

<c:if test="${ endPage<pageCount}">

<a href="list?pageNum=${startPage + bottomLine}">[다음]</a></c:if>
 
 
</div></c:if>
</div> 

</center>

<br/>
<br/>

</body>
</html>