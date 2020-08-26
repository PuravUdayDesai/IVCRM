package ivgroup.master.database.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import ivgroup.master.database.service.IVUserDetailsService;
import ivgroup.master.database.util.JwtUtil;

@Component
public class JwtRequestFilters extends OncePerRequestFilter
{
    @Autowired
    private IVUserDetailsService ivUserDetailsService;

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest,
                                    HttpServletResponse httpServletResponse,
                                    FilterChain filterChain) throws ServletException, IOException
    {
        final String autherizationHeader= httpServletRequest.getHeader("Authorization");
        String userName=null;
        String jwt=null;
        if(autherizationHeader!=null && autherizationHeader.startsWith( "IVClient " ))
        {
            jwt=autherizationHeader.substring( 9 );
            userName=jwtUtil.extractUsername( jwt );
        }

        if(userName!=null && SecurityContextHolder.getContext().getAuthentication()==null)
        {
            UserDetails userDetails=this.ivUserDetailsService.loadUserByUsername( userName );
            if(jwtUtil.validateToken( jwt,userDetails ))
            {
                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken=new UsernamePasswordAuthenticationToken(
                        userDetails,
                        null,
                        userDetails.getAuthorities()
                );

                usernamePasswordAuthenticationToken.setDetails(
                        new WebAuthenticationDetailsSource().buildDetails( httpServletRequest ));
                        SecurityContextHolder.getContext().setAuthentication(  usernamePasswordAuthenticationToken);

            }
        }
        filterChain.doFilter(httpServletRequest,httpServletResponse);
    }
}
