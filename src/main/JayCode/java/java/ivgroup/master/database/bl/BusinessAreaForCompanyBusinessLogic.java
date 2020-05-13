package ivgroup.master.database.bl;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.BusinessAreaForCompanyDao;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompany;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyByCityID;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyInsert;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyUpdate;

@Service
public class BusinessAreaForCompanyBusinessLogic {
	@Autowired
	BusinessAreaForCompanyDao businessAreaForCompany_dao;

	/*
	public ResponseEntity<List<BusinessAreaForCompany>> getAllBusinessAreaForCompany() {
		List<BusinessAreaForCompany> res = businessAreaForCompany_dao.getAllBusinessAreaForCompany();
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}
	*/
	/*
	public ResponseEntity<BusinessAreaForCompany> getBusinessAreaForCompanyByAreaId(long Area_id) {
		BusinessAreaForCompany res = businessAreaForCompany_dao.getBusinessAreaForCompanyByAreaId(Area_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}
	*/

	public ResponseEntity<List<BusinessAreaForCompany>> getOneBusinessAreaForCompanyById(long businessAreaForCompany_id) {
		List<BusinessAreaForCompany> res = businessAreaForCompany_dao.getOneBusinessAreaForCompanyById(businessAreaForCompany_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	/*
	public ResponseEntity<List<BusinessAreaForCompany>> searchInBusinessAreaForCompany(String search_content) {
		List<BusinessAreaForCompany> res = businessAreaForCompany_dao.searchInBusinessAreaForCompany(search_content);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}*/
	
	public ResponseEntity<List<BusinessAreaForCompanyByCityID>> selectBusinessAreaUsingCityId(Long city_id, Long owner_id) {
		List<BusinessAreaForCompanyByCityID> res = businessAreaForCompany_dao.selectBusinessAreaUsingCityId(city_id,owner_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<Void> addBusinessAreaForCompany(BusinessAreaForCompanyInsert businessAreaForCompany_info) {
		Boolean res = businessAreaForCompany_dao.addBusinessAreaForCompany(businessAreaForCompany_info);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);			
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		else
			return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// UPDATE SCRIPTS FOR EACH SINGLE UPDATE STARTS FROM HERE
	
	private ResponseEntity<Void> updateAreaAreaName(Connection c, Long businessAreaForCompanyId, String areaName) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateAreaName(c, businessAreaForCompanyId, areaName);
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

	private ResponseEntity<Void> updateAreaAreaCode(Connection c, Long businessAreaForCompanyId ,String areaCode) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateAreaCode(c, businessAreaForCompanyId, areaCode);
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

	private ResponseEntity<Void> updateAreaAreaDescription(Connection c, Long businessAreaForCompanyId,
			String areaDescription) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateAreaDescription(c, businessAreaForCompanyId ,areaDescription);
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
	
	private ResponseEntity<Void> updateAreaCityID(Connection c, Long businessAreaForCompanyId,
			Long cityID) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateAreaCityID(c, businessAreaForCompanyId ,cityID);
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
	
	private ResponseEntity<Void> updateAreaStateID(Connection c, Long businessAreaForCompanyId,
			Long stateID) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateAreaStateID(c, businessAreaForCompanyId ,stateID);
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
	
	private ResponseEntity<Void> updateAreaCountryID(Connection c, Long businessAreaForCompanyId,
			Long countryID) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateAreaCountryID(c, businessAreaForCompanyId, countryID);
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
	
	private ResponseEntity<Void> updateBusinessAreaForCompanyCompanyId(Connection c, Long businessAreaForCompanyId, Long companyId) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateBusinessAreaForCompanyCompanyId(c, businessAreaForCompanyId, companyId);
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

	private ResponseEntity<Void> updateBusinessAreaForCompanyLastEditOn(Connection c, Long businessAreaForCompanyId, Timestamp businessAreaForCompanyLastEditOn) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateBusinessAreaForCompanyLastEditOn(c, businessAreaForCompanyId, businessAreaForCompanyLastEditOn);
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

	private ResponseEntity<Void> updateBusinessAreaForCompanyIsActive(Connection c, Long businessAreaForCompanyId, Boolean businessAreaForCompanyIsActive) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateBusinessAreaForCompanyIsActive(c, businessAreaForCompanyId, businessAreaForCompanyIsActive);
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

	private ResponseEntity<Void> updateBusinessAreaForCompanyLastEditBy(Connection c, Long businessAreaForCompanyId, long businessAreaForCompanyLastEditBy) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateBusinessAreaForCompanyLastEditBy(c, businessAreaForCompanyId, businessAreaForCompanyLastEditBy);
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

	private ResponseEntity<Void> updateBusinessAreaForCompanyDeviceType(Connection c, Long businessAreaForCompanyId, int businessAreaForCompanyDeviceType) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateBusinessAreaForCompanyDeviceType(c, businessAreaForCompanyId, businessAreaForCompanyDeviceType);
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

	private ResponseEntity<Void> updateBusinessAreaForCompanyLastEditDeviceType(Connection c, Long businessAreaForCompanyId,
			int businessAreaForCompanyLastEditDeviceType) {
		Boolean rs = false;
		try {
			rs = businessAreaForCompany_dao.updateBusinessAreaForCompanyLastEditDeviceType(c, businessAreaForCompanyId, businessAreaForCompanyLastEditDeviceType);
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

	public ResponseEntity<Void> updateBusinessAreaForCompany(Long businessAreaForCompanyId, BusinessAreaForCompanyUpdate businessAreaForCompany_info) {
		if (businessAreaForCompany_info == null) {
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
		
		
		
		if (businessAreaForCompany_info.getAreaName() != null) {
			rs = updateAreaAreaName(c, businessAreaForCompanyId, businessAreaForCompany_info.getAreaName());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessAreaForCompany_info.getAreaCode() != null) {
			rs = updateAreaAreaCode(c, businessAreaForCompanyId, businessAreaForCompany_info.getAreaCode());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessAreaForCompany_info.getAreaDescription() != null) {
			rs = updateAreaAreaDescription(c, businessAreaForCompanyId, businessAreaForCompany_info.getAreaDescription());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessAreaForCompany_info.getCityID() != null) {
			rs = updateAreaCityID(c, businessAreaForCompanyId, businessAreaForCompany_info.getCityID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessAreaForCompany_info.getStateID() != null) {
			rs = updateAreaStateID(c, businessAreaForCompanyId, businessAreaForCompany_info.getStateID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessAreaForCompany_info.getCountryID() != null) {
			rs = updateAreaCountryID(c, businessAreaForCompanyId, businessAreaForCompany_info.getCountryID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessAreaForCompany_info.getCompanyID() != null) {
			rs = updateBusinessAreaForCompanyCompanyId(c, businessAreaForCompanyId, businessAreaForCompany_info.getCompanyID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessAreaForCompany_info.getLastEditOn() != null) {
			rs = updateBusinessAreaForCompanyLastEditOn(c, businessAreaForCompanyId, businessAreaForCompany_info.getLastEditOn());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessAreaForCompany_info.getIsActive() != null) {
			rs = updateBusinessAreaForCompanyIsActive(c, businessAreaForCompanyId, businessAreaForCompany_info.getIsActive());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessAreaForCompany_info.getLastEditBy() != null) {
			rs = updateBusinessAreaForCompanyLastEditBy(c, businessAreaForCompanyId, businessAreaForCompany_info.getLastEditBy());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessAreaForCompany_info.getDeviceType() != null) {
			rs = updateBusinessAreaForCompanyDeviceType(c, businessAreaForCompanyId, businessAreaForCompany_info.getDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessAreaForCompany_info.getLastEditDeviceType() != null) {
			rs = updateBusinessAreaForCompanyLastEditDeviceType(c, businessAreaForCompanyId, businessAreaForCompany_info.getLastEditDeviceType());
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

	public ResponseEntity<Void> deleteBusinessAreaForCompany(Long businessAreaForCompany_id) {
		Boolean res;
		try {
			res = businessAreaForCompany_dao.deleteBusinessAreaForCompany(businessAreaForCompany_id);
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

	public ResponseEntity<Void> revokeBusinessAreaForCompany(Long businessAreaForCompany_id) {
		Boolean res;
		try {
			res = businessAreaForCompany_dao.revokeBusinessAreaForCompany(businessAreaForCompany_id);
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


