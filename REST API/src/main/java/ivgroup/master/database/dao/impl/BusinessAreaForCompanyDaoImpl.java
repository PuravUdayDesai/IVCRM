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
import ivgroup.master.database.dao.schema.BusinessAreaForCompanyDao;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompany;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyByCityID;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyInsert;

@Service
public class BusinessAreaForCompanyDaoImpl implements BusinessAreaForCompanyDao {
	
	Logger logger =LoggerFactory.getLogger(BusinessAreaForCompanyDaoImpl.class);
	/*
	 * @Override public List<BusinessAreaForCompany> getAllBusinessAreaForCompany()
	 * { List<BusinessAreaForCompany> businessAreaForCompany_list = new
	 * ArrayList<BusinessAreaForCompany>(); Connection c = null; CallableStatement
	 * st = null; ResultSet rs = null; try { c = ConnectionProvider.getConnection();
	 * String sql =
	 * "SELECT * FROM location.\"fn_selectFromBusinessAreaForCompany\"()"; st =
	 * c.prepareCall(sql); rs = st.executeQuery(); if (rs.next() == false) { return
	 * businessAreaForCompany_list; } else { do {
	 * businessAreaForCompany_list.add(new
	 * BusinessAreaForCompany(rs.getLong("BusinessAreaForCompanyID"),
	 * rs.getLong("CompanyID"), rs.getString("CompanyName"), rs.getLong("AreaID"),
	 * rs.getString("AreaName"), rs.getString("AreaCode"),
	 * rs.getString("AreaDescription"), rs.getLong("CityID"),
	 * rs.getString("CityName"), rs.getBoolean("IsActive"),
	 * rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"),
	 * rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
	 * rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType"))); } while
	 * (rs.next()); } return businessAreaForCompany_list; } catch (SQLException s) {
	 * s.printStackTrace(); return null; } catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
	 * ; return null; } finally { try { c.close(); st.close();
	 * rs.close(); } catch (Exception e) { } } }
	 */
/*
	@Override
	public BusinessAreaForCompany getBusinessAreaForCompanyByAreaId(Long AreaId) {
		BusinessAreaForCompany businessAreaForCompany_list = null;
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromBusinessAreaForCompanyByAreaId\"(" + AreaId + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return businessAreaForCompany_list;
			} else {
				businessAreaForCompany_list = new BusinessAreaForCompany(rs.getLong("BusinessAreaForCompanyID"),
						rs.getLong("CompanyID"), rs.getString("CompanyName"), rs.getLong("CountryID"),
						rs.getString("CountryName"), rs.getLong("StateID"), rs.getString("StateName"),
						rs.getLong("AreaID"), rs.getString("AreaName"), rs.getString("AreaCode"),
						rs.getString("AreaDescription"), rs.getLong("CityID"), rs.getString("CityName"),
						rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"),
						rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"),
						rs.getInt("LastEditDeviceType"));
			}
			return businessAreaForCompany_list;
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
	public List<BusinessAreaForCompany> getOneBusinessAreaForCompanyById(long businessAreaForCompany_id) {
		List<BusinessAreaForCompany> businessAreaForCompany_list = new ArrayList<BusinessAreaForCompany>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromBusinessAreaForCompanyById\"("
					+ businessAreaForCompany_id + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == true) {
				do {
					businessAreaForCompany_list.add(
							new BusinessAreaForCompany(
									rs.getLong("BusinessAreaForCompanyID"),
									rs.getLong("CompanyID"), 
									rs.getString("CompanyName"),
									rs.getLong("CountryID"),
									rs.getString("CountryName"),
									rs.getLong("StateID"),
									rs.getString("StateName"),
									rs.getLong("AreaID"),
									rs.getString("AreaName"),
									rs.getString("AreaCode"),
									rs.getString("AreaDescription"),
									rs.getLong("CityID"), 
									rs.getString("CityName"),
									rs.getBoolean("IsActive"), 
									rs.getTimestamp("CreatedOn"), 
									rs.getLong("CreatedBy"),
									rs.getInt("DeviceType"),
									rs.getTimestamp("LastEditOn"),
									rs.getLong("LastEditBy"),
									rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return businessAreaForCompany_list;
		} catch (SQLException e) {
			logger.error("Exception: "+e.getMessage());
			return null;
		} catch (ClassNotFoundException e) { 
			logger.error("Exception: "+e.getMessage());
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
	 * @Override public List<BusinessAreaForCompany>
	 * searchInBusinessAreaForCompany(String search_content) {
	 * List<BusinessAreaForCompany> businessAreaForCompany_list = new
	 * ArrayList<BusinessAreaForCompany>(); Connection c = null; CallableStatement
	 * st = null; ResultSet rs = null; try { c = ConnectionProvider.getConnection();
	 * String sql =
	 * "SELECT * FROM location.\"fn_searchInBusinessAreaForCompany\"(?)"; st =
	 * c.prepareCall(sql); st.setString(1, search_content); rs = st.executeQuery();
	 * if (rs.next() == false) { return businessAreaForCompany_list; } else { do {
	 * businessAreaForCompany_list.add(new
	 * BusinessAreaForCompany(rs.getLong("BusinessAreaForCompanyID"),
	 * rs.getLong("CompanyID"), rs.getString("CompanyName"), rs.getLong("AreaID"),
	 * rs.getString("AreaName"), rs.getString("AreaCode"),
	 * rs.getString("AreaDescription"), rs.getLong("CityID"),
	 * rs.getString("CityName"), rs.getBoolean("IsActive"),
	 * rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"),
	 * rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
	 * rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType"))); } while
	 * (rs.next()); } return businessAreaForCompany_list; } catch (SQLException s) {
	 * s.printStackTrace(); return null; } catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
	 * ; return null; } finally { try { c.close(); st.close();
	 * rs.close(); } catch (Exception e) { } } }
	 */

	@Override
	public List<BusinessAreaForCompanyByCityID> selectBusinessAreaUsingCityId(Long city_id, Long owner_id) {
		List<BusinessAreaForCompanyByCityID> area_list = new ArrayList<BusinessAreaForCompanyByCityID>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectBusinessAreaUsingCityId\"(?,?)";
			st = c.prepareCall(sql);
			st.setLong(1, city_id);
			st.setLong(2, owner_id);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return area_list;
			} else {
				do {
					area_list.add(new BusinessAreaForCompanyByCityID(rs.getLong("AreaID"), rs.getString("AreaName")));
				} while (rs.next());
			}
			return area_list;
		} catch (SQLException e) {
			logger.error("Exception: "+e.getMessage());
			return null;
		} catch (ClassNotFoundException e) { 
			logger.error("Exception: "+e.getMessage());
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
	public Boolean addBusinessAreaForCompany(BusinessAreaForCompanyInsert businessAreaForCompany_info) {
		if (businessAreaForCompany_info == null)
			return null;

		String sql = "SELECT * FROM location.\"fn_insertIntoBusinessAreaForCompany\"(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Connection c = null;
		CallableStatement st = null;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1, businessAreaForCompany_info.getCompanyID());
			st.setLong(2, businessAreaForCompany_info.getCountryID());
			st.setLong(3, businessAreaForCompany_info.getStateID());
			st.setLong(4, businessAreaForCompany_info.getCityID());
			st.setString(5, businessAreaForCompany_info.getAreaName());
			st.setString(6, businessAreaForCompany_info.getAreaCode());
			st.setString(7, businessAreaForCompany_info.getAreaDescription());
			st.setTimestamp(8, businessAreaForCompany_info.getCreatedOn());
			st.setLong(9, businessAreaForCompany_info.getCreatedBy());
			st.setInt(10, businessAreaForCompany_info.getDeviceType());
			st.setTimestamp(11, businessAreaForCompany_info.getCreatedOn());
			st.setLong(12, businessAreaForCompany_info.getCreatedBy());
			st.setInt(13, businessAreaForCompany_info.getDeviceType());

			boolean rs = st.execute();
			c.commit();
			if (rs) {
				return rs;
			} else {
				return rs;
			}
		} catch (SQLException e) {
			logger.error("Exception: "+e.getMessage());
			return null;
		} catch (ClassNotFoundException e) { 
			logger.error("Exception: "+e.getMessage());
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
	public Boolean updateBusinessAreaForCompanyCompanyId(Connection c, Long businessAreaForCompanyId, Long companyId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateBusinessAreaForCompanyCompanyID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompanyId);
		st.setLong(2, companyId);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessAreaForCompanyLastEditOn(Connection c, Long businessAreaForCompanyId,
			Timestamp businessAreaForCompanyLastEditOn) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateBusinessAreaForCompanyLastEditOn\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompanyId);
		st.setTimestamp(2, businessAreaForCompanyLastEditOn);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessAreaForCompanyIsActive(Connection c, Long businessAreaForCompanyId,
			Boolean businessAreaForCompanyIsActive) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateBusinessAreaForCompanyIsActive\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompanyId);
		st.setBoolean(2, businessAreaForCompanyIsActive);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessAreaForCompanyLastEditBy(Connection c, Long businessAreaForCompanyId,
			long businessAreaForCompanyLastEditBy) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateBusinessAreaForCompanyLastEditBy\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompanyId);
		st.setLong(2, businessAreaForCompanyLastEditBy);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessAreaForCompanyDeviceType(Connection c, Long businessAreaForCompanyId, int deviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateBusinessAreaForCompanyDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompanyId);
		st.setInt(2, deviceType);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateBusinessAreaForCompanyLastEditDeviceType(Connection c, Long businessAreaForCompanyId,
			int lastEditDeviceType) throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateBusinessAreaForCompanyLastEditDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompanyId);
		st.setInt(2, lastEditDeviceType);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateAreaName(Connection c, Long areaId, String areaName)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateAreaAreaName\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setString(2, areaName);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateAreaDescription(Connection c, Long areaId, String areaDescription)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateAreaAreaDescription\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setString(2, areaDescription);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateAreaCode(Connection c, Long areaId, String areaCode)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateAreaAreaCode\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setString(2, areaCode);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateAreaCityID(Connection c, Long areaId, Long cityID)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateAreaCityID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setLong(2, cityID);
		boolean res = st.execute();
		c.commit();
		st.close();
		String sqlTwo = "SELECT * FROM location.\"fn_updateBusinessAreaForCompanyCityID\"(?,?)";
		CallableStatement stTwo = null;
		stTwo = c.prepareCall(sqlTwo);
		stTwo.setLong(1, areaId);
		stTwo.setLong(2, cityID);
		boolean resTwo = stTwo.execute();
		c.commit();
		stTwo.close();
		return res&&resTwo;
	}

	@Override
	public Boolean updateAreaStateID(Connection c, Long areaId, Long stateID)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateAreaStateID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setLong(2, stateID);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean updateAreaCountryID(Connection c, Long areaId, Long countryID)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT * FROM location.\"fn_updateAreaCountryID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, areaId);
		st.setLong(2, countryID);
		boolean res = st.execute();
		c.commit();
		st.close();
		return res;
	}

	@Override
	public Boolean deleteBusinessAreaForCompany(Long businessAreaForCompany_id)
			throws ClassNotFoundException, SQLException {
		if (businessAreaForCompany_id == null)
			return false;
		String sql = "SELECT * FROM location.\"fn_deleteBusinessAreaFromCompany\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompany_id);
		Boolean rs = st.execute();
		c.commit();		
		st.close();
		c.close();
		if (rs) {
			return rs;
		} else {
			return false;
		}		
	}

	@Override
	public Boolean revokeBusinessAreaForCompany(Long businessAreaForCompany_id)
			throws ClassNotFoundException, SQLException {
		if (businessAreaForCompany_id == null)
			return false;
		String sql = "SELECT * FROM location.\"fn_revokeBusinessAreaFromCompany\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, businessAreaForCompany_id);
		Boolean rs = st.execute();
		c.commit();
		st.close();
		c.close();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

}
