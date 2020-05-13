package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.state.State;
import ivgroup.master.database.dto.state.StateInfoFromCountryId;
import ivgroup.master.database.dto.state.StateInsert;


public interface StateDao {

	public List<State> getAllState();

	public State getOneStateById(long state_id);

	public List<State> searchInState(String search_content);
	
	public List<StateInfoFromCountryId> selectStateUsingCountryId(Long country_id);

	public Boolean addState(StateInsert state_info);

	public Boolean updateStateName(Connection c, Long stateId, String stateName)
			throws SQLException, ClassNotFoundException;

	public Boolean updateStateDescription(Connection c, Long stateId, String stateDescription)
			throws SQLException, ClassNotFoundException;

	public Boolean updateStateCode(Connection c, Long stateId, String stateCode)
			throws SQLException, ClassNotFoundException;

	public Boolean updateStateLastEditOn(Connection c, Long stateId, Timestamp stateLastEditOn)
			throws SQLException, ClassNotFoundException;

	public Boolean updateStateIsActive(Connection c, Long stateId, Boolean stateIsActive)
			throws SQLException, ClassNotFoundException;

	public Boolean updateStateLastEditBy(Connection c, Long stateId, Long stateLastEditBy)
			throws SQLException, ClassNotFoundException;

	public Boolean updateStateDeviceType(Connection c, Long stateId, int deviceType)
			throws SQLException, ClassNotFoundException;

	public Boolean updateStateLastEditDeviceType(Connection c, Long stateId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateStateCountryId(Connection c, Long stateId, Long stateCountryId)
			throws SQLException, ClassNotFoundException;

	public Boolean deleteState(Long stateId) throws SQLException, ClassNotFoundException;

	public Boolean revokeState(Long stateId) throws SQLException, ClassNotFoundException;

}
