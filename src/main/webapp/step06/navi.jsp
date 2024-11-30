<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- sessionId 얻어오기 -->
<%
String sessionId = (String)session.getAttribute("sessionId");
%>



    
<header id="header" class="header fixed-top">
    <div class="topbar d-flex align-items-center">
      <div class="container d-flex justify-content-center justify-content-md-between">
        <div class="contact-info d-flex align-items-center">
          <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
          <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
        </div>
        <div class="social-links d-none d-md-flex align-items-center">
          <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
          <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
          <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
          <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>
      </div>
    </div><!-- End Top Bar -->

	<!-- 관리자용 네브 -->
	<c:choose>
		<c:when test='${sessionId eq "admin"}'>
			<nav class="navmenu bg-secondary">
				<ul>
					<li><a class="dropdown-item"
						href='<c:url value="/step06/addProduct.jsp"/>'>판매제품 등록</a></li>
					<li><a class="dropdown-item"
						href='<c:url value="/step06/index.jsp?edit=update#products"/>'>판매제품
							수정</a></li>
					<li><a class="dropdown-item"
						href='<c:url value="/step06/index.jsp?edit=delete#products"/>'>판매제품
							삭제</a></li>
				</ul>
			</nav>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	<div class="branding d-flex align-items-cente">
      
      <div class="container position-relative d-flex align-items-center justify-content-between">
        <a href="index.jsp" class="logo d-flex align-items-center">
          <!-- Uncomment the line below if you also wish to use an image logo -->
          <!-- <img src="../resources/assets/img/logo.png" alt=""> -->
          <h1 class="sitename">Impact</h1>
          <span>.</span>
        </a>
        
           
			
<!-- 			일반 사용자용 네브 -->
		 <nav id="navmenu" class="navmenu">
				<ul>
					<li><a href="<c:url value="/step06/index.jsp#hero"/>"
						class="active">Home<br></a></li>
					<li><a href='<c:url value="/step06/index.jsp#about"/>'>About</a></li>
					<li><a href='<c:url value="/step06/index.jsp#services"/>'>Services</a></li>
					<li><a href='<c:url value="/step06/index.jsp#products"/>'>Products</a></li>
					<li><a href='<c:url value="/step06/index.jsp#team"/>'>Team</a></li>
					<li><a href='<c:url value="/step06/blog.jsp"/>'>Blog</a></li>
					<!-- <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
              <ul>
                <li><a href="#">Dropdown 1</a></li>
                <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                  <ul>
                    <li><a href="#">Deep Dropdown 1</a></li>
                    <li><a href="#">Deep Dropdown 2</a></li>
                    <li><a href="#">Deep Dropdown 3</a></li>
                    <li><a href="#">Deep Dropdown 4</a></li>
                    <li><a href="#">Deep Dropdown 5</a></li>
                  </ul>
                </li> 
                <li><a href="#">Dropdown 2</a></li>
                <li><a href="#">Dropdown 3</a></li>
                <li><a href="#">Dropdown 4</a></li>
              </ul>
            </li>
            -->
					<li><a href='<c:url value="/BoardListAction.do?pageNum=1"/>'>게시판</a></li>

					<c:choose>
						<c:when test="${empty sessionId}">
							<li><a class="dropdown-item"
								href='<c:url value="/member/loginMember.jsp"/>'>회원 로그인</a></li>
							<li><a class="dropdown-item"
								href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a></li>
						</c:when>

						<c:otherwise>
						    <li style="color:orange">[<%=sessionId %>]님 로긴중</li>
							<li><a class="dropdown-item"
								href='<c:url value="/member/updateMember.jsp"/>'>회원 수정</a></li>
							<li><a class="dropdown-item"
								href='<c:url value="/member/logoutMember.jsp"/>'>로그아웃</a></li>
						</c:otherwise>
					</c:choose>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#">배송 정보</a></li>
				</ul>
				<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>

      </div>

    </div>

  </header>