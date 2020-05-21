package ivgroup.master.database.scheduler;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling
public class DeadlineCrossoverScheduler 
{
Thread t=null;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void schedulerForFollowupDate()
	{
		t=new Thread()
		{
			
			public void run()
			{
				
				
			}
			
		};
		t.start(); 
	}
	
}
