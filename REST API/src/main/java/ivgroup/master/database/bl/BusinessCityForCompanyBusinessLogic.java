package ivgroup.master.database.bl;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.BusinessAreaForCompanyDaoImpl;
import ivgroup.master.database.dao.schema.BusinessCityForCompanyDao;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompany;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyByStateID;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyInsert;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyUpdate;

@Service
public class BusinessCityForCompanyBusinessLogic {
	
	@Autowired
	BusinessCityForCompanyDao businessCityForCompany_dao;
	
	@Autowired
	BusinessAreaForCompanyDaoImpl businessAreaForCompanyDaoImpl;
	
	Logger logger =LoggerFactory.getLogger(BusinessCityForCompanyBusinessLogic.class);
	/*
	public ResponseEntity<List<BusinessCityForCompany>> getAllBusinessCityForCompany() {
		List<BusinessCityForCompany> res = businessCityForCompany_dao.getAllBusinessCityForCompany();
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<BusinessCityForCompany> getOneBusinessCityForCompanyById(long businessCityForCompany_id) {
		BusinessCityForCompany res = businessCityForCompany_dao.getOneBusinessCityForCompanyById(businessCityForCompany_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}
	*/
	
	public ResponseEntity<List<BusinessCityForCompany>> getBusinessCityForCompanyInfoByCompanyId(long companyId) {
		List<BusinessCityForCompany> res = businessCityForCompany_dao.getBusinessCityForCompanyInfoByCompanyId(companyId);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	/*
	public ResponseEntity<List<BusinessCityForCompany>> searchInBusinessCityForCompany(String search_content) {
		List<BusinessCityForCompany> res = businessCityForCompany_dao.searchInBusinessCityForCompany(search_content);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}
	*/
	
	public ResponseEntity<List<BusinessCityForCompanyByStateID>> selectBusinessCityUsingStateId(Long state_id, Long owner_id) {
		List<BusinessCityForCompanyByStateID> res = businessCityForCompany_dao.selectBusinessCityUsingStateId(state_id,owner_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<Void> addBusinessCityForCompany(BusinessCityForCompanyInsert businessCityForCompany_info) {
		Boolean res = businessCityForCompany_dao.addBusinessCityForCompany(businessCityForCompany_info);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);			
		else
			return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// UPDATE SCRIPTS FOR EACH SINGLE UPDATE STARTS FROM HERE
	
	private ResponseEntity<Void> updateBusinessCityForCompanyCompanyId(Connection c, Long businessCityForCompanyId, Long companyId) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateBusinessCityForCompanyCompanyId(c, businessCityForCompanyId, companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateBusinessCityForCompanyLastEditOn(Connection c, Long businessCityForCompanyId, Timestamp businessCityForCompanyLastEditOn) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateBusinessCityForCompanyLastEditOn(c, businessCityForCompanyId, businessCityForCompanyLastEditOn);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCityCityName(Connection c, Long cityId, String cityName) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateCityName(c, cityId, cityName);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCityCityCode(Connection c, Long cityId, String cityCode) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateCityCode(c, cityId, cityCode);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCityCityDescription(Connection c, Long cityId,
			String cityDescription) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateCityDescription(c, cityId, cityDescription);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCityStateID(Connection c, Long cityID,
			Long stateID) {
		Boolean rs = false;
		if(cityID==null||stateID==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try {
			rs = businessCityForCompany_dao.updateCityStateID(c, cityID, stateID);
			List<Long> businessAreaForCompanyIdList=businessCityForCompany_dao.selectBusinessAreaIdByBusinessCityId(cityID);
			Iterator<Long> listIterator=businessAreaForCompanyIdList.iterator();
			Boolean finalResult=true;
			while(listIterator.hasNext())
			{
				Boolean result=businessAreaForCompanyDaoImpl.updateAreaStateID(c, listIterator.next(), stateID);
				if(result==false)
				{
					finalResult=result;
				}
			}
			rs=rs&&finalResult;
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private ResponseEntity<Void> updateCityCountryID(Connection c, Long cityID,
			Long countryID) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateCityCountryID(c, cityID, countryID);
			List<Long> businessAreaForCompanyIdList=businessCityForCompany_dao.selectBusinessAreaIdByBusinessCityId(cityID);
			Iterator<Long> listIterator=businessAreaForCompanyIdList.iterator();
			Boolean finalResult=true;
			while(listIterator.hasNext())
			{
				Boolean result=businessAreaForCompanyDaoImpl.updateAreaCountryID(c, listIterator.next(), countryID);
				if(result==false)
				{
					finalResult=result;
				}
			}
			rs=rs&&finalResult;
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private ResponseEntity<Void> updateBusinessCityForCompanyIsActive(Connection c, Long businessCityForCompanyId, Boolean businessCityForCompanyIsActive) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateBusinessCityForCompanyIsActive(c, businessCityForCompanyId, businessCityForCompanyIsActive);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateBusinessCityForCompanyLastEditBy(Connection c, Long businessCityForCompanyId, long businessCityForCompanyLastEditBy) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateBusinessCityForCompanyLastEditBy(c, businessCityForCompanyId, businessCityForCompanyLastEditBy);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateBusinessCityForCompanyDeviceType(Connection c, Long businessCityForCompanyId, int businessCityForCompanyDeviceType) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateBusinessCityForCompanyDeviceType(c, businessCityForCompanyId, businessCityForCompanyDeviceType);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateBusinessCityForCompanyLastEditDeviceType(Connection c, Long businessCityForCompanyId,
			int businessCityForCompanyLastEditDeviceType) {
		Boolean rs = false;
		try {
			rs = businessCityForCompany_dao.updateBusinessCityForCompanyLastEditDeviceType(c, businessCityForCompanyId, businessCityForCompanyLastEditDeviceType);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// ENDS HERE

	public ResponseEntity<Void> updateBusinessCityForCompany(Long businessCityForCompanyId, BusinessCityForCompanyUpdate businessCityForCompany_info) {
		if (businessCityForCompany_info == null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Connection c = null;
		try {
			c = ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs = null;
		Boolean wentIn = false;
		
		if (businessCityForCompany_info.getCountryID() != null) {
			rs = updateCityCountryID(c, businessCityForCompanyId, businessCityForCompany_info.getCountryID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessCityForCompany_info.getStateID() != null) {
			rs = updateCityStateID(c, businessCityForCompanyId, businessCityForCompany_info.getStateID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessCityForCompany_info.getCityName() != null) {
			rs = updateCityCityName(c, businessCityForCompanyId, businessCityForCompany_info.getCityName());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessCityForCompany_info.getCityCode() != null) {
			rs = updateCityCityCode(c, businessCityForCompanyId, businessCityForCompany_info.getCityCode());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessCityForCompany_info.getCityDescription() != null) {
			rs = updateCityCityDescription(c, businessCityForCompanyId, businessCityForCompany_info.getCityDescription());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;
		
		if (businessCityForCompany_info.getCompanyID() != null) {
			rs = updateBusinessCityForCompanyCompanyId(c, businessCityForCompanyId, businessCityForCompany_info.getCompanyID());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessCityForCompany_info.getLastEditOn() != null) {
			rs = updateBusinessCityForCompanyLastEditOn(c, businessCityForCompanyId, businessCityForCompany_info.getLastEditOn());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessCityForCompany_info.getIsActive() != null) {
			rs = updateBusinessCityForCompanyIsActive(c, businessCityForCompanyId, businessCityForCompany_info.getIsActive());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessCityForCompany_info.getLastEditBy() != null) {
			rs = updateBusinessCityForCompanyLastEditBy(c, businessCityForCompanyId, businessCityForCompany_info.getLastEditBy());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessCityForCompany_info.getDeviceType() != null) {
			rs = updateBusinessCityForCompanyDeviceType(c, businessCityForCompanyId, businessCityForCompany_info.getDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (businessCityForCompany_info.getLastEditDeviceType() != null) {
			rs = updateBusinessCityForCompanyLastEditDeviceType(c, businessCityForCompanyId, businessCityForCompany_info.getLastEditDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		try {
			c.close();
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> deleteBusinessCityForCompany(Long businessCityForCompany_id) {
		Boolean res;
		try {
			res = businessCityForCompany_dao.deleteBusinessCityForCompany(businessCityForCompany_id);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}

	public ResponseEntity<Void> revokeBusinessCityForCompany(Long businessCityForCompany_id) {
		Boolean res;
		try {
			res = businessCityForCompany_dao.revokeBusinessCityForCompany(businessCityForCompany_id);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}

}
