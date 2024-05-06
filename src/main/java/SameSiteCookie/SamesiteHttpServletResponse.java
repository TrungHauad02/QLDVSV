package SameSiteCookie;

import java.net.http.HttpHeaders;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class SamesiteHttpServletResponse extends HttpServletResponseWrapper
{
	  public SamesiteHttpServletResponse(HttpServletResponse response)
	  {
	    super(response);
	  }
	
	  @Override
	  public void addCookie(Cookie cookie)
	  { 
		  String headerValue = String.format("%s=%s; Path=%s; Secure; HttpOnly; SameSite=Strict;",
	              cookie.getName(), cookie.getValue(), cookie.getPath());
		  cookie.setSecure(true);
		  cookie.setHttpOnly(true);
		  System.out.println(headerValue);
	      addHeader("Set-Cookie", headerValue);
	  }
  }