package ru.coach.web.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;

//@EnableGlobalMethodSecurity(prePostEnabled = true)
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("customUserDetailsService")
    private UserDetailsService userDetailsService;

    @Autowired
    @Qualifier("bcPasswordEncoder")
    private PasswordEncoder passwordEncoder;

    @Autowired
    @Qualifier(value = "dataSource")
    private DataSource dataSource;

    /*
     * Обслуживание статических веб-ресурсов в приложении безопасности Spring Boot & Spring
     * https://coderoad.ru/24916894/%D0%9E%D0%B1%D1%81%D0%BB%D1%83%D0%B6%D0%B8%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5-%D1%81%D1%82%D0%B0%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D1%85-%D0%B2%D0%B5%D0%B1-%D1%80%D0%B5%D1%81%D1%83%D1%80%D1%81%D0%BE%D0%B2-%D0%B2-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B8-%D0%B1%D0%B5%D0%B7%D0%BE%D0%BF%D0%B0%D1%81%D0%BD%D0%BE%D1%81%D1%82%D0%B8-Spring-Boot
     * <p>
     * org.springframework.boot.autoconfigure.security.servlet.PathRequest
     * https://www.programcreek.com/java-api-examples/?api=org.springframework.boot.autoconfigure.security.servlet.PathRequest
     */

    @Autowired
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable();  ..по умолчанию включен
        http.authorizeRequests()

//                .requestMatchers(PathRequest.toStaticResources().atCommonLocations())
//                .permitAll()

//                .antMatchers("/mediasave.ru/**").permitAll()

                .antMatchers("/signUp").permitAll()// доступно всем
                .antMatchers("/profile/**").authenticated()// тем, кто прошел форму логина (аутентифицирован)

                .antMatchers("/themes/users/add").authenticated()
//                .antMatchers("/webjars/**").permitAll()

                .and()
                .formLogin()
                .loginPage("/signIn")
                .usernameParameter("email")
                .defaultSuccessUrl("/profile")
                .failureUrl("/signIn?error")

                .and()
//                .rememberMe().alwaysRemember(true)
                .rememberMe().rememberMeParameter("remember-me")
                .tokenRepository(persistentTokenRepository())
                .tokenValiditySeconds(365 * 24 * 60 * 60)

                .and()
                .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/signIn")

                .deleteCookies("remember-me", "JSESSIONID")
                .invalidateHttpSession(true)
        ;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
        jdbcTokenRepository.setDataSource(dataSource);
        return jdbcTokenRepository;
    }
}
