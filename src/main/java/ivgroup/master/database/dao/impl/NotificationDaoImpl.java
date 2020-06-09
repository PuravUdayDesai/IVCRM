package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.NotificationDao;
import ivgroup.master.database.dto.notification.NotificationInsert;
import ivgroup.master.database.dto.notification.NotificationSelect;

@Service
public class NotificationDaoImpl implements NotificationDao {

	@Override
	public List<NotificationSelect> selectNotifications(Long companyExecutiveID) {
		List<NotificationSelect> notification_list = new ArrayList<NotificationSelect>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM notification.\"fn_selectNotifications\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyExecutiveID);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return notification_list;
			} else {
				do {
					notification_list.add(
							new NotificationSelect(
									rs.getLong("CompanyExecutiveID"), 
									rs.getString("CompanyExecutiveName"),
									rs.getLong("NotificationID"), 
									rs.getString("NotificationSubject"),
									rs.getString("NotificationDescription"),
									rs.getTimestamp("NotificationTime"),
									"",
									rs.getBoolean("ReadIndex")));
				} while (rs.next());
			}
			return notification_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				c.close();
				st.close();
				rs.close();
			} catch (Exception e) {
			}
		}
	}

	@Override
	public Boolean addNotification(NotificationInsert n_ins) {
		if (n_ins == null)
			return null;

		String sql = "SELECT notification.\"fn_insertNotification\"(?, ?, ?, ?, ?)";
		Connection c = null;
		CallableStatement st = null;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1,n_ins.getCompanyExecutiveID());
			st.setString(2,n_ins.getCompanyExecutiveName());
			st.setString(3,n_ins.getNotificationSubject());
			st.setString(4, n_ins.getNotificationDescription());
			st.setTimestamp(5, n_ins.getNotificationTime());			
			boolean rs = st.execute();
			c.commit();
			return rs;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				c.close();
				st.close();
			} catch (Exception e) {
			}
		}
	}

	@Override
	public Boolean updateJustArrived(Connection c, Long notificationID, Boolean justArrived)
			throws ClassNotFoundException, SQLException {
		String sql = "SELECT notification.\"fn_updateJustArrived\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, notificationID);
		st.setBoolean(2, justArrived);
		boolean rs = st.execute();
		c.commit();
		return rs;
	}

	@Override
	public Boolean updateReadIndex(Connection c, Long notificationID, Boolean readIndex)
			throws ClassNotFoundException, SQLException {
		String sql = "SELECT notification.\"fn_updateReadIndex\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, notificationID);
		st.setBoolean(2, readIndex);
		boolean rs = st.execute();
		c.commit();
		return rs;
	}

	@Override
	public Boolean deleteNotification(Long notificationID) {
		if (notificationID == null)
			return false;
		String sql = "SELECT notification.\"fn_updateMarkForDelete\"(?)";
		Connection c = null;
		CallableStatement st = null;
		Boolean rs;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1, notificationID);
			rs = st.execute();
			c.commit();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;			
		}
		return rs;
	}

	@Override
	public Boolean revokeNotification(Long notificationID) {
		if (notificationID == null)
			return false;
		String sql = "SELECT notification.\"fn_revokeMarkForDelete\"(?)";
		Connection c = null;
		CallableStatement st = null;
		Boolean rs;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1, notificationID);
			rs = st.execute();
			c.commit();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;			
		}
		return rs;
	}

}
