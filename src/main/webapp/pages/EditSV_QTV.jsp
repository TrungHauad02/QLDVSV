<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="Models.TaiKhoan"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/style.css">
    
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
    <jsp:include page="/pages/header.jsp"></jsp:include>

    <!-- Phần Body -->
    <div class="wrapper">

        <!-- Phần sidebar -->
        <div class="sidebar">
            <ul class="menu">
                <li><a href="<%=request.getContextPath()%>/Qtv/info">Thông tin cá nhân</a></li>
                <li><a href="<%=request.getContextPath()%>/Qtv/listSV" class="special-link">Quản lý sinh viên </a></li>
                <li><a href="<%=request.getContextPath()%>/Qtv/listCTSV">Quản lý người dùng</a></li>
                <li><a href="<%=request.getContextPath()%>/Qtv/listKhoa">Quản lý khoa</a></li>
                <li><a href="<%=request.getContextPath()%>/Qtv/listKH">Quản lý khóa học</a></li>
                <li><a href="<%=request.getContextPath()%>/pages/ThongkeWeb_QTV.jsp">Thống kê tình hình sử dụng </a></li>
            </ul>
        </div>
    
        <!-- Phần content -->
        <div class="main-content">  
        <c:if test="${SinhVien != null}">
	     	<form action="update_TT_SV" method="post">
	    </c:if>
	    <c:if test="${SinhVien == null}">
	     	<form action="insert_SV" method="post">
	    </c:if>
	            <div style="width: 100%; max-height: 50%"  class ="tables-container">
	            	 <div>
            
			            	<%
			                    String errMsg = (String) request.getAttribute("errMsg");
			       
			                %>
			                <%
			                    if (errMsg!=null){
			                %>   
			                <p style="color :red; font-size:23px; font-style: italic;"> <%=errMsg%> </p>       
			                <%
			                } 
			                %>
		            </div>            
	                <div class="form-row" style="width: 99%">
	                    <div class="column">
	                    	<div class="form-group">
		                        <h3>MSSV :</h3>
		                        <c:if test="${SinhVien != null}">
							     	<input type="text" value="${SinhVien.MSSV}"  name="mssv" id="mssv" placeholder="Nhập MSSV" readonly >
							    </c:if>
							    <c:if test="${SinhVien == null}">
							     	<input type="text" value="${SinhVien.MSSV}"  name="mssv" id="mssv" placeholder="Nhập MSSV" >
							    </c:if>
		                        <span id="mssvError" class="error-message"></span>
		            		</div>
		            		
		            		<div class="form-group">
		                        <h3>Khoa :</h3>
		                        <input type="hidden"  value="${empty SinhVien ? requestScope.makhoa : SinhVien.maKhoa}"  id="hiddenmakhoa" placeholder="Nhập mã khoa">
		                        <select name="makhoa" id="makhoa" >
		                        	<c:forEach var="khoa" items="${listKhoa}">
		                        		<option value="${khoa.maKhoa}">${khoa.tenKhoa}</option>			                        
			                        </c:forEach>      		                        
		                        </select>
		                     </div>   
		                     
		            		<div class="form-group">
		                        <h3>Ngày sinh :</h3>
		                        <input type="date" value="${empty SinhVien ? requestScope.ngaysinh : SinhVien.ngaySinh}" name="ngaysinh" id="ngaysinh" placeholder="Nhập ngày sinh">
		                        <span id="ngaysinhError" class="error-message"></span>
							</div>
							<div class="form-group">
		                        <h3>Quê quán:</h3>
		                        <input type="hidden" id="hiddenquequan" name="hiddenquequan" value="${SinhVien.queQuan}">
							    <select id="quequan" name="quequan">
							        <option value="An Giang">An Giang</option>
							        <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
							        <option value="Bắc Giang">Bắc Giang</option>
								    <option value="Bắc Kạn">Bắc Kạn</option>
								    <option value="Bạc Liêu">Bạc Liêu</option>
								    <option value="Bắc Ninh">Bắc Ninh</option>
								    <option value="Bến Tre">Bến Tre</option>
								    <option value="Bình Định">Bình Định</option>
								    <option value="Bình Dương">Bình Dương</option>
								    <option value="Bình Phước">Bình Phước</option>
								    <option value="Bình Thuận">Bình Thuận</option>
								    <option value="Cà Mau">Cà Mau</option>
								    <option value="Cần Thơ">Cần Thơ</option>
								    <option value="Cao Bằng">Cao Bằng</option>
								    <option value="Đà Nẵng">Đà Nẵng</option>
								    <option value="Đắk Lắk">Đắk Lắk</option>
								    <option value="Đắk Nông">Đắk Nông</option>
								    <option value="Điện Biên">Điện Biên</option>
								    <option value="Đồng Nai">Đồng Nai</option>
								    <option value="Đồng Tháp">Đồng Tháp</option>
								    <option value="Gia Lai">Gia Lai</option>
								    <option value="Hà Giang">Hà Giang</option>
								    <option value="Hà Nam">Hà Nam</option>
								    <option value="Hà Nội">Hà Nội</option>
								    <option value="Hà Tĩnh">Hà Tĩnh</option>
								    <option value="Hải Dương">Hải Dương</option>
								    <option value="Hải Phòng">Hải Phòng</option>
								    <option value="Hậu Giang">Hậu Giang</option>
								    <option value="Hòa Bình">Hòa Bình</option>
								    <option value="Hưng Yên">Hưng Yên</option>
								    <option value="Khánh Hòa">Khánh Hòa</option>
								    <option value="Kiên Giang">Kiên Giang</option>
								    <option value="Kon Tum">Kon Tum</option>
								    <option value="Lai Châu">Lai Châu</option>
								    <option value="Lâm Đồng">Lâm Đồng</option>
								    <option value="Lạng Sơn">Lạng Sơn</option>
								    <option value="Lào Cai">Lào Cai</option>
								    <option value="Long An">Long An</option>
								    <option value="Nam Định">Nam Định</option>
								    <option value="Nghệ An">Nghệ An</option>
								    <option value="Ninh Bình">Ninh Bình</option>
								    <option value="Ninh Thuận">Ninh Thuận</option>
								    <option value="Phú Thọ">Phú Thọ</option>
								    <option value="Phú Yên">Phú Yên</option>
								    <option value="Quảng Bình">Quảng Bình</option>
								    <option value="Quảng Nam">Quảng Nam</option>
								    <option value="Quảng Ngãi">Quảng Ngãi</option>
								    <option value="Quảng Ninh">Quảng Ninh</option>
								    <option value="Quảng Trị">Quảng Trị</option>
								    <option value="Sóc Trăng">Sóc Trăng</option>
								    <option value="Sơn La">Sơn La</option>
								    <option value="Tây Ninh">Tây Ninh</option>
								    <option value="Thái Bình">Thái Bình</option>
								    <option value="Thái Nguyên">Thái Nguyên</option>
								    <option value="Thanh Hóa">Thanh Hóa</option>
								    <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
								    <option value="Tiền Giang">Tiền Giang</option>
								    <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
								    <option value="Trà Vinh">Trà Vinh</option>
								    <option value="Tuyên Quang">Tuyên Quang</option>
								    <option value="Vĩnh Long">Vĩnh Long</option>
								    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
								    <option value="Yên Bái">Yên Bái</option>
							    </select>
							    <span id="quequanError" class="error-message">Vui lòng chọn ngày sinh</span>
		            		</div>
		            		<div class="form-group">
		                        <h3>Điện thoại :</h3>
		                        <input type="text" value="${empty SinhVien ? requestScope.sdt : SinhVien.soDienThoai}" name="sodienthoai" id="dienthoai" placeholder="Nhập điện thoại">
		                        <span id="dienthoaiError" class="error-message"></span>
		                    </div> 
	                    </div>
	                    
	                    <div class="column">
	                    	<div class="form-group">
		                        <h3>Họ tên :</h3>
		                        <input type="text"   value="${empty SinhVien ? requestScope.hoten : SinhVien.hoTen}" name="hoten" id="hoten" placeholder="Nhập họ tên">
		                        <span id="hotenError" class="error-message">Vui lòng chọn ngày sinh</span>
		           			 </div>
		            		<div class="form-group">		            		
		                        <h3>Khóa học :</h3>
		                        <input type="hidden"  value="${empty SinhVien ? requestScope.makh : SinhVien.maKH}"  id="hiddenmakhoahoc" placeholder="Nhập mã khóa học">	
		                        <select name="makh" id="makhoahoc">
		                        	<c:forEach var="KH" items="${listKH}">
		                        		<option value="${KH.getMaKH()}">${KH.getTenKH()}</option>			                                     
				                      </c:forEach>              
		                        </select>
		                    </div>
		                        
		                   <div class="form-group">
		                        <input type="hidden" id="hiddengioitinh"  name="hiddengioitinh" value="${SinhVien.gioiTinh}" value="<%=request.getAttribute("gioitinh")%>">            
		                        <h3>Giới tính :</h3>
								<select name="gioitinh" id="gioitinh">
								    <option value="Nam">Nam</option>
								    <option value="Nữ">Nữ</option>
								</select>
							</div>
							<div class="form-group">
							    <h3>Địa chỉ:</h3>
							    <input type="hidden" id="hiddendiachi" name="hiddendiachi" value="${SinhVien.diaChi}">
							    <select id="diachi" name="diachi">
							        <option value="An Giang">An Giang</option>
							        <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
							        <option value="Bắc Giang">Bắc Giang</option>
								    <option value="Bắc Kạn">Bắc Kạn</option>
								    <option value="Bạc Liêu">Bạc Liêu</option>
								    <option value="Bắc Ninh">Bắc Ninh</option>
								    <option value="Bến Tre">Bến Tre</option>
								    <option value="Bình Định">Bình Định</option>
								    <option value="Bình Dương">Bình Dương</option>
								    <option value="Bình Phước">Bình Phước</option>
								    <option value="Bình Thuận">Bình Thuận</option>
								    <option value="Cà Mau">Cà Mau</option>
								    <option value="Cần Thơ">Cần Thơ</option>
								    <option value="Cao Bằng">Cao Bằng</option>
								    <option value="Đà Nẵng">Đà Nẵng</option>
								    <option value="Đắk Lắk">Đắk Lắk</option>
								    <option value="Đắk Nông">Đắk Nông</option>
								    <option value="Điện Biên">Điện Biên</option>
								    <option value="Đồng Nai">Đồng Nai</option>
								    <option value="Đồng Tháp">Đồng Tháp</option>
								    <option value="Gia Lai">Gia Lai</option>
								    <option value="Hà Giang">Hà Giang</option>
								    <option value="Hà Nam">Hà Nam</option>
								    <option value="Hà Nội">Hà Nội</option>
								    <option value="Hà Tĩnh">Hà Tĩnh</option>
								    <option value="Hải Dương">Hải Dương</option>
								    <option value="Hải Phòng">Hải Phòng</option>
								    <option value="Hậu Giang">Hậu Giang</option>
								    <option value="Hòa Bình">Hòa Bình</option>
								    <option value="Hưng Yên">Hưng Yên</option>
								    <option value="Khánh Hòa">Khánh Hòa</option>
								    <option value="Kiên Giang">Kiên Giang</option>
								    <option value="Kon Tum">Kon Tum</option>
								    <option value="Lai Châu">Lai Châu</option>
								    <option value="Lâm Đồng">Lâm Đồng</option>
								    <option value="Lạng Sơn">Lạng Sơn</option>
								    <option value="Lào Cai">Lào Cai</option>
								    <option value="Long An">Long An</option>
								    <option value="Nam Định">Nam Định</option>
								    <option value="Nghệ An">Nghệ An</option>
								    <option value="Ninh Bình">Ninh Bình</option>
								    <option value="Ninh Thuận">Ninh Thuận</option>
								    <option value="Phú Thọ">Phú Thọ</option>
								    <option value="Phú Yên">Phú Yên</option>
								    <option value="Quảng Bình">Quảng Bình</option>
								    <option value="Quảng Nam">Quảng Nam</option>
								    <option value="Quảng Ngãi">Quảng Ngãi</option>
								    <option value="Quảng Ninh">Quảng Ninh</option>
								    <option value="Quảng Trị">Quảng Trị</option>
								    <option value="Sóc Trăng">Sóc Trăng</option>
								    <option value="Sơn La">Sơn La</option>
								    <option value="Tây Ninh">Tây Ninh</option>
								    <option value="Thái Bình">Thái Bình</option>
								    <option value="Thái Nguyên">Thái Nguyên</option>
								    <option value="Thanh Hóa">Thanh Hóa</option>
								    <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
								    <option value="Tiền Giang">Tiền Giang</option>
								    <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
								    <option value="Trà Vinh">Trà Vinh</option>
								    <option value="Tuyên Quang">Tuyên Quang</option>
								    <option value="Vĩnh Long">Vĩnh Long</option>
								    <option value="Vĩnh Phúc">Vĩnh Phúc</option>
								    <option value="Yên Bái">Yên Bái</option>
							    </select>
							    <span id="diachiError" class="error-message">Vui lòng chọn ngày sinh</span>
							</div>
							<div class="form-group">
		                       <input type="hidden" id="hiddentrangthai" name="hiddentrangthai"  value="${SinhVien.trangThai}"  value="<%=request.getAttribute("trangthai")%>">          
		                        <h3>Trạng thái </h3>
								<select name="trangthai" id="trangthai">
								    <option value="Đang học">Đang học</option>
								    <option value="Đã tốt nghiệp">Đã tốt nghiệp</option>
								</select>
							</div>
							<div class="form-group">
		                        <h3>Email :</h3>
		                        <input type="text"  value="${empty SinhVien ? requestScope.email : SinhVien.email}" value="${SinhVien.email}"  name="email" id="email" placeholder="Nhập email">
		                        <span id="emailError" class="error-message">Vui lòng chọn ngày sinh</span>
	                        </div>
	                    </div>
	                </div>       
	                     
	            </div>
	            <div style="display: flex; justify-content: center;">
	                <button type="submit" style=" width: 100px;margin-left: 5px; font-size: 20px; height: 40px;" >Lưu</button>
	        
	            </div>
        	</form>
			<button type="button" onclick="location.href='<%= request.getContextPath() %>/Qtv/listSV'" style="margin-top: 40px;margin-bottom: 40px; background-color: rgb(159, 108, 108);margin-left: 5px; font-size: 20px; height: 40px;">Quay lại </button>
         	
        </div>
    </div>
    <style>
        .form-row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px; /* Khoảng cách giữa các cột */
        }

        /* CSS cho cột */
        .column {
            flex: 1; /* Cột sẽ căng ra để lấp đầy không gian */
            width: calc(50% - 10px); /* Chiều rộng cột */
            padding: 5px;
        }

        /* CSS cho h3 */
        h3 {
            margin-bottom: 5px;
        }

        /* CSS cho input và select */
        input,
        select {
            width: calc(100% - 10px); /* Điều chỉnh chiều rộng */
            padding: 5px;
            font-size: 20px;
        }
        
        .error-message {
            color: red;
            font-size: 12px;
            display: none;
        }
    </style>
</body>

</html>

<script>
/* 	if(${SinhVien} != null)
	{
		var gioiTinhSelect = document.getElementById('gioitinh');
		gioiTinhSelect.value = ${SinhVien.gioiTinh};
	} */
     document.addEventListener('DOMContentLoaded', function () {
        document.querySelector('form').addEventListener('submit', function (event) {
        	var MSSV = document.getElementById('mssv').value;
            var hoTen = document.getElementById('hoten').value;
            var diaChi = document.getElementById('diachi').value;
            var quequan = document.getElementById('quequan').value;
            var email = document.getElementById('email').value;
            var soDienThoai = document.getElementById('dienthoai').value;
            var ngaysinh = document.getElementById('ngaysinh').value;

            var phonePattern = /^\d{10}$/;
            var emailPattern = /^\S+@\S+\.\S+$/;
			
            var mssvError = document.getElementById('mssvError');
            var hoTenError = document.getElementById('hotenError');
            var diaChiError = document.getElementById('diachiError');
            var ququanError = document.getElementById('quequanError');
            var emailError = document.getElementById('emailError');
            var soDienThoaiError = document.getElementById('dienthoaiError');
            var ngaysinhError = document.getElementById('ngaysinhError');


            
            if (MSSV === '') {
                mssvError.innerText = 'Vui lòng nhập mssv';
                mssvError.style.display = 'block';
                event.preventDefault();
            } else {
                mssvError.style.display = 'none';
            }
            
            // Kiểm tra Họ tên
            if (hoTen === '') {
                hoTenError.innerText = 'Vui lòng nhập họ tên';
                hoTenError.style.display = 'block';
                event.preventDefault();
            } else {
                hoTenError.style.display = 'none';
            }

            // Kiểm tra Địa chỉ
            if (diaChi === '') {
                diaChiError.innerText = 'Vui lòng nhập địa chỉ';
                diaChiError.style.display = 'block';
                event.preventDefault();
            } else {
                diaChiError.style.display = 'none';
            }
            
         // Kiểm tra Địa chỉ
            if (quequan === '') {
            	quequanError.innerText = 'Vui lòng nhập quê quán';
            	quequanError.style.display = 'block';
                event.preventDefault();
            } else {
            	quequanError.style.display = 'none';
            }            
            
            if (ngaysinh === '') {
                ngaysinhError.innerText = 'Vui lòng nhập ngày sinh';
                ngaysinhError.style.display = 'block';
                event.preventDefault();
            } else {
                ngaysinhError.style.display = 'none';
            }


            // Kiểm tra Email
            if (!emailPattern.test(email) ) {
                emailError.innerText = 'Vui lòng nhập email đúng định dạng';
                emailError.style.display = 'block';
                event.preventDefault();        
            }           
            else {
                emailError.style.display = 'none';
            }

            // Kiểm tra Số điện thoại
            if (!phonePattern.test(soDienThoai)) {
                soDienThoaiError.innerText = 'Số điện thoại phải có đúng 10 số';
                soDienThoaiError.style.display = 'block';
                event.preventDefault();
           
            } 
            else {
                soDienThoaiError.style.display = 'none';
            }
        });
    }); 
     
	document.addEventListener('DOMContentLoaded', function() {
	    var hiddenInput = document.getElementById('hiddengioitinh');
	    var gioiTinhSelect = document.getElementById('gioitinh');

	    if (hiddenInput.value !== '') {
	        gioiTinhSelect.value = hiddenInput.value;
	    }
	    
	    var trangthai = document.getElementById('hiddentrangthai');
	    var trangthaiSelect = document.getElementById('trangthai');

	    if (trangthai.value !== '') {
	    	trangthaiSelect.value = trangthai.value;
	    }
		    
		 var makhoa = document.getElementById('hiddenmakhoa');
	    var makhoaSelect = document.getElementById('makhoa');

	    if (makhoa.value !== '') {
	    	makhoaSelect.value = makhoa.value;
	    }
	    
	    var makhoahoc = document.getElementById('hiddenmakhoahoc');
	    var makhoahocSelect = document.getElementById('makhoahoc');

	    if (makhoahoc.value !== '') {
	    	makhoahocSelect.value = makhoahoc.value;
	    }
	    
	    var diachi = document.getElementById('hiddendiachi');
	    var diachiSelect = document.getElementById('diachi');

	    if (diachi.value !== '') {
	        diachiSelect.value = diachi.value;
	    }
	    
	    var quequan = document.getElementById('hiddenquequan');
	    var quequanSelect = document.getElementById('quequan');

	    if (quequan.value !== '') {
	        quequanSelect.value = quequan.value;
	    }
	});
	
	var errMsg = '<%=request.getAttribute("errMsg")%>'
	     if(errMsg !== 'null')
	    	 {
	    	 	alert(errMsg);
	    	 }
</script>


