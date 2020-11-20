package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.notification.NotificationInsert;
import ivgroup.master.database.dto.notification.NotificationSelect;

public interface NotificationDao {

	public List<NotificationSelect> selectNotifications(Long companyExecutiveID);
	
	public Boolean addNotification(NotificationInsert n_ins);
	
	public Boolean updateJustArrived(Connection c, Long notificationID, Boolean justArrived) throws ClassNotFoundException, SQLException;

	public Boolean updateReadIndex(Connection c, Long notificationID, Boolean readIndex) throws ClassNotFoundException, SQLException;
	
	public Boolean deleteNotification(Long notificationID);
	
	public Boolean revokeNotification(Long notificationID);

}
