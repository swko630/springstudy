<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <jsp:include page="../layout/header.jsp">
    <jsp:param value="Sign In" name="title"/>
  </jsp:include>


  <h1>Sign In</h1>
  
  <div>
    <form method="POST"
          action="${contextPath}/user/signin.do">
      <div>
        <label for="email">아이디</label>
        <input type="text" id="email" name="email" placeholder="example@naver.com">
      </div>
      <div>
        <label for="pw">비밀번호</label>
        <input type="password" id="pw" name="pw" placeholder="●●●●">
      </div>
      <div>
        <input type="hidden" name="url" value="${url}">
        <button type="submit">Sign In</button>
      </div>
       <div>
        <a href="${naverLoginURL}">
          <img src="${contextPath}/resources/2021_Login_with_naver_guidelines_Kr/btnG_아이콘사각.png">
        </a>
       </div>
    </form>
  </div>
  
  
<%@ include file="../layout/footer.jsp" %>  