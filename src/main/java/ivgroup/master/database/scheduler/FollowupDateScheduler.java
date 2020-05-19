package ivgroup.master.database.scheduler;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import ivgroup.master.database.dao.impl.EmailLogDAOImpl;
import ivgroup.master.database.dao.impl.TicketDAOImpl;
import ivgroup.master.database.dto.logs.EmailLogInsert;

@Configuration
@EnableScheduling
public class FollowupDateScheduler 
{
	@Autowired
	TicketDAOImpl tdl;
	
	@Autowired
	EmailLogDAOImpl eldi;
	
	Thread t=null;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void schedulerForFollowupDate()
	{
		t=new Thread()
		{
			
			
			public void run()
			{
				List<Long> companyExecutiveList=new ArrayList<Long>();
				try {
					companyExecutiveList=tdl.selectCurrentFollowupDateExecutiveList(new Date(System.currentTimeMillis()));
					ListIterator<Long> li=companyExecutiveList.listIterator();
					while(li.hasNext())
					{
						Boolean rsMain=eldi.addEmailLog(new EmailLogInsert(
								li.next(),
								"IVCRM: Followup Date Reminder",
								"Body",
								"text/html",
								"TO",
								(long)1));
					}
					
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			
		};
		t.start(); 
	}
	
}
