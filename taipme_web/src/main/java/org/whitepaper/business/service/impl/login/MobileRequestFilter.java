package org.whitepaper.business.service.impl.login;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MobileRequestFilter implements Filter {

    private static final Logger logger = LoggerFactory.getLogger(MobileRequestFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("MobileRequestFilter initialized");
        logger.info("MobileRequestFilter initialized: {}", this);
    }
	
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        long startTime = System.currentTimeMillis();
        logger.debug("Processing request...");
		
        chain.doFilter(request, response);
		
        long duration = System.currentTimeMillis() - startTime;
        logger.debug("Request processed in {} ms", duration);
    }
	
    @Override
    public void destroy() {
        logger.info("MobileRequestFilter destroyed");
    }
}
