package Controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.*;
import Models.SinhVien;
import Models.TaiKhoan;
import Util.CSRFTokenUtil;
import SameSiteCookie.SamesiteHttpServletResponse;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDAO loginDAO;
	private TruyCapDAO  truycapDAO;
	private ThongBaoDAO thongbaoDAO;
	private SinhVienDAO svDao;

	public LoginController() {
		super();

	}

	public void init(ServletConfig config) throws ServletException {
		loginDAO = new LoginDAO();
		truycapDAO = new TruyCapDAO();
		thongbaoDAO = new ThongBaoDAO();
		svDao = new SinhVienDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SamesiteHttpServletResponse wrappedResponse = new SamesiteHttpServletResponse(response);
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				 wrappedResponse.addCookie(cookie);
			}
		}
		String action = request.getParameter("action");
		if(action!=null)
			{
			request.setCharacterEncoding("UTF-8");
		        try {
		            switch (action) {
		                case "/in":
		                	login(request, response);
		                    break;  
		                case "/createCSRF":
		                	getCSRFtoken(request, response);
		    				break;
		    			
		            }
		        } catch (SQLException ex) {
		            throw new ServletException(ex);
		        } catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		else
		{
			response.sendRedirect(request.getContextPath() + "/pages/errorPage.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	private void getCSRFtoken(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String csrfToken = (String) session.getAttribute("csrf_token");
        if (csrfToken == null) {
            csrfToken = CSRFTokenUtil.generateCSRFToken(request);
            session.setAttribute("csrf_token", csrfToken);
        }

        request.setAttribute("csrf_token", csrfToken);
    }
	private void login(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, ServletException, IOException, ParseException {
		String username =request.getParameter("username");
		String password =request.getParameter("password");
		String roleSelect=request.getParameter("role");
		TaiKhoan account = new TaiKhoan();
		account.setMatkhau(password);
		account.setTenTk(username);
		
		try {
			TaiKhoan acc =new TaiKhoan();
			acc =loginDAO.onLogin(account);
			 if (acc != null) {
	            	String role = acc.getPhanQuyen();
	            	String trangthai = acc.getTrangThai();
	            	if(role.equals(roleSelect) && trangthai.equals("enable")  )
	            	{
	            		truycapDAO.insertTruyCap(acc.getIdTk());
	            		HttpSession session = request.getSession();
	                    session.setAttribute("Acc", acc); 
	                    if (roleSelect.equals("qtv")) {
	                        response.sendRedirect(request.getContextPath()+"/Qtv/listSV");
	                    } else if (roleSelect.equals("ctsv")) {
	                        response.sendRedirect(request.getContextPath()+"/Ctsv/listTB");
	                    } else if (roleSelect.equals("sv")) {
	                        response.sendRedirect(request.getContextPath()+"/SV/thongbao");
	                        SinhVien sv = svDao.selectTT_SV(acc.getTenTk());
	        				String TenND = sv.getHoTen();
	        				String TTND = sv.getTrangThai();
	        				String loichao = TenND + " (" + TTND + ")";
	        				session.setAttribute("loichao", loichao);
	                        // Phần code khác nếu có
	                    }                   
	            	}
	            	else 
	            	{            		
	            		request.setAttribute("errMsg", "Bạn không có quyền truy cập/ Tài khoản của bạn bị mất quyền truy cập");
	                    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/login.jsp");
		            	dispatcher.forward(request, response);
	            	}
	            	
	            } else {
	                //HttpSession session = request.getSession();
	                //session.setAttribute("user", username);
	                //response.sendRedirect("login.jsp");
	            	request.setAttribute("errMsg", "Thông tin đăng nhập không hợp lệ");
	            	RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/login.jsp");
	            	dispatcher.forward(request, response);
	            	
	            }
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
