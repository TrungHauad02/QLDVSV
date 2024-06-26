<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.TaiKhoan"%>
<%@ page import="Models.CTSV"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Trang thông tin cộng tác sinh viên</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="../css/style_CTSV.css">
	
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
    <jsp:include page="/pages_CTSV/header.jsp"></jsp:include>

    <!-- Phần Body -->
    <div class="wrapper">
        <!-- Phần sidebar -->
        <div class="sidebarnew">
            <ul class="menu">
                <li><a href="<%=request.getContextPath()%>/Ctsv/listTB">Trang chủ</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/info" class="special-link">Thông tin cá nhân</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/listgxn">Quản lý giấy xác nhận</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/listxnnn">Quản lý giấy xác nhận ngành nghề</a></li>
                <li><a href="<%=request.getContextPath()%>/Ctsv/listdkictxh">Quản lý hoạt động CTXH</a></li>
            </ul>
        </div>
        
	    <!-- Phần nội dung -->
	    <div class="main-content">
			<div class="label-frame">
		        <table >                     
                    <h3>Thông tin cá nhân </h3>                   
                    <tbody >      
                        <tr>
                            <td style=" width: 100px;">Họ tên :</td>
                            <td>${ttCTSV.getHoTen()} </td>                     
                        </tr>
                        
                        <tr>
                            <td>Ngày sinh :</td>
                            <td>${ttCTSV.getNgaySinh()} </td>                     
                        </tr>
                        
                        <tr>
                            <td>Giới tính: </td>
                            <td>${ttCTSV.getGioiTinh()} </td>                               
                        </tr>
                        
                        <tr>
                            <td>Địa chỉ: </td>
                                      
                            <td>${ttCTSV.getDiaChi()} </td> 
                        </tr>
                        
                        <tr>
                            <td>Quê quán : </td>
                            <td>${ttCTSV.getQueQuan()} </td>                     
                        </tr>
                            
                        
                            
                        <tr>
                            <td>Tình trạng:  </td>
                            <td>${ttCTSV.getTrangThai()}</td>                     
                        </tr>
    
                        
                        <!-- Thêm các hàng dữ liệu khác vào đây -->
                    </tbody>            
                </table>
	    	</div>

		    <!-- Label frame chứa thông tin liên lạc -->
		    <div class="label-frame">
		        <h3>Thông tin liên lạc</h3>
		        
		        <h5>Điện thoại: </h5>
		        <input type="text" name ="phoneInput"  id="phoneInput" value="${ttCTSV.getSoDienThoai()}" style="width: 230px; font-size: 18px;" disabled>
		        <span id="phoneError" style="color: red;"></span>
		         <br>
                <br>
		        
		        <h5>Email: </h5>
		        <input type="text" name ="emailInput" id="emailInput" value="${ttCTSV.getEmail()}" style="width: 230px; font-size: 18px;" disabled>
                <span id="emailError" style="color: red;"></span>
                
                <br>
                <br>
                <br>
               <div >
               		<button class="button edit-button" onclick="enableInputs()">Cập nhật</button>
			        <button class="button save-button" onclick="updateTT()" >Lưu</button>
	                <button class="button cancel-button" onclick="cancelChanges()" >Hủy</button>
               </div>                
		       
		    </div>
		    
			
		    <!-- Button đổi mật khẩu -->
		    <div>
		    	<button class="button change-password-button" type="button"  onclick="window.location.href='<%= request.getContextPath() %>/pages_Main/ThaydoiMK.jsp'" >Đổi mật khẩu</button>
		    </div>
    </div>
    
</body>
</html>

<script>

    function enableInputs() {
        document.getElementById('phoneInput').removeAttribute('disabled');
        document.getElementById('emailInput').removeAttribute('disabled');
    }

    function saveChanges() {
        // Thực hiện lưu thay đổi ở đây

        // Sau khi lưu, đặt lại thuộc tính disabled cho input
        document.getElementById('phoneInput').disabled = true;
        document.getElementById('emailInput').disabled = true;
    }

    function cancelChanges() {
        // Thực hiện hủy thay đổi ở đây

        // Sau khi hủy, đặt lại thuộc tính disabled cho input
        document.getElementById('phoneInput').disabled = true;
        document.getElementById('emailInput').disabled = true;
        window.location.href = '<%=request.getContextPath()%>/Ctsv/info';
    }
    
    function updateTT() {
        var isValid = validateInputs();

        if (!isValid) {
            return;
        }

        saveChanges();
        var phoneInputValue = document.getElementById("phoneInput").value;
        var emailInputValue = document.getElementById("emailInput").value;

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // Xử lý kết quả nếu cần
                console.log("Dữ liệu đã được gửi thành công đến Servlet");
            }
        };
        xhttp.open("POST", "<%=request.getContextPath()%>/CTSV/update", true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send("phoneInput=" + phoneInputValue + "&emailInput=" + emailInputValue);
    }

    function validateInputs() {
        var phoneInputValue = document.getElementById("phoneInput").value;
        var emailInputValue = document.getElementById("emailInput").value;

        var phoneError = document.getElementById("phoneError");
        var emailError = document.getElementById("emailError");

        phoneError.innerHTML = "";
        emailError.innerHTML = "";

        // Kiểm tra số điện thoại có 10 chữ số
        if (phoneInputValue.length !== 10 || isNaN(phoneInputValue)) {
            phoneError.innerHTML = "Vui lòng nhập đúng 10 chữ số.";
            return false;
        }

        // Kiểm tra định dạng email
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(emailInputValue)) {
            emailError.innerHTML = "Vui lòng nhập email đúng định dạng.";
            return false;
        }

        return true;
    }
</script>