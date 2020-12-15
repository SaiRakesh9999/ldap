package in.iaf.cdma.inventroy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories(basePackages = "in.iaf.cdma.inventroy.repository")
@ComponentScan(basePackages = "in.iaf.cdma.inventroy")
public class InventroyApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(InventroyApplication.class, args);
	}

}
