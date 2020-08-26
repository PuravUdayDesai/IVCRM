package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

import org.springframework.stereotype.Service;
import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CountryDao;
import ivgroup.master.database.dto.country.Country;
import ivgroup.master.database.dto.country.CountryInsert;

@Service
public class CountryDaoImpl implements CountryDao {

	@Override
	public List<Country> getAllCountry() {
		List<Country> country_list = new ArrayList<Country>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromCountry\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return country_list;
			} else {
				do {
					country_list.add(new Country(rs.getLong("CountryID"), rs.getString("CountryName"),
							rs.getString("CountryCode"), rs.getString("CountryDescription"), rs.getBoolean("IsActive"),
							rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"), rs.getInt("DeviceType"),
							rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return country_list;
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
	public Country getOneCountryById(long country_id) {
		Country country_data = null;
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromCountryById\"(" + country_id + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == true) {
				country_data = new Country(rs.getLong("CountryID"), rs.getString("CountryName"),
						rs.getString("CountryCode"), rs.getString("CountryDescription"), rs.getBoolean("IsActive"),
						rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"), rs.getInt("DeviceType"),
						rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType"));
			}
			return country_data;
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
	public List<Country> searchInCountry(String search_content) {
		List<Country> country_list = new ArrayList<Country>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_searchInCountry\"(?)";
			st = c.prepareCall(sql);
			st.setString(1, search_content);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return country_list;
			} else {
				do {
					country_list.add(new Country(rs.getLong("CountryID"), rs.getString("CountryName"),
							rs.getString("CountryCode"), rs.getString("CountryDescription"), rs.getBoolean("IsActive"),
							rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"), rs.getInt("DeviceType"),
							rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return country_list;
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
	public Boolean addCountry(CountryInsert country_info) {
		if (country_info == null)
			return null;

		String sql = "SELECT location.\"fn_insertIntoCountry\"(?,?,?,?,?,?,?,?,?)";
		Connection c = null;
		CallableStatement st = null;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setString(1, country_info.getCountryName());
			st.setString(2, country_info.getCountryCode());
			st.setString(3, country_info.getCountryDescription());
			st.setTimestamp(4, country_info.getCreatedOn());
			st.setLong(5, country_info.getCreatedBy());
			st.setInt(6, country_info.getDeviceType());
			st.setTimestamp(7, country_info.getCreatedOn());	
			st.setLong(8, country_info.getCreatedBy());			
			st.setInt(9, country_info.getDeviceType());			

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
	public Boolean updateCountryName(Connection c, Long countryId, String countryName)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryCountryName\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setString(2, countryName);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCountryCode(Connection c, Long countryId, String countryCode)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryCountryCode\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setString(2, countryCode);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCountryDescription(Connection c, Long countryId, String countryDescription)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryCountryDescription\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setString(2, countryDescription);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCountryLastEditOn(Connection c, Long countryId, Timestamp countryLastEditOn)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryLastEditOn\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setTimestamp(2, countryLastEditOn);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCountryIsActive(Connection c, Long countryId, Boolean countryIsActive)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryIsActive\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setBoolean(2, countryIsActive);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCountryLastEditBy(Connection c, Long countryId, long countryLastEditBy)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryLastEditBy\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setLong(2, countryLastEditBy);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCountryDeviceType(Connection c, Long countryId, int deviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setInt(2, deviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateCountryLastEditDeviceType(Connection c, Long countryId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateCountryLastEditDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, countryId);
		st.setInt(2, lastEditDeviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean deleteCountry(Long country_id) throws ClassNotFoundException, SQLException {
		if (country_id == null)
			return false;
		String sql = "SELECT location.\"fn_deleteCountry\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, country_id);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

	@Override
	public Boolean revokeCountry(Long country_id) throws ClassNotFoundException, SQLException {
		if (country_id == null)
			return false;
		String sql = "SELECT location.\"fn_revokeCountry\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, country_id);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

}