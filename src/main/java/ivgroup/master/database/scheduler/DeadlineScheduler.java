package ivgroup.master.database.scheduler;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import ivgroup.master.database.bl.NotificationBusinessLogic;
import ivgroup.master.database.dao.impl.TicketDAOImpl;
import ivgroup.master.database.dto.notification.NotificationInsert;
import ivgroup.master.database.dto.scheduler.SchedulerNotificationInsert;

@Configuration
@EnableScheduling
public class DeadlineScheduler
{
	@Autowired
	TicketDAOImpl tdl;
	
	@Autowired
	NotificationBusinessLogic nbl;
	
	Thread t=null;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void schedulerForDeadlineDate()
	{
		t=new Thread()
		{
			
			public void run()
			{
				List<SchedulerNotificationInsert> companyExecutiveList=new ArrayList<SchedulerNotificationInsert>();
				try {
					companyExecutiveList=tdl.selectCurrentDeadlineDateExecutiveList(new Date(System.currentTimeMillis()));
					ListIterator<SchedulerNotificationInsert> li=companyExecutiveList.listIterator();
					while(li.hasNext())
					{
						SchedulerNotificationInsert record=li.next();
						nbl.addNotification(new NotificationInsert(
								record.getCompanyExecutiveId(),
								record.getCompanyExecutiveName(),
								"Deadline Date Arrival",
								"Hey "+record.getCompanyExecutiveName()+", your Deadline Date For Client "+record.getClientName()+" About Product "+record.getProductName()+" is today, please complete you're leftover work if pending, as you're PLRate will be updated accordingly, if you need more time for this Ticket then please update the Deadline Date associated with this Ticket.",
								new Timestamp(System.currentTimeMillis())));
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
