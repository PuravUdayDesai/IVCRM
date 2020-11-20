package ivgroup.master.database.scheduler;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class DeadlineCrossoverScheduler 
{
	@Autowired
	TicketDAOImpl tdl;
	
	@Autowired
	NotificationBusinessLogic nbl;
	
	Thread t=null;
	
	Logger logger =LoggerFactory.getLogger(DeadlineCrossoverScheduler.class);
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void schedulerForDeadlineCrossoverDate()
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
						nbl.addNotification(new NotificationInsert(
								record.getCompanyExecutiveId(),
								record.getCompanyExecutiveName(),
								"🛑 Deadline Date Has Been Crossed",
								"Oops, "+record.getCompanyExecutiveName()+", your Deadline Date For Client "+record.getClientName()+" About Product "+record.getProductName()+" has been crossed, you're PLRate has been updated accordingly.",
								new Timestamp(System.currentTimeMillis())));
					}
					
				} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				}
			}
			
		};
		t.start(); 
	}
	
}
