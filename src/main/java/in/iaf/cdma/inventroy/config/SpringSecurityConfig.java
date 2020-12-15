package in.iaf.cdma.inventroy.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		 auth.jdbcAuthentication().dataSource(dataSource)
		 .usersByUsernameQuery("select user_name, password, is_active from user_data where user_name=?")
		 .authoritiesByUsernameQuery("select u.user_name, r.role_name from role_master r, user_data u where r.role_id=u.role_id and u.user_name=?")
		 .passwordEncoder(new BCryptPasswordEncoder());
		 
		
	}
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers("/admin/**").authenticated().and()
		.formLogin().loginPage("/login").failureUrl("/login?error").defaultSuccessUrl("/admin", true)
		.usernameParameter("username").passwordParameter("password")
		.and()
		.logout().logoutUrl("/login?logout")
		.and()
		.exceptionHandling().accessDeniedPage("/403")
		.and().csrf().disable();
    }

}
