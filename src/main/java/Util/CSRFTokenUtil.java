package Util;

import java.security.SecureRandom;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CSRFTokenUtil {
	
	public static String generateCSRFToken(HttpServletRequest request)
	{
		HttpSession session =request.getSession(true);
		byte[] tokenBytes=new byte[32];
		new SecureRandom().nextBytes(tokenBytes);
		String token=Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes);
		session.setAttribute("csrf_token", token);
		return token;
	}
	public static boolean validateCSRFToken(HttpServletRequest request)
	{
		HttpSession session =request.getSession(false);
		if(session!=null)
		{
			String csrfToken=request.getParameter("csrf_token");
			if(csrfToken!=null&&csrfToken.equals(session.getAttribute("csrf_token")))
			{
				return true;
			}
		}
		return false;
	}
}
