package ivgroup.master.database.config;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfiguration 
{
	
	@Bean("SwaggerConfigurationDocket")
	public Docket swaggerConfiguration()
	{
		return new Docket(DocumentationType.SWAGGER_2)
				.apiInfo(apiDetails())
				.protocols(new HashSet<>(Arrays.asList("HTTP")))
				.select()
				.apis(RequestHandlerSelectors.basePackage("ivgroup.master.database"))
				.build();
	}
	
	private ApiInfo apiDetails() 
	{
		return new ApiInfo(
				"CRM API Documentation",
				"API Documentation for CRM Project",
				"Final Version",
				"",
				new Contact("","",""),
				"",
				"",
				Collections.emptyList()
				);
	}

}
