package CSPFilters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(filterName = "ContentSecurityPolicy", urlPatterns = {"/*"})
public class ContentSecurityPolicyFilter implements Filter {

    public void init(FilterConfig filterConfig) {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.setHeader("Content-Security-Policy", 
        		"default-src 'self'; "
        		+ "script-src 'self' https://ajax.googleapis.com; "
        		+ "style-src 'self' https://stackpath.bootstrapcdn.com 'unsafe-inline'; "
        		+ "frame-ancestors 'self'; "
        		+ "img-src 'self'; "
        		+ "media-src 'self'; "
        		+ "object-src 'self'; " 
        		+ "manifest-src 'self';"
        		+ "frame-src 'self'; connect-src 'self'; "
        		+ "form-action 'self';");
        chain.doFilter(request, response);
    }

    public void destroy() {
    }
}

