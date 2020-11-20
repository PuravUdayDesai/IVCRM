package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.CompanyAreaDAOImpl;
import ivgroup.master.database.dao.impl.CompanyBranchDAOImpl;
import ivgroup.master.database.dao.impl.CompanyExecutiveDAOImpl;
import ivgroup.master.database.dao.impl.CompanyRegionDAOImpl;
import ivgroup.master.database.dto.companyRegion.CompanyRegionInsert;
import ivgroup.master.database.dto.companyRegion.CompanyRegionSelect;
import ivgroup.master.database.dto.companyRegion.CompanyRegionUpdate;

@Service
public class CompanyRegionBusinessLogic {
	
	@Autowired
	CompanyRegionDAOImpl crdi;
	
	@Autowired
	CompanyAreaDAOImpl cadi;
	
	@Autowired
	CompanyBranchDAOImpl cbdi;
	
	@Autowired
	CompanyExecutiveDAOImpl cedi;
	
	
	
	Logger logger =LoggerFactory.getLogger(CompanyRegionBusinessLogic.class);
	
	public ResponseEntity<Void> addCompanyRegion(CompanyRegionInsert cri) {
		if(cri==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			rs=crdi.addCompanyRegion(cri);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	
	public ResponseEntity<List<CompanyRegionSelect>> selectCompanyRegion() {
		List<CompanyRegionSelect> lcs=new ArrayList<CompanyRegionSelect>();
		try {
			lcs=crdi.selectCompanyRegion();
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<CompanyRegionSelect> selectCompanyRegionByCompanyRegionID(Long companyRegionId) {
		CompanyRegionSelect crs=new CompanyRegionSelect();
		if(companyRegionId==null) {
			return new ResponseEntity<CompanyRegionSelect>(crs,HttpStatus.BAD_REQUEST);
		}
		try {
			crs=crdi.selectCompanyRegionByCompanyRegionID(companyRegionId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<CompanyRegionSelect>(crs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<CompanyRegionSelect>(crs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(crs.getCompanyRegionID()==null||crs==null) {
			return new ResponseEntity<CompanyRegionSelect>(crs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CompanyRegionSelect>(crs,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyRegionSelect>> selectCompanyRegionByCompanyID(Long companyId) {
		List<CompanyRegionSelect> lcs=new ArrayList<CompanyRegionSelect>();
		if(companyId==null) {
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=crdi.selectCompanyRegionByCompanyID(companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanyRegionSelect>> selectCompanyRegionByOwnerID(Long ownerId) 
	{
		List<CompanyRegionSelect> lcs=new ArrayList<CompanyRegionSelect>();
		if(ownerId==null) {
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=crdi.selectCompanyRegionByOwnerID(ownerId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyRegionSelect>>(lcs,HttpStatus.OK);
	}
	
	private  ResponseEntity<Void> updateCompanyRegionCompanyRegionName(Connection c,Long companyRegionId, String companyRegionName) {
		if(companyRegionId==null||companyRegionName==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionCompanyRegionName(c, companyRegionId, companyRegionName);
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

	private  ResponseEntity<Void> updateCompanyRegionCompanyRegionCode(Connection c,Long companyRegionId, String companyRegionCode) {
		if(companyRegionId==null||companyRegionCode==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionCompanyRegionCode(c, companyRegionId, companyRegionCode);
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

	private  ResponseEntity<Void> updateCompanyRegionCompanyRegionDescription(Connection c,Long companyRegionId, String companyRegionDescription) {
		if(companyRegionId==null||companyRegionDescription==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionCompanyRegionDescription(c, companyRegionId, companyRegionDescription);
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

	private  ResponseEntity<Void> updateCompanyRegionCompanyID(Connection c,Long companyRegionId, Long companyID) {
		if(companyRegionId==null||companyID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionCompanyID(c, companyRegionId, companyID);
			 List<Long> companyAreaIdList=cadi.selectCompanyAreaIdByCompanyRegionId(companyRegionId);
			 Iterator<Long> iterator=companyAreaIdList.iterator();
			 while(iterator.hasNext())
			 {
				 Long companyAreaId=iterator.next();
				 List<Long> companyBranchIdList=cbdi.selectCompanyBranchIdByCompanyAreaId(companyAreaId);
				 Iterator<Long> iteratorCompanyBranch=companyBranchIdList.iterator();
				 while(iteratorCompanyBranch.hasNext())
				 {
					 Long companyBranchId=iteratorCompanyBranch.next();
					 List<Long> companyExecutiveIdList=cbdi.selectCompanyExecutiveIdByCompanyBranchId(companyBranchId);
					 Iterator<Long> iteratorCompanyExecutive=companyExecutiveIdList.iterator();
					 while(iteratorCompanyExecutive.hasNext())
					 {
						 Long companyExecutiveId=iteratorCompanyExecutive.next();
						 cedi.updateCompanyExecutiveCompanyID(c, companyExecutiveId, companyID);
					 }
					 cbdi.updateCompanyBranchCompanyID(c, companyBranchId, companyID);
				 }
				 cadi.updateCompanyAreaCompanyID(c, companyAreaId, companyID);
			 }
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

	private  ResponseEntity<Void> updateCompanyRegionIsActive(Connection c,Long companyRegionId, Boolean isActive) {
		if(companyRegionId==null||isActive==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionIsActive(c, companyRegionId, isActive);
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

	private  ResponseEntity<Void> updateCompanyRegionLastEditOn(Connection c,Long companyRegionId, Timestamp lastEditOn) {
		if(companyRegionId==null||lastEditOn==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionLastEditOn(c, companyRegionId, lastEditOn);
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

	private  ResponseEntity<Void> updateCompanyRegionLastEditBy(Connection c,Long companyRegionId, Long lastEditBy) {
		if(companyRegionId==null||lastEditBy==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionLastEditBy(c, companyRegionId, lastEditBy);
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

	private  ResponseEntity<Void> updateCompanyRegionLastEditDeviceType(Connection c,Long companyRegionId, Integer lastEditDeviceType) {
		if(companyRegionId==null||lastEditDeviceType==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=crdi.updateCompanyRegionLastEditDeviceType(c, companyRegionId, lastEditDeviceType);
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

	public  ResponseEntity<Void> updateCompanyRegion(Long companyRegionId, CompanyRegionUpdate cru) {
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
		if(cru.getCompanyRegionName()!=null) {
			rs=updateCompanyRegionCompanyRegionName(c,companyRegionId,cru.getCompanyRegionName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getCompanyRegionCode()!=null) {
			rs=updateCompanyRegionCompanyRegionCode(c,companyRegionId,cru.getCompanyRegionCode());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getCompanyRegionDescription()!=null) {
			rs=updateCompanyRegionCompanyRegionDescription(c,companyRegionId,cru.getCompanyRegionDescription());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getCompanyID()!=null) {
			rs=updateCompanyRegionCompanyID(c,companyRegionId,cru.getCompanyID());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;	
		if(cru.getIsActive()!=null) {
			rs=updateCompanyRegionIsActive(c,companyRegionId,cru.getIsActive());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getLastEditOn()!=null) {
			rs=updateCompanyRegionLastEditOn(c,companyRegionId,cru.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(cru.getLastEditBy()!=null) {
			rs=updateCompanyRegionLastEditBy(c,companyRegionId,cru.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cru.getLastEditDeviceType()!=null) {
			rs=updateCompanyRegionLastEditDeviceType(c,companyRegionId,cru.getLastEditDeviceType());
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

	public  ResponseEntity<Void> deleteCompanyRegion(Long companyRegionId)  {
		if(companyRegionId==null) {
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Long check=(long)-1;
		Boolean rs=false;
		try {
			 check=crdi.checkCompanyRegionDeleteStatus(companyRegionId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(check==0)
		{
			try {
			rs=crdi.deleteCompanyRegion(companyRegionId);
			} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		else
		{
			return new ResponseEntity<Void>(HttpStatus.FAILED_DEPENDENCY);
		}
	if(!rs)
	{
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public  ResponseEntity<Void> revokeCompanyRegion(Long companyRegionId)  {
		if(companyRegionId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	Boolean rs=false;
	try {
		rs=crdi.revokeCompanyRegion(companyRegionId);
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
