<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
</head>
<body>

  <div>
    <form id="frm-register"
          method="POST"
          action="${contextPath}/contact/register.do">
      <div>
        <label for="name">이름</label>
        <input type="text" id="name" name="name" value="${contact.name}">
      </div>
      <div>
        <label for="mobile">연락처</label>
        <input type="text" id="mobile" name="mobile" value="${contact.mobile}">
      </div>
      <div>
        <label for="email">이메일</label>
        <input type="text" id="email" name="email" value="${contact.email}">
      </div>
      <div>
        <label for="address">주소</label>
        <input type="text" id="address" name="address" value="${contact.address}">
      </div>
  <div>
    <button type="submit">등록</button>
    <button type="reset">입력초기화</button>
    <button type="button" id="btn-list">목록</button>
  </div>
   </form>
  </div>
  
  <script>
  
   const btnList = document.getElementById('btn-list');
   
   btnList.addEventListener('click', (evt)=>{
	   location.href = '${contextPath}/contact/list.do';
   })
  
  
  </script>
 



</body>
</html>