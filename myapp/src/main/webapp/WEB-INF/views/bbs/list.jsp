<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

    
<jsp:include page="../layout/header.jsp"/>

  <h1 class="title">BBS</h1>
  
  <a href="${contextPath}/bbs/write.page">작성하러가기</a>  
  
<%@ include file="../layout/footer.jsp" %>  













