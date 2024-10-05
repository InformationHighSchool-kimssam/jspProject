<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="dto.Product" %>    
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
  <link href="../resources/assets/img/favicon.png" rel="icon">
  <link href="../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="../resources/assets/css/main.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Impact
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- header include-->
  <%@ include file="navi.jsp" %>
  <div class="container-fluid bg-light p-5">
       <h1 class="p-5 display-3 mt-5">배송 정보</h1>
  </div>
  <div class="container">
    <div class="row my-5">
        <form action="./proccessShippingInfo.jsp">
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="성함 입력">
					</div>
				</div>
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">배송일 예약</label>
					<div class="col-sm-10">
						<input type="date" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="">
					</div>
				</div>
				<h1>카카오 우편번호 api</h1>
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">주소</label>
					<div class="col-sm-10">
						<input type="text" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="주소 입력">
					</div>
				</div>
				<div class="row my-5">
					<label for="colFormLabelLg"
						class="col-sm-2 col-form-label col-form-label-lg">연락처</label>
					<div class="col-sm-10">
						<input type="text" class="form-control form-control-lg"
							id="colFormLabelLg" placeholder="연락처 입력" size="4">
					</div>
				</div>
		</form>
    </div>
  </div>  
  
  
  
  
  
	
  <!-- footer include -->
  <%@ include file="footer.jsp" %>
 
  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="../resources/assets/vendor/aos/aos.js"></script>
  <script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="../resources/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>

  <!-- Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

</body>

</html>