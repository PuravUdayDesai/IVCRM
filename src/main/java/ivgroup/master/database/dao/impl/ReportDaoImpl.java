package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.ReportDao;
import ivgroup.master.database.dto.report.ExecutiveReport;
import ivgroup.master.database.dto.report.LocationNStatusReport;
import ivgroup.master.database.dto.report.LocationPriorityReport;
import ivgroup.master.database.dto.report.LocationTimeReport;
import ivgroup.master.database.dto.report.ProductReport;

@Service
public class ReportDaoImpl implements ReportDao {

	@Override
	public List<ProductReport> generateProductReport() {
		List<ProductReport> prod_report = new ArrayList<ProductReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"ProductReport\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return prod_report;
			} else {
				do {
					prod_report.add(new ProductReport(rs.getString("ProductName"), rs.getLong("TotalTickets"),
							rs.getLong("NumOfClient"), rs.getLong("Closure"), rs.getDouble("TotalRevenue")));
				} while (rs.next());
			}
			return prod_report;
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
	public List<ExecutiveReport> generateExecutiveReport(Long companyID) {
		List<ExecutiveReport> report = new ArrayList<ExecutiveReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * from report.\"ExecutiveReport\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyID);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return report;
			} else {
				do {
					report.add(new ExecutiveReport(rs.getString("CompanyExecutiveName"), rs.getLong("TotalTickets"),
							rs.getLong("TicketCompleted"), rs.getLong("ticketDelayed"), rs.getLong("TicketPending"),
							rs.getInt("PLRate")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationTimeReport> generateStateTimeReport() {
		List<LocationTimeReport> report = new ArrayList<LocationTimeReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"StateTimeReport\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return report;
			} else {
				do {
					report.add(new LocationTimeReport(rs.getString("StateName"), rs.getLong("TotalTickets"),
							rs.getLong("Today"), rs.getLong("Tomorrow"), rs.getLong("NextWeek"),
							rs.getLong("NextMonth"), rs.getLong("NextQuarter")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationTimeReport> generateCityTimeReport(Long companyID) {
		List<LocationTimeReport> report = new ArrayList<LocationTimeReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"CityTimeReport\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyID);
			rs = st.executeQuery();
			rs.next();
			report.add(new LocationTimeReport(rs.getString("CityName"), rs.getLong("TotalTickets"), rs.getLong("Today"),
					rs.getLong("Tomorrow"), rs.getLong("NextWeek"), rs.getLong("NextMonth"),
					rs.getLong("NextQuarter")));
			if (rs.next() == false) {
				report.clear();
				return report;
			} else {
				do {
					report.add(new LocationTimeReport(rs.getString("CityName"), rs.getLong("TotalTickets"),
							rs.getLong("Today"), rs.getLong("Tomorrow"), rs.getLong("NextWeek"),
							rs.getLong("NextMonth"), rs.getLong("NextQuarter")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationTimeReport> generateAreaTimeReport(Long companyID) {
		List<LocationTimeReport> report = new ArrayList<LocationTimeReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"AreaTimeReport\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyID);
			rs = st.executeQuery();
			rs.next();
			report.add(new LocationTimeReport(rs.getString("AreaName"), rs.getLong("TotalTickets"), rs.getLong("Today"),
					rs.getLong("Tomorrow"), rs.getLong("NextWeek"), rs.getLong("NextMonth"),
					rs.getLong("NextQuarter")));
			if (rs.next() == false) {
				report.clear();
				return report;
			} else {
				do {
					report.add(new LocationTimeReport(rs.getString("AreaName"), rs.getLong("TotalTickets"),
							rs.getLong("Today"), rs.getLong("Tomorrow"), rs.getLong("NextWeek"),
							rs.getLong("NextMonth"), rs.getLong("NextQuarter")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationPriorityReport> generateStatePriorityReport() {
		List<LocationPriorityReport> report = new ArrayList<LocationPriorityReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"StatePriorityReport\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return report;
			} else {
				do {
					report.add(new LocationPriorityReport(rs.getString("StateName"), rs.getLong("TotalTickets"),
							rs.getLong("Immediate"), rs.getLong("High"), rs.getLong("Normal"), rs.getLong("Low")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationPriorityReport> generateCityPriorityReport(Long companyID) {
		List<LocationPriorityReport> report = new ArrayList<LocationPriorityReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"CityPriorityReport\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyID);
			rs = st.executeQuery();
			rs.next();
			report.add(new LocationPriorityReport(rs.getString("CityName"), rs.getLong("TotalTickets"),
					rs.getLong("Immediate"), rs.getLong("High"), rs.getLong("Normal"), rs.getLong("Low")));
			if (rs.next() == false) {
				report.clear();
				return report;
			} else {
				do {
					report.add(new LocationPriorityReport(rs.getString("CityName"), rs.getLong("TotalTickets"),
							rs.getLong("Immediate"), rs.getLong("High"), rs.getLong("Normal"), rs.getLong("Low")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationPriorityReport> generateAreaPriorityReport(Long companyID) {
		List<LocationPriorityReport> report = new ArrayList<LocationPriorityReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"AreaPriorityReport\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyID);
			rs = st.executeQuery();
			rs.next();
			report.add(new LocationPriorityReport(rs.getString("AreaName"), rs.getLong("TotalTickets"),
					rs.getLong("Immediate"), rs.getLong("High"), rs.getLong("Normal"), rs.getLong("Low")));
			if (rs.next() == false) {
				report.clear();
				return report;
			} else {
				do {
					report.add(new LocationPriorityReport(rs.getString("AreaName"), rs.getLong("TotalTickets"),
							rs.getLong("Immediate"), rs.getLong("High"), rs.getLong("Normal"), rs.getLong("Low")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationNStatusReport> generateStateStatusReport() {
		List<LocationNStatusReport> report = new ArrayList<LocationNStatusReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"StateNStatusReport\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return report;
			} else {
				do {
					report.add(new LocationNStatusReport(rs.getString("StateName"), rs.getLong("TotalTickets"),
							rs.getLong("Prospects"), rs.getLong("CallBack"), rs.getLong("DemoPending"),
							rs.getLong("Quotation"), rs.getLong("PaymentPending"), rs.getLong("Closure"),
							rs.getLong("Dead")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationNStatusReport> generateCityStatusReport(Long companyID) {
		List<LocationNStatusReport> report = new ArrayList<LocationNStatusReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"CityNStatus\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyID);
			rs = st.executeQuery();
			rs.next();
			report.add(new LocationNStatusReport(rs.getString("CityName"), rs.getLong("TotalTickets"),
					rs.getLong("Prospects"), rs.getLong("CallBack"), rs.getLong("DemoPending"), rs.getLong("Quotation"),
					rs.getLong("PaymentPending"), rs.getLong("Closure"), rs.getLong("Dead")));
			if (rs.next() == false) {
				report.clear();
				return report;
			} else {
				do {
					report.add(new LocationNStatusReport(rs.getString("CityName"), rs.getLong("TotalTickets"),
							rs.getLong("Prospects"), rs.getLong("CallBack"), rs.getLong("DemoPending"),
							rs.getLong("Quotation"), rs.getLong("PaymentPending"), rs.getLong("Closure"),
							rs.getLong("Dead")));
				} while (rs.next());
			}
			return report;
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
	public List<LocationNStatusReport> generateAreaStatusReport(Long companyID) {
		List<LocationNStatusReport> report = new ArrayList<LocationNStatusReport>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM report.\"AreaNStatus\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, companyID);
			rs = st.executeQuery();
			rs.next();
			report.add(new LocationNStatusReport(rs.getString("AreaName"), rs.getLong("TotalTickets"),
					rs.getLong("Prospects"), rs.getLong("CallBack"), rs.getLong("DemoPending"), rs.getLong("Quotation"),
					rs.getLong("PaymentPending"), rs.getLong("Closure"), rs.getLong("Dead")));
			if (rs.next() == false) {
				report.clear();
				return report;
			} else {
				do {
					report.add(new LocationNStatusReport(rs.getString("AreaName"), rs.getLong("TotalTickets"),
							rs.getLong("Prospects"), rs.getLong("CallBack"), rs.getLong("DemoPending"),
							rs.getLong("Quotation"), rs.getLong("PaymentPending"), rs.getLong("Closure"),
							rs.getLong("Dead")));
				} while (rs.next());
			}
			return report;
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
}
