package ivgroup.master.database.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.BusinessCityForCompanyDao;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompany;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyByStateID;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyInsert;

@Service
public class BusinessCityForCompanyDaoImpl implements BusinessCityForCompanyDao {
	
	Logger logger =LoggerFactory.getLogger(BusinessCityForCompanyDaoImpl.class);
	/*
	@Override
	public List<BusinessCityForCompany> getAllBusinessCityForCompany() {
		List<BusinessCityForCompany> businessCityForCompany_list = new ArrayList<BusinessCityForCompany>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromBusinessCityForCompany\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return businessCityForCompany_list;
			} else {
				do {
					businessCityForCompany_list.add(new BusinessCityForCompany(rs.getLong("BusinessCityForCompanyID"),
							rs.getLong("CompanyID"), rs.getString("CompanyName"), rs.getLong("CountryID"),
							rs.getString("CountryName"), rs.getLong("StateID"), rs.getString("StateName"),
							rs.getLong("CityID"), rs.getString("CityName"), rs.getString("CityCode"),
							rs.getString("CityDescription"), rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"),
							rs.getLong("CreatedBy"), rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
							rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return businessCityForCompany_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
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
	public BusinessCityForCompany getOneBusinessCityForCompanyById(long businessCityForCompany_id) {
		BusinessCityForCompany businessCityForCompany_data = null;
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromBusinessCityForCompanyById\"("
					+ businessCityForCompany_id + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == true) {
				businessCityForCompany_data = new BusinessCityForCompany(rs.getLong("BusinessCityForCompanyID"),
						rs.getLong("CompanyID"), rs.getString("CompanyName"), rs.getLong("CountryID"),
						rs.getString("CountryName"), rs.getLong("StateID"), rs.getString("StateName"),
						rs.getLong("CityID"), rs.getString("CityName"), rs.getString("CityCode"),
						rs.getString("CityDescription"), rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"),
						rs.getLong("CreatedBy"), rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
						rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType"));
			}
			return businessCityForCompany_data;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
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
	*/

	@Override
	public List<BusinessCityForCompany> getBusinessCityForCompanyInfoByCompanyId(long companyID) {
		List<BusinessCityForCompany> businessCityForCompany_list = new ArrayList<BusinessCityForCompany>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromBusinessCityForCompanyByCompanyId\"(" + companyID + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return businessCityForCompany_list;
			} else {
				do {
					businessCityForCompany_list.add(new BusinessCityForCompany(rs.getLong("BusinessCityForCompanyID"),
							rs.getLong("CompanyID"), rs.getString("CompanyName"), rs.getLong("CountryID"),
							rs.getString("CountryName"), rs.getLong("StateID"), rs.getString("StateName"),
							rs.getLong("CityID"), rs.getString("CityName"), rs.getString("CityCode"),
							rs.getString("CityDescription"), rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"),
							rs.getLong("CreatedBy"), rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
							rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return businessCityForCompany_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
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

	/*
	@Override
	public List<BusinessCityForCompany> searchInBusinessCityForCompany(String search_content) {
		List<BusinessCityForCompany> businessCityForCompany_list = new ArrayList<BusinessCityForCompany>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_searchInBusinessCityForCompany\"(?)";
			st = c.prepareCall(sql);
			st.setString(1, search_content);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return businessCityForCompany_list;
			} else {
				do {
					businessCityForCompany_list.add(new BusinessCityForCompany(rs.getLong("BusinessCityForCompanyID"),
							rs.getLong("CompanyID"), rs.getString("CompanyName"), rs.getLong("CountryID"),
							rs.getString("CountryName"), rs.getLong("StateID"), rs.getString("StateName"),
							rs.getLong("CityID"), rs.getString("CityName"), rs.getString("CityCode"),
							rs.getString("CityDescription"), rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"),
							rs.getLong("CreatedBy"), rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
							rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return businessCityForCompany_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
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
	*/
	
	@Override
	public List<BusinessCityForCompanyByStateID> selectBusinessCityUsingStateId(Long stateID, Long ownerID) {
		List<BusinessCityForCompanyByStateID> city_list = new ArrayList<BusinessCityForCompanyByStateID>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectBusinessCityUsingStateId\"(?,?)";
			st = c.prepareCall(sql);
			st.setLong(1, stateID);
			st.setLong(2, ownerID);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return city_list;
			} else {
				do {
					city_list.add(new BusinessCityForCompanyByStateID(rs.getLong("CityID"), rs.getString("CityName")));
				} while (rs.next());
			}
			return city_list;
		} catch (SQLException s) {
			s.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
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
	public Boolean addBusinessCityForCompany(BusinessCityForCompanyInsert businessCityForCompany_info) {
		if (businessCityForCompany_info == null)
			return null;

		String sql = "SELECT * location.\"fn_insertIntoBusinessCityForCompany\"(?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection c = null;
		CallableStatement st = null;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1, businessCityForCompany_info.getCompanyID());
			st.setLong(2, businessCityForCompany_info.getCountryID());
			st.setLong(3, businessCityForCompany_info.getStateID());
			st.setString(4, businessCityForCompany_info.getCityName());
			st.setString(5, businessCityForCompany_info.getCityCode());
			st.setString(6, businessCityForCompany_info.getCityDescription());
			st.setTimestamp(7, businessCityForCompany_info.getCreatedOn());
			st.setLong(8, businessCityForCompany_info.getCreatedBy());
			st.setInt(9, businessCityForCompany_info.getDeviceType());
			st.setTimestamp(10, businessCityForCompany_info.getCreatedOn());
			st.setLong(11, businessCityForCompany_info.getCreatedBy());
			st.setInt(12, businessCityForCompany_info.getDeviceType());

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
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
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
	public Boolean updateBusinessCityForCompanyCompanyId(Connection c, Long businessCityForCompanyId, Long companyId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateBusinessCityForCompanyCompanyID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompanyId);
		st.setLong(2, companyId);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessCityForCompanyCityID(Connection c, Long businessCityForCompanyId, Long cityId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateBusinessCityForCompanyCityID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompanyId);
		st.setLong(2, cityId);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessCityForCompanyLastEditOn(Connection c, Long businessCityForCompanyId,
			Timestamp businessCityForCompanyLastEditOn) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateBusinessCityForCompanyLastEditOn\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompanyId);
		st.setTimestamp(2, businessCityForCompanyLastEditOn);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessCityForCompanyIsActive(Connection c, Long businessCityForCompanyId,
			Boolean businessCityForCompanyIsActive) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateBusinessCityForCompanyIsActive\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompanyId);
		st.setBoolean(2, businessCityForCompanyIsActive);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessCityForCompanyLastEditBy(Connection c, Long businessCityForCompanyId,
			long businessCityForCompanyLastEditBy) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateBusinessCityForCompanyLastEditBy\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompanyId);
		st.setLong(2, businessCityForCompanyLastEditBy);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessCityForCompanyDeviceType(Connection c, Long businessCityForCompanyId, int deviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateBusinessCityForCompanyDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompanyId);
		st.setInt(2, deviceType);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessCityForCompanyLastEditDeviceType(Connection c, Long businessCityForCompanyId,
			int lastEditDeviceType) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateBusinessCityForCompanyLastEditDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompanyId);
		st.setInt(2, lastEditDeviceType);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateCityName(Connection c, Long cityId, String cityName)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateCityCityName\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setString(2, cityName);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateCityDescription(Connection c, Long cityId, String cityDescription)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateCityCityDescription\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setString(2, cityDescription);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateCityCode(Connection c, Long cityId, String cityCode)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateCityCityCode\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityId);
		st.setString(2, cityCode);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateCityStateID(Connection c, Long cityID, Long stateID)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateCityStateID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityID);
		st.setLong(2, stateID);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}
	
	@Override
	public Boolean updateCityCountryID(Connection c, Long cityID, Long countryID)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * location.\"fn_updateCityCountryID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, cityID);
		st.setLong(2, countryID);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}
	
	@Override
	public Boolean deleteBusinessCityForCompany(Long businessCityForCompany_id)
			throws ClassNotFoundException, SQLException {
		if (businessCityForCompany_id == null)
			return false;
		String sql = "SELECT * location.\"fn_deleteBusinessCityFromCompany\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompany_id);
		Boolean rs = st.execute();
		c.commit();
		c.close();
		st.close();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

	@Override
	public Boolean revokeBusinessCityForCompany(Long businessCityForCompany_id)
			throws ClassNotFoundException, SQLException {
		if (businessCityForCompany_id == null)
			return false;
		String sql = "SELECT * location.\"fn_revokeBusinessCityFromCompany\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, businessCityForCompany_id);
		Boolean rs = st.execute();
		c.commit();
		c.close();
		st.close();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

}
