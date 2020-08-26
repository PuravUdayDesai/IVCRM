package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.CompanyAreaDAOImpl;
import ivgroup.master.database.dto.companyArea.CompanyAreaInsert;
import ivgroup.master.database.dto.companyArea.CompanyAreaSelect;
import ivgroup.master.database.dto.companyArea.CompanyAreaUpdate;

@Service
public class CompanyAreaBusinessLogic {
	
	@Autowired
	CompanyAreaDAOImpl crdi;
	
	Logger logger =LoggerFactory.getLogger(CompanyAreaBusinessLogic.class);
	
	public ResponseEntity<Void> addCompanyArea(CompanyAreaInsert cri) {
		if(cri==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.addCompanyArea(cri);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			;
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyArea()
	{
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		try {
			lcs=crdi.selectCompanyArea();
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.OK);
	}
	
	
	public ResponseEntity<CompanyAreaSelect> selectCompanyAreaByCompanyAreaID(Long companyAreaId)
	{
		CompanyAreaSelect crs=new CompanyAreaSelect();
		if(companyAreaId==null) {
			return new ResponseEntity<CompanyAreaSelect>(crs,HttpStatus.BAD_REQUEST);
		}
		try {
			crs=crdi.selectCompanyAreaByCompanyAreaID(companyAreaId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<CompanyAreaSelect>(crs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<CompanyAreaSelect>(crs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(crs.getCompanyAreaID()==null||crs==null) {
			return new ResponseEntity<CompanyAreaSelect>(crs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CompanyAreaSelect>(crs,HttpStatus.OK);
	}
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyAreaByCompanyID(Long companyId)
	{
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		if(companyId==null) {
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=crdi.selectCompanyAreaByCompanyID(companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyAreaByOwnerID(Long ownerId) 
	{
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		if(ownerId==null) {
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=crdi.selectCompanyAreaByOwnerID(ownerId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyAreaByRegionID(Long regionId)
	{
		List<CompanyAreaSelect> lcs=new ArrayList<CompanyAreaSelect>();
		if(regionId==null) {
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=crdi.selectCompanyAreaByRegionID(regionId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyAreaSelect>>(lcs,HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaCompanyAreaName(Connection c,Long companyAreaId, String companyAreaName) {
		if(companyAreaId==null||companyAreaName==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaCompanyAreaName(c, companyAreaId, companyAreaName);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaCompanyAreaCode(Connection c,Long companyAreaId, String companyAreaCode) {
		if(companyAreaId==null||companyAreaCode==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaCompanyAreaCode(c, companyAreaId, companyAreaCode);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaCompanyAreaDescription(Connection c,Long companyAreaId, String companyAreaDescription) {
		if(companyAreaId==null||companyAreaDescription==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaCompanyAreaDescription(c, companyAreaId, companyAreaDescription);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaCompanyID(Connection c,Long companyAreaId, Long companyID) {
		if(companyAreaId==null||companyID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaCompanyID(c, companyAreaId, companyID);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaCompanyRegionID(Connection c,Long companyAreaId, Long companyRegionID) {
		if(companyAreaId==null||companyRegionID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaCompanyRegionID(c, companyAreaId, companyRegionID);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private  ResponseEntity<Void> updateCompanyAreaIsActive(Connection c,Long companyAreaId, Boolean isActive) {
		if(companyAreaId==null||isActive==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaIsActive(c, companyAreaId, isActive);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaLastEditOn(Connection c,Long companyAreaId, Timestamp lastEditOn) {
		if(companyAreaId==null||lastEditOn==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaLastEditOn(c, companyAreaId, lastEditOn);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaLastEditBy(Connection c,Long companyAreaId, Long lastEditBy) {
		if(companyAreaId==null||lastEditBy==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaLastEditBy(c, companyAreaId, lastEditBy);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private  ResponseEntity<Void> updateCompanyAreaLastEditDeviceType(Connection c,Long companyAreaId, Integer lastEditDeviceType) {
		if(companyAreaId==null||lastEditDeviceType==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyAreaLastEditDeviceType(c, companyAreaId, lastEditDeviceType);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public  ResponseEntity<Void> updateCompanyArea(Long companyAreaId, CompanyAreaUpdate cru) {
		if(cru==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Connection c=null;
		try {
			 c=ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs=null;
		Boolean wentIn=false;
		if(cru.getCompanyAreaName()!=null) {
			rs=updateCompanyAreaCompanyAreaName(c,companyAreaId,cru.getCompanyAreaName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getCompanyAreaCode()!=null) {
			rs=updateCompanyAreaCompanyAreaCode(c,companyAreaId,cru.getCompanyAreaCode());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getCompanyAreaDescription()!=null) {
			rs=updateCompanyAreaCompanyAreaDescription(c,companyAreaId,cru.getCompanyAreaDescription());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getCompanyID()!=null) {
			rs=updateCompanyAreaCompanyID(c,companyAreaId,cru.getCompanyID());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;	
		if(cru.getCompanyRegionID()!=null) {
			rs=updateCompanyAreaCompanyRegionID(c,companyAreaId,cru.getCompanyRegionID());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getIsActive()!=null) {
			rs=updateCompanyAreaIsActive(c,companyAreaId,cru.getIsActive());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getLastEditOn()!=null) {
			rs=updateCompanyAreaLastEditOn(c,companyAreaId,cru.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(cru.getLastEditBy()!=null) {
			rs=updateCompanyAreaLastEditBy(c,companyAreaId,cru.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getLastEditDeviceType()!=null) {
			rs=updateCompanyAreaLastEditDeviceType(c,companyAreaId,cru.getLastEditDeviceType());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		try {
			c.close();
		}catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Void>(HttpStatus.OK); 
	}

	public  ResponseEntity<Void> deleteCompanyArea(Long companyAreaId)  {
		if(companyAreaId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=crdi.deleteCompanyArea(companyAreaId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public  ResponseEntity<Void> revokeCompanyArea(Long companyAreaId)  {
		if(companyAreaId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	Boolean rs=false;
	try {
		rs=crdi.revokeCompanyArea(companyAreaId);
	} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
		return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	if(!rs) {
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
