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

import ivgroup.master.database.dao.impl.TicketDAOImpl;
import ivgroup.master.database.dto.scheduler.SchedulerNotificationInsert;

@Configuration
@EnableScheduling
public class DeadlineCrossoverScheduler 
{
	@Autowired
	TicketDAOImpl tdl;
	
	Thread t=null;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void schedulerForFollowupDate()
	{
		t=new Thread()
		{
			
			public void run()
			{
				List<SchedulerNotificationInsert> companyExecutiveList=new ArrayList<SchedulerNotificationInsert>();
				try {
					companyExecutiveList=tdl.selectDeadlineDateCrossoverExecutiveList(new Date(System.currentTimeMillis()));
					ListIterator<SchedulerNotificationInsert> li=companyExecutiveList.listIterator();
					while(li.hasNext())
					{
						SchedulerNotificationInsert record=li.next();
						//TODO add Notification API add call
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
