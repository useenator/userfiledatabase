package fr.epf.userdatabase.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private Environment env;

    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login.do").usernameParameter("j_username")
                .passwordParameter("j_password")
                .defaultSuccessUrl("/index.do").failureUrl("/login.do")
                .and().logout().logoutUrl("/logout")
                .deleteCookies("JSESSIONID").permitAll().and().csrf().disable()
                .authorizeRequests().antMatchers("/login.do").permitAll()
                .antMatchers("/index.do").denyAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .anyRequest().authenticated();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
                .dataSource(dataSource)
                .usersByUsernameQuery(
                        "Select email, password, true as enabled from Utilisateur where email=?")
                .authoritiesByUsernameQuery(
                        "Select u.email, r.description From Role r join Utilisateur u on u.role_id=r.id where u.email=?");

    }
}