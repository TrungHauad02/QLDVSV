<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page import="Models.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
    <link rel="stylesheet" href="../css/style_SV.css">
    <style>
	    .col1 { width: 18%; }
	    .col2 { width: 30%; }
	    .col3 { width: 16%; }
	    .col4 { width: 12%; }
	    .col5 { width: 25%; }
	    .col6 { width: 10%; }
	    .col7 { width: 5%; }
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <!-- Phần header -->
	<%
	TaiKhoan account = (TaiKhoan) session.getAttribute("Acc");
	%>
	<%
	if (account == null) {
	%>
	<%
		response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	%>
	<%
	} 
	%>		
	<jsp:include page="header.jsp"></jsp:include>
    <!-- Phần Body -->
    <div class="wrapper">

        <!-- Phần sidebar -->
        <div class="sidebarnew">
            <ul class="menu">
                <li><a href="<%=request.getContextPath()%>/SV/thongbao">Trang của bạn</a></li>
                <li><a href="<%=request.getContextPath()%>/SV/info">Thông tin cá nhân</a></li>
                <li><a href="<%=request.getContextPath()%>/SV/DKXNNN">Xác nhận ngành nghề</a></li>
                <li><a href="<%=request.getContextPath()%>/SV/DKGXN">Đăng kí giấy xác nhận</a></li>
                <li><a href="<%=request.getContextPath()%>/SV/CTXH" class="special-link">Đăng kí tham gia CTXH</a></li>
            </ul>
        </div>
    
        <!-- Phần content -->
        <div class="main-content">
            <div class="row">
			  <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
			
			  <div class="container">
			   <h3 class="text-center">Đăng kí hoạt động công tác xã hội</h3>
			   <hr>
			  <legend class="my-legend"> 
			  	<fieldset style="border:1px solid black; padding: 10px;">
				    <legend class="my-legend">Danh sách hoạt động</legend>
				    	<div style="height: 300px; overflow: auto;">
						   <table class="table table-bordered table-custom">
						    <thead>
						     <tr>
						      <th class="col1">Tên hoạt động</th>
						      <th class="col2">Nội dung</th>
						      <th class="col4">Ngày diễn ra</th>
						      <th class="col4">Ngày kết thúc</th>
						      <th class="col4">Điểm CTXH</th>
						      <th class="col6">Đăng kí</th>
						     </tr>
						    </thead>
						    <tbody>
						     <!--   for (Todo todo: todos) {  -->
						     <c:forEach var="dsctxh" items="${listCTXH}">
						
						      <tr>
						       <td class="col1"><c:out value="${dsctxh.tenHD}" /></td>
						       <td class="col2"><c:out value="${dsctxh.noiDung}" /></td>
						       <td class="col4"><c:out value="${dsctxh.tgDienRa.format(DateTimeFormatter.ofPattern('dd-MM-yyyy'))}" /></td>
						       <td class="col4"><c:out value="${dsctxh.tgKetThuc.format(DateTimeFormatter.ofPattern('dd-MM-yyyy'))}" /></td>
							   <td class="col4"><c:out value="${dsctxh.diem}" /></td>
							   <td class="col6"><a href="dk_CTXH?maHD=<c:out value='${dsctxh.maHD}'/>&tenHD=<c:out value='${dsctxh.tenHD}'/>" onclick="return checkRegistration('<c:out value='${dsctxh.maHD}'/>')">Đăng kí</a>
						
						       <!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
						                 <button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						      </tr>
						     </c:forEach>
						     <!-- } -->
						    </tbody>
						   </table>
						</div>
					</fieldset>
				</legend>
			   
			   <br>
			   <legend class="my-legend"> 
			  	<fieldset style="border:1px solid black; padding: 10px;">
				    <legend class="my-legend">Các hoạt động đã đăng kí</legend>
				    	<div style="height: 300px; overflow: auto;">
						   <table class="table table-bordered table-custom">
						    <thead>
						     <tr>
						      <th class="col1">Tên hoạt động</th>
						      <th>Nội dung</th>
						      <th class="col3">Thời gian đăng kí</th>
						      <th class="col4">Điểm CTXH</th>
						      <th class="col4">Trạng thái</th>
						      <th class="col7"></th>
						     </tr>
						    </thead>
						    <tbody>
						     <!--   for (Todo todo: todos) {  -->
						     <c:forEach var="dkctxh" items="${listDKCTXH}">
						
						      <tr class="dkctxh" data-maHD="<c:out value='${dkctxh.maHD}'/>" data-trangThai="<c:out value='${dkctxh.trangThai}'/>">
						       <td class="col1"><c:out value="${dkctxh.tenHD}" /></td>
						       <td><c:out value="${dkctxh.noiDung}" /></td>
						       <td class="col3"><c:out value="${dkctxh.thoiGianDK.format(DateTimeFormatter.ofPattern('dd-MM-yyyy HH:mm:ss'))}" /></td>
							   <td class="col4"><c:out value="${dkctxh.diem}" /></td>
							   <td class="col4"><c:out value="${dkctxh.trangThai}" /></td>
							   <td class="col7"><a href="delete_CTXH?id=<c:out value='${dkctxh.id}'/>" id="deleteLink" style="display: none;">Hủy</a></td>
						       <!--  <td><button (click)="updateTodo(todo.id)" class="btn btn-success">Update</button>
						                 <button (click)="deleteTodo(todo.id)" class="btn btn-warning">Delete</button></td> -->
						      </tr>
						     </c:forEach>
						     <!-- } -->
						    </tbody>
						   </table>
					   </div>   
					   <div class="container text-right table-custom">
						<label style="color:blue; font-size:20px" for="combo1">Điểm CTXH: </label>
						<span style="color:red; font-size:20px; font-weight:bold">${SinhVien.diemCTXH}</span>
					   </div>	
					</fieldset>
				</legend>
			   
			  </div>
			 </div>
			</div>
    </div>
    
    <script>
	    function checkRegistration(maHD) {
	        // Danh sách các maHD đã đăng ký
	        var registeredMaHD = []; // Thay đổi thành danh sách thực tế của bạn
	
	        // Lấy danh sách maHD từ các phần tử dkctxh
	        var dkctxhElements = document.querySelectorAll('.dkctxh');
	        dkctxhElements.forEach(function(element) {
	            registeredMaHD.push(element.getAttribute('data-maHD'));
	        });
	
	        if (registeredMaHD.includes(maHD)) {
	            alert('Bạn đã đăng kí hoạt động này rồi');
	            return false;
	        } else {
	            return true;
	        }
	    }
	</script>
	<script>
	  window.onload = function() {
	    var rows = document.getElementsByClassName('dkctxh');
	    for (var i = 0; i < rows.length; i++) {
	      var row = rows[i];
	      var status = row.getAttribute('data-trangThai');
	      var deleteLink = row.querySelector('#deleteLink');
	      if (status === 'Chưa duyệt') {
	        deleteLink.style.display = 'block';
	      }
	    }
	  };
	</script>
	<% if (session.getAttribute("status") != null) { %>
	    <script>
	        $(document).ready(function() {
	            var status = '<%=session.getAttribute("status")%>';
	            console.log('Status: ' + status);
	            if (status == 'insert_TC') {
	                alert('Đăng ký thành công!');
	            } else if (status == 'insert_TB') {
	                alert('Đăng ký thất bại!');
	            }
	            else if (status == 'delete_TC') {
	                alert('Xóa thành công!');
	            }
	            else if (status == 'delete_TB') {
	                alert('Xóa thất bại!');
	            }
	            else if (status == 'cancel_TC'){
	            	alert('Hủy thành công!');
	            }
	            else if (status == 'cancel_TB'){
	            	alert('Hủy thất bại!');
	            }
	        });
	    </script>
	    <% session.removeAttribute("status"); %>
	<% } %>	
</body>
</html>

