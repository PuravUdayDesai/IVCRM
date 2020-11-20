package ivgroup.master.database.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/error")
public class ErrorController 
{
		@RequestMapping("/403")
		public String accessDenied()
		{
			return "Hello!!";
		}
}
