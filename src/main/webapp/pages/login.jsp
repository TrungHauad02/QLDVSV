 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ page import="Models.TaiKhoan"%>
 <%@ page import="SameSiteCookie.SamesiteHttpServletResponse"%>
 
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đăng nhập</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <style>

        body {
        font-family: sans-serif;
        background-color: white;
        }

        .container {
        width: 500px;
        margin: 30px auto;
        font-size: 20px;
        padding: 30px 30px 30px 30px ;
		border-radius: 10px;
        border: 2px double rgb(4, 4, 4);
        }

        h1 {
        text-align: center;
        }

        .role-selection {
        display: flex;
        justify-content: space-between;
        margin-bottom: 0px;
        }

        .role-selection input {
        margin-right: 6px;
        }

        .username-input, .password-input {
        margin-bottom: 10px;
        }

        .username-input input, .password-input input {
        width: 95%;
        padding: 5px;
        border: 2px double gray;
        }

        .button-group {
        display: flex;
        justify-content: flex-end;
        }

        .button-group a {
        text-decoration: none;
        color: gray;
        }

        .button-group button {
        background-color: #269ABC;
        color: white;
        font-weight: bold;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        }    

        .button-group {
            display: flex;
            justify-content: space-between; /* Căn khoảng cách giữa các phần tử */
            align-items:first baseline; /* Căn các phần tử theo chiều dọc */
        }

        .forgot-password {

            margin-right: auto; /* Di chuyển liên kết sang bên trái */
        }
  </style>
</head>
<body>
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
        <img border="0" src="${pageContext.request.contextPath}/img/SPKT.jpg">
    </div>
	<div class="button-container" style ="margin-top :0;">
	    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #00558c">
	        <ul class="navbar-nav navbar-collapse justify-content-end">
	            <li><a href="<%= request.getContextPath() %>/pages_Main/MainPage.jsp" class="nav-link">Trang chủ</a></li>          
	        </ul>
	    </nav>
	</div>
	
    <form action="<%=request.getContextPath()%>/login" method="post"  style="">
    <input type= "hidden" name="action" value = "/in" />
        <div class="container">       
            <h1>Đăng nhập</h1>
            <hr style="margin: 3px">
            <div class="role-selection">
            	<div>
		            <input type="radio" id="sv" name="role" value="sv" checked>
		            <label for="sv">Sinh viên</label>
		        </div>
		        <div>
		            <input type="radio" id="ctsv" name="role" value="ctsv">
		            <label for="ctsv">Cộng tác sinh viên</label>
		        </div>
		        <div>
		            <input type="radio" id="qtv" name="role" value="qtv">
		            <label for="qtv">Quản trị viên</label>
		        </div>
            </div>
            <div class="form-login">
	            <div class="username-input">
	                <label for="username">Tên đăng nhập</label>
	                <input type="text" name="username" id="username" placeholder="Tên đăng nhập" style="margin-top: 10px">              
	            </div>
	           
	            <div class="password-input">
	                <label for="password">Mật khẩu</label>
	                <input type="password" name="password" id="password" placeholder="Mật khẩu"  style="margin-top: 10px">
	            </div>
	         </div>
             <div>
            
            	 <%
                    String errMsg = (String) request.getAttribute("errMsg");
                    TaiKhoan account =(TaiKhoan) session.getAttribute("acc");
                %>
                <%
                    if (errMsg!=null){
                %>   
                <p style="color :red;  font-style: italic;"> <%=errMsg%> </p>       
                <%
                } 
                %>
            </div>
            
            <div class="button-group">
                <div></div>
                <a href="<%= request.getContextPath() %>/pages_Main/QuenMK.jsp" class="forgot-password">Quên mật khẩu</a>
                <button type="submit"  style="font-size: 20px;">Đăng nhập</button>
            </div>    
        </div>
    </form>
</body>
</html>