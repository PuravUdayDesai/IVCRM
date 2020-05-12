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
import ivgroup.master.database.dao.schema.CityDao;
import ivgroup.master.database.dto.city.City;
import ivgroup.master.database.dto.city.CityInfoFromStateId;
import ivgroup.master.database.dto.city.CityInsert;

@Service
public class CityDaoImpl implements CityDao {

	@Override
	public List<City> getAllCity() {
		List<City> city_list = new ArrayList<City>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromCity\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return city_list;
			} else {
				do {
					city_list.add(new City(rs.getLong("CityID"), rs.getString("CityName"), rs.getString("CityCode"),
							rs.getLong("CountryID"), rs.getString("CountryName"), rs.getLong("StateID"),
							rs.getString("StateName"), rs.getString("CityDescription"), rs.getBoolean("IsActive"),
							rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"), rs.getInt("DeviceType"),
							rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return city_list;
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
	public City getOneCityById(long city_id) {
		City city_data = null;
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromCityById\"(" + city_id + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == true) {
				city_data = new City(rs.getLong("CityID"), rs.getString("CityName"), rs.getString("CityCode"),
						rs.getLong("CountryID"), rs.getString("CountryName"), rs.getLong("StateID"),
						rs.getString("StateName"), rs.getString("CityDescription"), rs.getBoolean("IsActive"),
						rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"), rs.getInt("DeviceType"),
						rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType"));
			}
			return city_data;
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
	public List<City> searchInCity(String search_content) {
		List<City> city_list = new ArrayList<City>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_searchInCity\"(?)";
			st = c.prepareCall(sql);
			st.setString(1, search_content);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return city_list;
			} else {
				do {
					city_list.add(new City(rs.getLong("CityID"), rs.getString("CityName"), rs.getString("CityCode"),
							rs.getLong("CountryID"), rs.getString("CountryName"), rs.getLong("StateID"),
							rs.getString("StateName"), rs.getString("CityDescription"), rs.getBoolean("IsActive"),
							rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"), rs.getInt("DeviceType"),
							rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return city_list;
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
	public List<CityInfoFromStateId> selectCityUsingStateId(Long state_id) {
		List<CityInfoFromStateId> city_list = new ArrayList<CityInfoFromStateId>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectCityUsingStateId\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, state_id);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return city_list;
			} else {
				do {
					city_list.add(new CityInfoFromStateId(rs.getLong("CityID"), rs.getString("CityName"),
							rs.getString("CityCode"), rs.getString("CityDescription")));
				} while (rs.next());
			}
			return city_list;
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
	public Boolean addCity(CityInsert city_info) {
		if (city_info == null)
			return null;

		String sql = "SELECT location.\"fn_insertIntoCity\"(?,?,?,?,?,?,?,?,?,?,?)";
		Connection c = null;
		CallableStatement st = null;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1, city_info.getCountryID());
			st.setLong(2, city_info.getStateID());
			st.setString(3, city_info.getCityName());
			st.setString(4, city_info.getCityCode());
			st.setString(5, city_info.getCityDescription());
			st.setTimestamp(6, city_info.getCreatedOn());
			st.setLong(7, city_info.getCreatedBy());
			st.setInt(8, city_info.getDeviceType());
			st.setTimestamp(9, city_info.getCreatedOn());
			st.setLong(10, city_info.getCreatedBy());
			st.setInt(11, city_info.getDeviceType());

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
	public Boolean updateCityName(Connection c, Long cityId, String cityName)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityCityName\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setString(2, cityName);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityDescription(Connection c, Long cityId, String cityDescription)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityCityDescription\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setString(2, cityDescription);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityCode(Connection c, Long cityId, String cityCode)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityCityCode\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setString(2, cityCode);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityLastEditOn(Connection c, Long cityId, Timestamp cityLastEditOn)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityLastEditOn\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setTimestamp(2, cityLastEditOn);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityIsActive(Connection c, Long cityId, Boolean cityIsActive)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityIsActive\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setBoolean(2, cityIsActive);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityLastEditBy(Connection c, Long cityId, Long cityLastEditBy)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityLastEditBy\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setLong(2, cityLastEditBy);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityDeviceType(Connection c, Long cityId, int deviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setInt(2, deviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityLastEditDeviceType(Connection c, Long cityId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityLastEditDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setInt(2, lastEditDeviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityCountryId(Connection c, Long cityId, Long cityCountryId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityCountryID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setLong(2, cityCountryId);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCityStateId(Connection c, Long cityId, Long cityStateId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCityStateID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setLong(2, cityStateId);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean deleteCity(Long cityId) throws SQLException, ClassNotFoundException {
		if (cityId == null)
			return false;
		String sql = "SELECT location.\"fn_deleteCity\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

	@Override
	public Boolean revokeCity(Long cityId) throws SQLException, ClassNotFoundException {
		if (cityId == null)
			return false;
		String sql = "SELECT location.\"fn_revokeCity\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}
}
