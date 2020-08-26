package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.AreaDao;
import ivgroup.master.database.dto.area.Area;
import ivgroup.master.database.dto.area.AreaInfoFromCityId;
import ivgroup.master.database.dto.area.AreaInsert;

@Service
public class AreaDaoImpl implements AreaDao {

	@Override
	public List<Area> getAllArea() {
		List<Area> area_list = new ArrayList<Area>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromArea\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return area_list;
			} else {
				do {
					area_list.add(new Area(rs.getLong("AreaID"), rs.getString("AreaName"),
							rs.getString("AreaCode"), rs.getString("AreaDescription"),
							rs.getLong("CountryID"), rs.getString("CountryName"), rs.getLong("StateID"),
							rs.getString("StateName"), rs.getLong("CityID"), rs.getString("CityName"),
							rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"),
							rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"),
							rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return area_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			;
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
	public Area getOneAreaById(long area_id) {
		Area area_data = null;
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromAreaById\"(" + area_id + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == true) {
				area_data = new Area(rs.getLong("AreaID"), rs.getString("AreaName"),
						rs.getString("AreaCode"), rs.getString("AreaDescription"),
						rs.getLong("CountryID"), rs.getString("CountryName"), rs.getLong("StateID"),
						rs.getString("StateName"), rs.getLong("CityID"), rs.getString("CityName"),
						rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"),
						rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"),
						rs.getInt("LastEditDeviceType"));
			}
			return area_data;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			;
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
	public List<Area> searchInArea(String search_content) {
		List<Area> area_list = new ArrayList<Area>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_searchInArea\"(?)";
			st = c.prepareCall(sql);
			st.setString(1, search_content);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return area_list;
			} else {
				do {
					area_list.add(new Area(rs.getLong("AreaID"), rs.getString("AreaName"),
							rs.getString("AreaCode"), rs.getString("AreaDescription"),
							rs.getLong("CountryID"), rs.getString("CountryName"), rs.getLong("StateID"),
							rs.getString("StateName"), rs.getLong("CityID"), rs.getString("CityName"),
							rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"),
							rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"),
							rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return area_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			;
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
	public List<AreaInfoFromCityId> selectAreaUsingCityId(Long city_id) {
		List<AreaInfoFromCityId> area_list = new ArrayList<AreaInfoFromCityId>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectAreaUsingCityId\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, city_id);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return area_list;
			} else {
				do {
					area_list.add(new AreaInfoFromCityId(rs.getLong("AreaID"), rs.getString("AreaName"),
							rs.getString("AreaCode"), rs.getString("AreaDescription")));
				} while (rs.next());
			}
			return area_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			;
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
	public Boolean addArea(AreaInsert area_info) {
		if (area_info == null)
			return null;

		String sql = "SELECT location.\"fn_insertIntoArea\"(?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection c = null;
		CallableStatement st = null;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1, area_info.getCountryID());
			st.setLong(2, area_info.getStateID());
			st.setLong(3, area_info.getCityID());
			st.setString(4, area_info.getBusinessAreaName());
			st.setString(5, area_info.getBusinessAreaCode());
			st.setString(6, area_info.getBusinessAreaDescription());
			st.setTimestamp(7, area_info.getCreatedOn());
			st.setLong(8, area_info.getCreatedBy());
			st.setInt(9, area_info.getDeviceType());
			st.setTimestamp(10, area_info.getCreatedOn());
			st.setLong(11, area_info.getCreatedBy());
			st.setInt(12, area_info.getDeviceType());

			boolean rs = st.execute();
			c.commit();
			if (rs) {
				return rs;
			} else {
				return rs;
			}
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			;
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
	public Boolean updateAreaName(Connection c, Long areaId, String areaName)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaAreaName\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setString(2, areaName);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaDescription(Connection c, Long areaId, String areaDescription)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaAreaDescription\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setString(2, areaDescription);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaCode(Connection c, Long areaId, String areaCode)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaAreaCode\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setString(2, areaCode);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaLastEditOn(Connection c, Long areaId, Timestamp areaLastEditOn)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaLastEditOn\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setTimestamp(2, areaLastEditOn);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaIsActive(Connection c, Long areaId, Boolean areaIsActive)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaIsActive\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setBoolean(2, areaIsActive);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaLastEditBy(Connection c, Long areaId, Long areaLastEditBy)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaLastEditBy\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setLong(2, areaLastEditBy);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaDeviceType(Connection c, Long areaId, int deviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setInt(2, deviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaLastEditDeviceType(Connection c, Long areaId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaLastEditDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setInt(2, lastEditDeviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaCountryId(Connection c, Long areaId, Long areaCountryId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaCountryID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setLong(2, areaCountryId);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateAreaStateId(Connection c, Long areaId, Long areaStateId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaStateID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setLong(2, areaStateId);
		boolean res = st.execute();
		c.commit();
		return res;
	}
	
	@Override
	public Boolean updateAreaCityId(Connection c, Long areaId, Long areaCityId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateAreaCityID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setLong(2, areaCityId);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean deleteArea(Long areaId) throws SQLException, ClassNotFoundException {
		if (areaId == null)
			return false;
		String sql = "SELECT location.\"fn_deleteArea\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

	@Override
	public Boolean revokeArea(Long areaId) throws SQLException, ClassNotFoundException {
		if (areaId == null)
			return false;
		String sql = "SELECT location.\"fn_revokeArea\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}
}