package com.sunshine.project_web.config;

import com.sunshine.project_web.service.UserDetailServiceImp;
import com.sunshine.project_web.ultils.MySimpleUrlAuthenticationSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(
    prePostEnabled = true,
    securedEnabled =true,
    jsr250Enabled = true
)
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailServiceImp();
    };

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder;
    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new MySimpleUrlAuthenticationSuccessHandler();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/BackEnd/**", "/FrontEnd/Cart/List/**", "/FrontEnd/Product/**").authenticated()
                .anyRequest().permitAll();
        http
                .formLogin()
                .loginPage("/_admin/login")
                .loginProcessingUrl("/_admin/doLogin")
                .usernameParameter("userName")
                .passwordParameter("passwd")
//                .defaultSuccessUrl("/BackEnd/Product/List")
                .failureUrl("/_admin/login?Loging=Erro")
                .successHandler(myAuthenticationSuccessHandler());
        http.csrf().disable();
    }

    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/Product/T3H/**").antMatchers("User/T3H/**").antMatchers("/Category/T3H/**")
                .antMatchers("/backend/css/**").antMatchers("/backend/js/**").antMatchers("/backend/vendors/**")
                .antMatchers("/frontend/css/**").antMatchers("/frontend/js/**").antMatchers("/frontend/img/**")
                .antMatchers("/BackEnd/Common/**");
    }

}
