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
import ivgroup.master.database.dao.schema.AreaDao;
import ivgroup.master.database.dto.area.Area;
import ivgroup.master.database.dto.area.AreaInfoFromCityId;
import ivgroup.master.database.dto.area.AreaInsert;
import ivgroup.master.database.dto.area.AreaUpdate;

@Component
public class AreaBusinessLogic {
	@Autowired
	AreaDao area_dao;

	public ResponseEntity<List<Area>> getAllArea() {
		List<Area> res = area_dao.getAllArea();
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<Area> getOneAreaById(long area_id) {
		Area res = area_dao.getOneAreaById(area_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<List<Area>> searchInArea(String search_content) {
		List<Area> res = area_dao.searchInArea(search_content);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<List<AreaInfoFromCityId>> selectAreaUsingCityId(Long city_id) {
		List<AreaInfoFromCityId> res = area_dao.selectAreaUsingCityId(city_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}
	
	public ResponseEntity<Void> addArea(AreaInsert area_info) {
		Boolean res = area_dao.addArea(area_info);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// UPDATE SCRIPTS FOR EACH SINGLE UPDATE STARTS FROM HERE

	private ResponseEntity<Void> updateAreaAreaName(Connection c, Long areaId, String areaName) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaName(c, areaId, areaName);
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

	private ResponseEntity<Void> updateAreaAreaCode(Connection c, Long areaId, String areaCode) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaCode(c, areaId, areaCode);
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

	private ResponseEntity<Void> updateAreaAreaDescription(Connection c, Long areaId,
			String areaDescription) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaDescription(c, areaId, areaDescription);
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

	private ResponseEntity<Void> updateAreaLastEditOn(Connection c, Long areaId, Timestamp areaLastEditOn) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaLastEditOn(c, areaId, areaLastEditOn);
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

	private ResponseEntity<Void> updateAreaIsActive(Connection c, Long areaId, Boolean areaIsActive) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaIsActive(c, areaId, areaIsActive);
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

	private ResponseEntity<Void> updateAreaLastEditBy(Connection c, Long areaId, long areaLastEditBy) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaLastEditBy(c, areaId, areaLastEditBy);
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

	private ResponseEntity<Void> updateAreaDeviceType(Connection c, Long areaId, int areaDeviceType) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaDeviceType(c, areaId, areaDeviceType);
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

	private ResponseEntity<Void> updateAreaLastEditDeviceType(Connection c, Long areaId,
			int areaLastEditDeviceType) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaLastEditDeviceType(c, areaId, areaLastEditDeviceType);
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
	 
	private ResponseEntity<Void> updateAreaCountryId(Connection c, Long areaId, Long areaCountryId) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaCountryId(c, areaId, areaCountryId);
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
	
	private ResponseEntity<Void> updateAreaStateId(Connection c, Long areaId, Long areaStateId) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaStateId(c, areaId, areaStateId);
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

	private ResponseEntity<Void> updateAreaCityId(Connection c, Long areaId, Long areaCityId) {
		Boolean rs = false;
		try {
			rs = area_dao.updateAreaCityId(c, areaId, areaCityId);
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

	public ResponseEntity<Void> updateArea(Long areaId, AreaUpdate area_info) {
		if (area_info == null) {
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

		if (area_info.getBusinessAreaName() != null) {
			rs = updateAreaAreaName(c, areaId, area_info.getBusinessAreaName());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getBusinessAreaCode() != null) {
			rs = updateAreaAreaCode(c, areaId, area_info.getBusinessAreaCode());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getBusinessAreaDescription() != null) {
			rs = updateAreaAreaDescription(c, areaId, area_info.getBusinessAreaDescription());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getLastEditOn() != null) {
			rs = updateAreaLastEditOn(c, areaId, area_info.getLastEditOn());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getIsActive() != null) {
			rs = updateAreaIsActive(c, areaId, area_info.getIsActive());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getLastEditBy() != null) {
			rs = updateAreaLastEditBy(c, areaId, area_info.getLastEditBy());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getDeviceType() != null) {
			rs = updateAreaDeviceType(c, areaId, area_info.getDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getLastEditDeviceType() != null) {
			rs = updateAreaLastEditDeviceType(c, areaId, area_info.getLastEditDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getCountryID() != null) {
			rs = updateAreaCountryId(c, areaId, area_info.getCountryID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (area_info.getStateID() != null) {
			rs = updateAreaStateId(c, areaId, area_info.getStateID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (area_info.getCityID() != null) {
			rs = updateAreaCityId(c, areaId, area_info.getCityID());
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

	public ResponseEntity<Void> deleteArea(Long area_id) {
		Boolean res;
		try {
			res = area_dao.deleteArea(area_id);
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

	public ResponseEntity<Void> revokeArea(Long area_id) {
		Boolean res;
		try {
			res = area_dao.revokeArea(area_id);
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
