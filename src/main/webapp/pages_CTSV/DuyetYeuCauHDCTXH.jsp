<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.TaiKhoan"%>
<%@ page import="Models.DangKiCTXH"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Duyệt yêu cầu hoạt động CTXH</title>
	<link rel="stylesheet" href="../css/style_CTSV.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<%
	TaiKhoan account = (TaiKhoan)session.getAttribute("Acc");
	%>
	<%
	if (account == null) {
	%>
	<%
	response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
	%>
	<%
	} 
	%>
	<%
	DangKiCTXH dkictxh = (DangKiCTXH) request.getAttribute("dkictxh");
	%>
	<!-- Phần header -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- Phần Body -->
    <div class="wrapper">
        <!-- Phần sidebar -->
        <div class="sidebarnew">
            <ul class="menu">
            	<li><a href="<%=request.getContextPath()%>/Ctsv/listTB">Trang chủ</a></li>
				<li><a href="<%=request.getContextPath()%>/Ctsv/info">Thông tin cá nhân</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/listgxn">Quản lý giấy xác nhận</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/listxnnn">Quản lý giấy xác nhận ngành nghề</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/listdkictxh" class="special-link">Quản lý hoạt động CTXH</a></li>
            </ul>
        </div>
        
        <!-- Phần nội dung -->
	    <div class="main-content">
	    	<table class="mytable">
		        <thead>
		            <tr>
		            	<th>MSSV</th>
		                <th>Tên hoạt động</th>			                
		                <th>Điểm CTXH</th>
		                <th>Thời gian đăng kí</th>
		                <th>Trạng thái</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<tr>
		            	<td><%= dkictxh.getMssv() %></td> 
		            	<td><%= dkictxh.getTenHoatDong() %></td> 
		            	<td><%= dkictxh.getDiem() %></td> 
		            	<td>${dkictxh.getThoiGianDangKi().format(DateTimeFormatter.ofPattern('dd-MM-yyyy HH:mm:ss'))}</td>
		            	<td><%= dkictxh.getTrangThai() %></td>  
		            </tr> 
		        </tbody>
	    	</table>
	    	
	    	<form action="<%=request.getContextPath()%>/Ctsv/confirmacceptdkictxh?id=${dkictxh.getID()}" method="post">
		    	<fieldset style="border:1px solid black; padding: 10px;">
		    		<legend class="my-legend">Duyệt yêu cầu</legend>
					<div style="display: flex; flex-direction: column;">
				        <label for="title" style="font-weight: bold;">Tiêu đề:</label>
				        <input type="text" id="title" name="title" style="width: 100%; box-sizing: border-box; margin-bottom: 10px;" value="Yêu cầu tham gia CTXH đã được duyệt">
						<span id="titleError" style="color: red;"></span> 
				        <div style="display: flex; justify-content: space-between;">
				            <div style="flex: 1; margin-right: 5px;">
				                <label for="email" style="font-weight: bold;">Email:</label>
				                <input type="text" id="email" name="email" value="<%=dkictxh.getMssv()%>@student.hcmute.edu.vn"style="width: 100%; box-sizing: border-box;" readonly>
				                <span id="emailError" style="color: red;"></span>
				            </div>
				            <div style="flex: 2; margin-left: 5px;">
				                <label for="content" style="font-weight: bold;">Nội dung:</label>
				                <textarea id="content" name="content" style="width: 100%; box-sizing: border-box; height: 80px;"></textarea>
				                <span id="contentError" style="color: red;"></span> 
				            </div>
				        </div>
				
				        <div style="display: flex; justify-content: space-between; margin-top: 10px;">
				            <button type="submit" class="button" id="submitBtn">Duyệt</button>
				            <button type="button" class="button" id="cancelBtn" onclick="location.href='<%=request.getContextPath()%>/Ctsv/listdkictxh'">Hủy</button>
				        </div>
				    </div>
				</fieldset>
			</form>
	    </div>
    </div>
</body>
</html>
<script>
    const emailInput = document.getElementById('email');
    const contentInput = document.getElementById('content');
    const emailError = document.getElementById('emailError');
    const contentError = document.getElementById('contentError');

    emailInput.addEventListener('blur', checkEmailInput);
    contentInput.addEventListener('blur', checkContentInput);

    function checkEmailInput() {
        if (emailInput.value === '') {
            emailError.textContent = 'Vui lòng nhập email.';
        } else {
            emailError.textContent = ''; // Xóa thông báo nếu đã nhập
        }
    }

    function checkContentInput() {
        if (contentInput.value === '') {
            contentError.textContent = 'Vui lòng nhập nội dung.';
        } else {
            contentError.textContent = ''; // Xóa thông báo nếu đã nhập
        }
    }
    
    const titleInput = document.getElementById('title');
    const titleError = document.getElementById('titleError');

    titleInput.addEventListener('blur', checkTitleInput);

    function checkTitleInput() {
        if (titleInput.value === '') {
            titleError.textContent = 'Vui lòng nhập tiêu đề.';
        } else {
            titleError.textContent = ''; // Xóa thông báo nếu đã nhập
        }
    }
</script>