<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="Models.TaiKhoan"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Trang quản lí giấy xác nhận ngành nghề</title>
	<link rel="stylesheet" href="../css/style_CTSV.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<%
	TaiKhoan account = (TaiKhoan) session.getAttribute("Acc");
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
                <li><a href="<%=request.getContextPath()%>/Ctsv/listxnnn" class="special-link">Quản lý giấy xác nhận ngành nghề</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/listdkictxh">Quản lý hoạt động CTXH</a></li>
            </ul>
        </div>
        
	    <!-- Phần nội dung -->
	    <div class="main-content">
		    <fieldset style="border:1px solid black; padding: 10px;">
		    	<legend class="my-legend">Danh sách đăng kí giấy xác nhận ngành nghề</legend>
		        <table class="mytable">
			        <thead>
			            <tr>
			                <th>Năm học</th>
			                <th>MSSV</th>
			                <th>Học kì</th>
			                <th>Lý do</th>
			                <th>Thời gian đăng kí</th>
			                <th>Duyệt</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="xnnn" items="${xnnns}">
	                        <tr>
	                            <td>${xnnn.getNamHoc()}</td>  
	                            <td>${xnnn.getMssv()}</td> 	                            
	                            <td>${xnnn.getHocKy()}</td>
	                            <td>${xnnn.getTenLyDo()}</td>
	                            <td>${xnnn.getThoiGianDangKi().format(DateTimeFormatter.ofPattern('dd-MM-yyyy HH:mm:ss'))}</td>
	                            <td>
						            <a href="acceptxnnn?id=${xnnn.getID()}">Duyệt</a>
						        </td>
	                        </tr>        
	                    </c:forEach>     
			        </tbody>
			    </table>
			</fieldset>
			<button class="button-add" type="button"  onclick="window.location.href='<%= request.getContextPath() %>/pages_CTSV/TrangThemLyDo.jsp'" >Thêm lý do xác nhận ngành nghề</button>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
	    var isSuccess = <%= request.getAttribute("isSuccess") %>;
	    if (isSuccess != null) {
	        if (isSuccess) {
	            alert("Duyệt thành công!");
	        } else {
	            alert("Duyệt thất bại!");
	        }
	    }
	});
</script>
</html>