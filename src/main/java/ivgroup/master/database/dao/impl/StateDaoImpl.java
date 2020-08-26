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
import ivgroup.master.database.dao.schema.StateDao;
import ivgroup.master.database.dto.state.State;
import ivgroup.master.database.dto.state.StateInfoFromCountryId;
import ivgroup.master.database.dto.state.StateInsert;

@Service
public class StateDaoImpl implements StateDao {

	@Override
	public List<State> getAllState() {
		List<State> state_list = new ArrayList<State>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromState\"()";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return state_list;
			} else {
				do {
					state_list.add(new State(rs.getLong("StateID"), rs.getString("StateName"),
							rs.getString("StateCode"), rs.getLong("CountryID"), rs.getString("CountryName"),
							rs.getString("StateDescription"), rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"),
							rs.getLong("CreatedBy"), rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
							rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return state_list;
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
	public State getOneStateById(long state_id) {
		State state_data = null;
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectFromStateById\"(" + state_id + ")";
			st = c.prepareCall(sql);
			rs = st.executeQuery();
			if (rs.next() == true) {
				state_data = new State(rs.getLong("StateID"), rs.getString("StateName"), rs.getString("StateCode"),
						rs.getLong("CountryID"), rs.getString("CountryName"), rs.getString("StateDescription"),
						rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"), rs.getLong("CreatedBy"),
						rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"), rs.getLong("LastEditBy"),
						rs.getInt("LastEditDeviceType"));
			}
			return state_data;
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
	public List<State> searchInState(String search_content) {
		List<State> state_list = new ArrayList<State>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_searchInState\"(?)";
			st = c.prepareCall(sql);
			st.setString(1, search_content);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return state_list;
			} else {
				do {
					state_list.add(new State(rs.getLong("StateID"), rs.getString("StateName"),
							rs.getString("StateCode"), rs.getLong("CountryID"), rs.getString("CountryName"),
							rs.getString("StateDescription"), rs.getBoolean("IsActive"), rs.getTimestamp("CreatedOn"),
							rs.getLong("CreatedBy"), rs.getInt("DeviceType"), rs.getTimestamp("LastEditOn"),
							rs.getLong("LastEditBy"), rs.getInt("LastEditDeviceType")));
				} while (rs.next());
			}
			return state_list;
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
	public List<StateInfoFromCountryId> selectStateUsingCountryId(Long country_id) {
		List<StateInfoFromCountryId> state_list = new ArrayList<StateInfoFromCountryId>();
		Connection c = null;
		CallableStatement st = null;
		ResultSet rs = null;
		try {
			c = ConnectionProvider.getConnection();
			String sql = "SELECT * FROM location.\"fn_selectStateUsingCountryId\"(?)";
			st = c.prepareCall(sql);
			st.setLong(1, country_id);
			rs = st.executeQuery();
			if (rs.next() == false) {
				return state_list;
			} else {
				do {
					state_list.add(new StateInfoFromCountryId(rs.getLong("StateID"), rs.getString("StateName"),
							rs.getString("StateCode"), rs.getString("StateDescription")));
				} while (rs.next());
			}
			return state_list;
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
	public Boolean addState(StateInsert state_info) {
		if (state_info == null)
			return null;

		String sql = "SELECT location.\"fn_insertIntoState\"(?,?,?,?,?,?,?,?,?,?)";
		Connection c = null;
		CallableStatement st = null;
		try {
			c = ConnectionProvider.getConnection();
			st = c.prepareCall(sql);
			st.setLong(1, state_info.getCountryID());
			st.setString(2, state_info.getStateName());
			st.setString(3, state_info.getStateCode());
			st.setString(4, state_info.getStateDescription());
			st.setTimestamp(5, state_info.getCreatedOn());
			st.setLong(6, state_info.getCreatedBy());
			st.setInt(7, state_info.getDeviceType());
			st.setTimestamp(8, state_info.getCreatedOn());
			st.setLong(9, state_info.getCreatedBy());
			st.setInt(10, state_info.getDeviceType());

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
	public Boolean updateStateName(Connection c, Long stateId, String stateName)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateStateName\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setString(2, stateName);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateDescription(Connection c, Long stateId, String stateDescription)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateStateDescription\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setString(2, stateDescription);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateCode(Connection c, Long stateId, String stateCode)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateStateCode\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setString(2, stateCode);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateLastEditOn(Connection c, Long stateId, Timestamp stateLastEditOn)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateLastEditOn\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setTimestamp(2, stateLastEditOn);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateIsActive(Connection c, Long stateId, Boolean stateIsActive)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateIsActive\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setBoolean(2, stateIsActive);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateLastEditBy(Connection c, Long stateId, Long stateLastEditBy)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateLastEditBy\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setLong(2, stateLastEditBy);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateDeviceType(Connection c, Long stateId, int deviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setInt(2, deviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateLastEditDeviceType(Connection c, Long stateId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateLastEditDeviceType\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setInt(2, lastEditDeviceType);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean updateStateCountryId(Connection c, Long stateId, Long stateCountryId)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT location.\"fn_updateStateCountryID\"(?,?)";
		CallableStatement st = null;
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		st.setLong(2, stateCountryId);
		boolean res = st.execute();
		c.commit();
		return res;
	}

	@Override
	public Boolean deleteState(Long stateId) throws SQLException, ClassNotFoundException {
		if (stateId == null)
			return false;
		String sql = "SELECT location.\"fn_deleteState\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}

	@Override
	public Boolean revokeState(Long stateId) throws SQLException, ClassNotFoundException {
		if (stateId == null)
			return false;
		String sql = "SELECT location.\"fn_revokeState\"(?)";
		Connection c = null;
		CallableStatement st = null;
		c = ConnectionProvider.getConnection();
		st = c.prepareCall(sql);
		st.setLong(1, stateId);
		Boolean rs = st.execute();
		c.commit();
		if (rs) {
			return rs;
		} else {
			return false;
		}
	}
}
