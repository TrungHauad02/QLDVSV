package HeaderFilters;

import java.io.IOException;

import javax.servlet.Filter;//...
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class HeaderFilter implements Filter {//...
	
//	 private String allowFromUri;
	
	@Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
//		  allowFromUri = "https://example.com";  URI cụ thể mà bạn muốn cho phép nhúng vào iframe
    }

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException
	{
	    HttpServletResponse httpServletResponse = ((HttpServletResponse) response);
	    
//	    Missing Anti-clickjacking Header 
//	    Ngăn không cho trang web được nhúng vào bất kỳ iframe nào.
	    httpServletResponse.addHeader("X-Frame-Options", "DENY");
	    
//	    SAMEORIGIN: Chỉ cho phép trang web được nhúng vào các iframe cùng nguồn gốc.
//	    httpServletResponse.addHeader("X-Frame-Options", "SAMEORIGIN");
	    
//	    Chỉ cho phép trang web được nhúng từ những URI được chỉ định.
//        httpServletResponse.addHeader("X-Frame-Options", "ALLOW-FROM " + allowFromUri);
	    
	    
//	    X-Content-Type-Options Header Missing
	    httpServletResponse.addHeader("X-Content-Type-Options", "nosniff");

	    chain.doFilter(request, response);
	}

    @Override
    public void destroy()
    {

    }
}