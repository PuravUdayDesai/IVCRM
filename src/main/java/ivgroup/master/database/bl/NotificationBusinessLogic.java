package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.ListIterator;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.NotificationDao;
import ivgroup.master.database.dto.notification.NotificationInsert;
import ivgroup.master.database.dto.notification.NotificationSelect;
import ivgroup.master.database.dto.notification.NotificationUpdate;

@Component
public class NotificationBusinessLogic {
	
	@Autowired
	NotificationDao notification_dao;
	
	private final static String month[] = {
									"January", 
									"February", 
									"March", 
									"April", 
									"May", 
									"June", 
									"July", 
									"August", 
									"September", 
									"October", 
									"November",
            						"December" 
								  }; 
	
	public ResponseEntity<List<NotificationSelect>> selectNotifications(Long companyExecutiveID)
	{
		List<NotificationSelect> res = new ArrayList<NotificationSelect>();
		ListIterator<NotificationSelect> li=notification_dao.selectNotifications(companyExecutiveID).listIterator();
		
		while(li.hasNext())
		{
			NotificationSelect ns=li.next();
			Timestamp t=ns.getNotificationTime();
			DateTime dt = new DateTime(t.getTime());
			SimpleDateFormat formatDate=new SimpleDateFormat("EEEE");
			Calendar gCal=new GregorianCalendar(dt.getYear(),dt.getMonthOfYear(),dt.getDayOfMonth(),dt.getHourOfDay(),dt.getMinuteOfHour(),dt.getSecondOfMinute());
			String notificationTimeString=formatDate.format(t.getTime())+" "+dt.getDayOfMonth()+" "+month[gCal.get(Calendar.MONTH)-1]+" "+dt.getYear()+" "+dt.getHourOfDay()+":"+dt.getMinuteOfHour()+":"+dt.getSecondOfMinute();
			ns.setNotificationTimeString(notificationTimeString);
			res.add(ns);
		}
		
		return new ResponseEntity<>(res, HttpStatus.OK);
	}
	
	public ResponseEntity<Void> addNotification(NotificationInsert n_ins){
		Boolean res = notification_dao.addNotification(n_ins);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.CREATED);
	}
	
	private ResponseEntity<Void> updateNotificationReadIndex(Connection c, Long notificationID, Boolean readIndex) {
		Boolean rs = false;
		try {
			rs = notification_dao.updateReadIndex(c, notificationID, readIndex);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private ResponseEntity<Void> updateNotificationJustArrived(Connection c, Long notificationID, Boolean justArrived) {
		Boolean rs = false;
		try {
			rs = notification_dao.updateJustArrived(c, notificationID, justArrived);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	

	public ResponseEntity<Void> updateNotification(Long notificationID, NotificationUpdate notificationInfo) {
		if (notificationInfo == null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Connection c = null;
		try {
			c = ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs = null;
		Boolean wentIn = false;

		if (notificationInfo.getReadIndex() != null) {
			rs = updateNotificationReadIndex(c, notificationID, notificationInfo.getReadIndex());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (notificationInfo.getJustArrived() != null) {
			rs = updateNotificationJustArrived(c, notificationID, notificationInfo.getJustArrived());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		try {
			c.close();
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	public ResponseEntity<Void> deleteNotification(Long notificationID) {
		Boolean res = notification_dao.deleteNotification(notificationID);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}

	public ResponseEntity<Void> revokeNotification(Long notificationID) {
		Boolean res = notification_dao.revokeNotification(notificationID);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}
}
