package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.CompanyBranchDAOImpl;
import ivgroup.master.database.dto.companyBranch.CompanyBranchInsert;
import ivgroup.master.database.dto.companyBranch.CompanyBranchSelect;
import ivgroup.master.database.dto.companyBranch.CompanyBranchUpdate;

@Service
public class CompanyBranchBusinessLogic {
	
	@Autowired
	CompanyBranchDAOImpl cbdi;
	
	public ResponseEntity<Void> addCompanyBranch(CompanyBranchInsert cb)  {
		if(cb==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		try {
			value=cbdi.addCompanyBranch(cb);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println("Here in CompanyBranch: "+e);
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(value.isEmpty()) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Long executiveId=null;
		Long branchId=null;
		
		for(Long key:value.keySet()) {
			executiveId=key;
			branchId=value.get(key);
		}
		Boolean rs=false;
		try {
		rs=cbdi.updateCompanyBranchCompanyBranchPrimaryContactID(ConnectionProvider.getConnection(), 
																 branchId, 
																 executiveId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(rs) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);		
	}

	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranch() 
	{
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		try {
			lcbs=cbdi.selectCompanyBranch();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcbs.isEmpty()) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.OK);
	}
	
	public ResponseEntity<CompanyBranchSelect> selectCompanyBranchByCompanyBranchID(Long companyBranchId) 
	{
		CompanyBranchSelect cbs=new CompanyBranchSelect();
		if(companyBranchId==null) {
			return new ResponseEntity<CompanyBranchSelect>(cbs,HttpStatus.BAD_REQUEST);
		}
		try {
			cbs=cbdi.selectCompanyBranchByCompanyBranchID(companyBranchId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<CompanyBranchSelect>(cbs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<CompanyBranchSelect>(cbs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(cbs.getCompanyBranchID()==null||cbs==null) {
			return new ResponseEntity<CompanyBranchSelect>(cbs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CompanyBranchSelect>(cbs,HttpStatus.OK);
	}													
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByCompanyID(Long companyId)
	{
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		if(companyId==null) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcbs=cbdi.selectCompanyBranchByCompanyID(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcbs.isEmpty()) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.OK);
	}		
	
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByOwnerID(Long ownerId) 
	{
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		if(ownerId==null) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcbs=cbdi.selectCompanyBranchByOwnerID(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcbs.isEmpty()) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByCompanyRegionID(Long companyRegionID)
	{
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		if(companyRegionID==null) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcbs=cbdi.selectCompanyBranchByCompanyRegionID(companyRegionID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcbs.isEmpty()) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.OK);
	}											
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByCompanyAreaID(Long companyAreaID)
	{
		List<CompanyBranchSelect> lcbs=new ArrayList<CompanyBranchSelect>();
		if(companyAreaID==null) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcbs=cbdi.selectCompanyBranchByCompanyAreaID(companyAreaID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcbs.isEmpty()) {
			return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchSelect>>(lcbs,HttpStatus.OK);
	}	
	
	private ResponseEntity<Void> updateCompanyBranchCompanyBranchName(Connection c, Long companyBranchId, String companyBranchName) {
	if(companyBranchId==null||companyBranchName==null) {
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	Boolean rs=false;
	try {
		 rs=cbdi.updateCompanyBranchCompanyBranchName(c, companyBranchId, companyBranchName);
	} catch (ClassNotFoundException e) {
		return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	} catch (SQLException e) {
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	if(!rs) {
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	return new ResponseEntity<Void>(HttpStatus.OK);
	
	}

	
	private ResponseEntity<Void> updateCompanyBranchCompanyBranchCode(Connection c, Long companyBranchId, String companyBranchCode) {
		if(companyBranchId==null||companyBranchCode==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchCompanyBranchCode(c, companyBranchId, companyBranchCode);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchCompanyRegionID(Connection c, Long companyBranchId, Long companyRegionID) {
		if(companyBranchId==null||companyRegionID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchCompanyRegionID(c, companyBranchId, companyRegionID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchCompanyAreaID(Connection c, Long companyBranchId, Long companyAreaID) {
		if(companyBranchId==null||companyAreaID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchCompanyAreaID(c, companyBranchId, companyAreaID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchCompanyID(Connection c, Long companyBranchId, Long companyID) {
		if(companyBranchId==null||companyID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchCompanyID(c, companyBranchId, companyID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchCompanyBranchType(Connection c, Long companyBranchId, Integer companyBranchType) {
		if(companyBranchId==null||companyBranchType==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchCompanyBranchType(c, companyBranchId, companyBranchType);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchCompanyBranchAddressID(Connection c, Long companyBranchId,Long companyBranchAddressID)  {
		if(companyBranchId==null||companyBranchAddressID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchCompanyBranchAddressID(c, companyBranchId, companyBranchAddressID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchCompanyBranchPrimaryContactID(Connection c, Long companyBranchId,Long companyBranchPrimaryContactID)  {
		if(companyBranchId==null||companyBranchPrimaryContactID==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchCompanyBranchPrimaryContactID(c, companyBranchId, companyBranchPrimaryContactID);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchIsActive(Connection c, Long companyBranchId, Boolean isActive) {
		if(companyBranchId==null||isActive==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchIsActive(c, companyBranchId, isActive);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchLastEditOn(Connection c, Long companyBranchId, Timestamp lastEditOn) {
		if(companyBranchId==null||lastEditOn==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchLastEditOn(c, companyBranchId, lastEditOn);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchLastEditBy(Connection c, Long companyBranchId, Long lastEditBy) {
		if(companyBranchId==null||lastEditBy==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchLastEditBy(c, companyBranchId, lastEditBy);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	
	private ResponseEntity<Void> updateCompanyBranchLastEditDeviceType(Connection c, Long companyBranchId, Integer lastEditDeviceType) {
		if(companyBranchId==null||lastEditDeviceType==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cbdi.updateCompanyBranchLastEditDeviceType(c, companyBranchId, lastEditDeviceType);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> updateCompanyBranch(Long companyBranchId,CompanyBranchUpdate cu) {
		if(cu==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Connection c=null;
		try {
			 c=ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs=null;
		Boolean wentIn=false;

		if(cu.getCompanyBranchName()!=null) {
			rs=updateCompanyBranchCompanyBranchName(c,companyBranchId,cu.getCompanyBranchName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getCompanyBranchCode()!=null) {
			rs=updateCompanyBranchCompanyBranchCode(c,companyBranchId,cu.getCompanyBranchCode());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getCompanyRegionId()!=null) {
			rs=updateCompanyBranchCompanyRegionID(c,companyBranchId,cu.getCompanyRegionId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
				
		if(cu.getCompanyAreaId()!=null) {
			rs=updateCompanyBranchCompanyAreaID(c,companyBranchId,cu.getCompanyAreaId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;				
				
		if(cu.getCompanyId()!=null) {
			rs=updateCompanyBranchCompanyID(c,companyBranchId,cu.getCompanyId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;					
		if(cu.getCompanyBranchType()!=null) {
			rs=updateCompanyBranchCompanyBranchType(c,companyBranchId,cu.getCompanyBranchType());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;					
		if(cu.getCompanyBranchAddress()!=null) {
			rs=updateCompanyBranchCompanyBranchAddressID(c,companyBranchId,cu.getCompanyBranchAddress());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;	
		if(cu.getCompanyBranchPrimaryContact()!=null) {
			rs=updateCompanyBranchCompanyBranchPrimaryContactID(c,companyBranchId,cu.getCompanyBranchPrimaryContact());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getIsActive()!=null) {
			rs=updateCompanyBranchIsActive(c,companyBranchId,cu.getIsActive());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getLastEditOn()!=null) {
			rs=updateCompanyBranchLastEditOn(c,companyBranchId,cu.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
				
		if(cu.getLastEditBy()!=null) {
			rs=updateCompanyBranchLastEditBy(c,companyBranchId,cu.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;			
		if(cu.getLastEditDeviceType()!=null) {
			rs=updateCompanyBranchLastEditDeviceType(c,companyBranchId,cu.getLastEditDeviceType());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;				
					
		try {
			c.close();
		}catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<Void>(HttpStatus.OK); 

	}
	
	public ResponseEntity<Void> deleteCompanyBranch(Long companyBranchId)  {
	if(companyBranchId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	Long check=(long)-1;
	Boolean rs=false;
	try {
	check=cbdi.checkCompanyBranchDeleteStatus(companyBranchId);
	} catch (ClassNotFoundException e) {
		return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	} catch (SQLException e) {
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	if(check==0)
	{
		try {
		rs=cbdi.deleteCompanyBranch(companyBranchId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
	}
	else
	{
		return new ResponseEntity<Void>(HttpStatus.FAILED_DEPENDENCY);
	}
	return new ResponseEntity<Void>(HttpStatus.OK);
	}


	public ResponseEntity<Void> revokeCompanyBranch(Long companyBranchId)  {
		if(companyBranchId==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	Boolean rs=false;
	try {
		rs=cbdi.revokeCompanyBranch(companyBranchId);
	} catch (ClassNotFoundException e) {
		return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
	} catch (SQLException e) {
		return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	if(!rs) {
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	return new ResponseEntity<Void>(HttpStatus.OK);
	}


}
