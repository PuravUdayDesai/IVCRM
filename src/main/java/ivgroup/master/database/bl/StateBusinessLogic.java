package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.StateDao;
import ivgroup.master.database.dto.state.State;
import ivgroup.master.database.dto.state.StateInfoFromCountryId;
import ivgroup.master.database.dto.state.StateInsert;
import ivgroup.master.database.dto.state.StateUpdate;

@Component
public class StateBusinessLogic {
	@Autowired
	StateDao state_dao;

	public ResponseEntity<List<State>> getAllState() {
		List<State> res = state_dao.getAllState();
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<State> getOneStateById(long state_id) {
		State res = state_dao.getOneStateById(state_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<List<State>> searchInState(String search_content) {
		List<State> res = state_dao.searchInState(search_content);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}
	
	public ResponseEntity<List<StateInfoFromCountryId>> selectStateUsingCountryId(Long country_id) {
		List<StateInfoFromCountryId> res = state_dao.selectStateUsingCountryId(country_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<Void> addState(StateInsert state_info) {
		Boolean res = state_dao.addState(state_info);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// UPDATE SCRIPTS FOR EACH SINGLE UPDATE STARTS FROM HERE

	private ResponseEntity<Void> updateStateStateName(Connection c, Long stateId, String stateName) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateName(c, stateId, stateName);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStateStateCode(Connection c, Long stateId, String stateCode) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateCode(c, stateId, stateCode);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStateStateDescription(Connection c, Long stateId,
			String stateDescription) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateDescription(c, stateId, stateDescription);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStateLastEditOn(Connection c, Long stateId, Timestamp stateLastEditOn) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateLastEditOn(c, stateId, stateLastEditOn);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStateIsActive(Connection c, Long stateId, Boolean stateIsActive) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateIsActive(c, stateId, stateIsActive);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStateLastEditBy(Connection c, Long stateId, long stateLastEditBy) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateLastEditBy(c, stateId, stateLastEditBy);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStateDeviceType(Connection c, Long stateId, int stateDeviceType) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateDeviceType(c, stateId, stateDeviceType);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateStateLastEditDeviceType(Connection c, Long stateId,
			int stateLastEditDeviceType) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateLastEditDeviceType(c, stateId, stateLastEditDeviceType);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private ResponseEntity<Void> updateStateCountryId(Connection c, Long stateId, Long stateCountryId) {
		Boolean rs = false;
		try {
			rs = state_dao.updateStateCountryId(c, stateId, stateCountryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// ENDS HERE

	public ResponseEntity<Void> updateState(Long stateId, StateUpdate state_info) {
		if (state_info == null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Connection c = null;
		try {
			c = ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs = null;
		Boolean wentIn = false;

		if (state_info.getStateName() != null) {
			rs = updateStateStateName(c, stateId, state_info.getStateName());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getStateCode() != null) {
			rs = updateStateStateCode(c, stateId, state_info.getStateCode());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getStateDescription() != null) {
			rs = updateStateStateDescription(c, stateId, state_info.getStateDescription());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getLastEditOn() != null) {
			rs = updateStateLastEditOn(c, stateId, state_info.getLastEditOn());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getIsActive() != null) {
			rs = updateStateIsActive(c, stateId, state_info.getIsActive());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getLastEditBy() != null) {
			rs = updateStateLastEditBy(c, stateId, state_info.getLastEditBy());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getDeviceType() != null) {
			rs = updateStateDeviceType(c, stateId, state_info.getDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getLastEditDeviceType() != null) {
			rs = updateStateLastEditDeviceType(c, stateId, state_info.getLastEditDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (state_info.getCountryID() != null) {
			rs = updateStateCountryId(c, stateId, state_info.getCountryID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		try {
			c.close();
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> deleteState(Long state_id) {
		Boolean res;
		try {
			res = state_dao.deleteState(state_id);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}

	public ResponseEntity<Void> revokeState(Long state_id) {
		Boolean res;
		try {
			res = state_dao.revokeState(state_id);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}
}
