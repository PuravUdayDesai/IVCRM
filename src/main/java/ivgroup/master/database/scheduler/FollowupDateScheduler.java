package ivgroup.master.database.scheduler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
public class FollowupDateScheduler 
{
	Thread t=null;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void schedulerForFollowupDate()
	{
		t=new Thread()
		{
			
			
			public void run()
			{
				//Get The Email Id's of the CompanyExecutives
				//Add the Log to Email Log
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				System.out.println("Here the Scheduler has Scheduled at: "+dtf.format(now));
			}
			
		};
		t.start();
	}
	
}
