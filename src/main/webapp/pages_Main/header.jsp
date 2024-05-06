<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<!-- Phần header -->

	<%@ page import="SameSiteCookie.SamesiteHttpServletResponse"%>
	<%
		SamesiteHttpServletResponse wrappedResponse = new SamesiteHttpServletResponse(response);
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				 wrappedResponse.addCookie(cookie);
			}
		}
	%>
	<div class="image-container">
	    <img border="0" src="../img/SPKT.jpg" alt="Ảnh" class="full-width-img">
	</div>
	<div class="button-container">
	    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #00558c">
	    		<input type="hidden" name="csrf_token"
		    		<c:if test="${csrf_token !=null}">
		    				value="${csrf_token}"
		    		</c:if>
	    		>	
	        <ul class="navbar-nav navbar-collapse justify-content-end">
	            <li><a href="MainPage.jsp" class="nav-link">Trang chủ</a></li>
	            <li><a href="MainPage.jsp" class="nav-link">Đăng xuất</a></li>
	        </ul>
	    </nav>
	</div>
</header>