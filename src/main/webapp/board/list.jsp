<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="dto.Product" %>
<%@ page import="mvc.model.BoardDTO" %>      
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Index - Impact Bootstrap Template</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/assets/css/main.css" rel="stylesheet">

 <%
    int pageNum = ((Integer)request.getAttribute("pageNum")).intValue();
    List boardList = (List)request.getAttribute("boardlist");
 %>
</head>

<body>
  
  <!-- header include-->
  <%@ include file="/step06/navi.jsp" %>

	<!-- Section Title -->
	<div class="container section-title">
		<h2>게시판</h2>
		<p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint
			consectetur velit</p>
	</div>
	<!-- End Section Title -->
    <div class="container">
        <form action='<c:url value="/BoardListAction.do"/>' method="post">
            <div class="text-right">
                <span class="badge badge-success">전체 건</span>
            </div>
            <div style="padding-top:100px">
                <table class="table table-hover">
                    <tr>
                       <th>번호</th>
                       <th>제목</th>
                       <th>작성일</th>
                       <th>수정일</th>
                       <th>조회</th>
                       <th>글쓴이</th>
                    </tr>
                    <%
                       for(int i=0; i<boardList.size(); i++){
                    	   BoardDTO boardDTO = (BoardDTO)boardList.get(i);
                    %>
                    <tr>
                        <td><%=boardDTO.getNum() %></td>
                        <td><%=boardDTO.getSubject() %></td>
                        <td><%=boardDTO.getRegist_day() %></td>
                        <td><%=boardDTO.getUpdate_day() %></td>
                        <td><%=boardDTO.getHit()%></td>
                        <td><%=boardDTO.getName()%></td>
                    </tr>	 
                    <%  
                       }
                    %>
                </table>
            </div>
        </form>
    </div>





	<!-- footer include -->
  <%@ include file="/step06/footer.jsp" %>
 
  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/aos/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>

</html>