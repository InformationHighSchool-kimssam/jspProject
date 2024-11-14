<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- header include-->
  <%@ include file="/step06/navi.jsp" %>
  <h1>회원정보</h1>
  <div class="container">
  	<%
  	String msg = request.getParameter("msg");
  	if(msg !=null){
  		if(msg.equals("1")) out.print("<h2>회원가입을 축하드립니다. 다시 로그인해주세요.</h2>");
  	}else{
  		out.print("<h2>회원정보가 존재하지 않습니다.</h2>");
  	}
  	%> 
  </div>	
  <!-- footer include -->
  <%@ include file="/step06/footer.jsp" %>
</body>
</html>