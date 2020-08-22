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
import ivgroup.master.database.dao.impl.CompanyAddressDetailsDAOImpl;
import ivgroup.master.database.dao.impl.CompanyBranchDAOImpl;
import ivgroup.master.database.dao.impl.CompanyDAOImpl;
import ivgroup.master.database.dto.company.CompanyInsert;
import ivgroup.master.database.dto.company.CompanyInsertWithCompanyBranchType;
import ivgroup.master.database.dto.company.CompanyInsertWithExecutivePosition;
import ivgroup.master.database.dto.company.CompanyInsetWithCompanyBranchTypeAndExecutivePosition;
import ivgroup.master.database.dto.company.CompanySelect;
import ivgroup.master.database.dto.company.CompanyUpdate;

@Service
public class CompanyBusinessLogic {

	@Autowired
	CompanyDAOImpl cdi;
	
	@Autowired
	CompanyBranchDAOImpl cbdi;

	@Autowired
	CompanyAddressDetailsDAOImpl cadi;
	
	public ResponseEntity<Void> deleteCompany(Long companyId)
	{
		Long check;
		try 
		{
			check = cdi.checkCompanyDeleteStatus(companyId);
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		Boolean rsMain=false;
		if(check==0) 
		{
			Long companyAddressId=(long)-1;
			try
			{
			 companyAddressId=cdi.deleteCompany(companyId);
			} 
			catch (ClassNotFoundException e)
			{
				e.printStackTrace();
				return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if(companyAddressId!=0)
			{
				try 
				{
				rsMain=cadi.deleteCompanyAddressDetails(companyAddressId);
				}
				catch (ClassNotFoundException e)
				{
					e.printStackTrace();
					return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
				} 
				catch (SQLException e) 
				{
					e.printStackTrace();
					return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
				}
			}
			else 
			{
				return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
			}
			
		}
		else 
		{
			return new ResponseEntity<Void>(HttpStatus.FAILED_DEPENDENCY);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	public ResponseEntity<Void> addCompany(CompanyInsert ci){
		if(ci==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		try {
			value=cdi.addCompany(ci);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
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
		rs=cbdi.updateCompanyBranchCompanyBranchPrimaryContactID(	ConnectionProvider.getConnection(), 
																branchId, 
																executiveId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(rs) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		
	}
	
	public ResponseEntity<Void> addCompanyWithCompanyBranchType(CompanyInsertWithCompanyBranchType ci)
	{
		if(ci==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		try {
			value=cdi.addCompanyWithCompanyBranchType(ci);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
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
		rs=cbdi.updateCompanyBranchCompanyBranchPrimaryContactID(	ConnectionProvider.getConnection(), 
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
	
	public ResponseEntity<Void> addCompanyWithCompanyBranchTypeAndPosition(CompanyInsetWithCompanyBranchTypeAndExecutivePosition ci)
	{
		if(ci==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		try {
			value=cdi.addCompanyWithCompanyBranchTypeAndPosition(ci);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
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
		rs=cbdi.updateCompanyBranchCompanyBranchPrimaryContactID(	ConnectionProvider.getConnection(), 
																	branchId, 
																	executiveId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(rs) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	
	public ResponseEntity<Void> addCompanyWithExecutivePosition(CompanyInsertWithExecutivePosition ci)
	{
		if(ci==null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		HashMap<Long,Long> value=new HashMap<Long,Long>();
		try {
			value=cdi.addCompanyWithExecutivePosition(ci);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
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
		rs=cbdi.updateCompanyBranchCompanyBranchPrimaryContactID(	ConnectionProvider.getConnection(), 
																	branchId, 
																	executiveId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(rs) {
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}

	
	public ResponseEntity<List<CompanySelect>> selectCompany(){
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		try {
			lcs=cdi.selectCompany();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.OK);
		
	}

	public ResponseEntity<CompanySelect> selectCompanyByCompanyId(Long companyId) {
		CompanySelect cs=new CompanySelect();
		if(companyId==null) {
			return new ResponseEntity<CompanySelect>(cs,HttpStatus.BAD_REQUEST);
		}
		try {
			cs=cdi.selectCompanyByCompanyId(companyId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return new ResponseEntity<CompanySelect>(cs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<CompanySelect>(cs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(cs.getCompanyId()==null||cs==null) {
			return new ResponseEntity<CompanySelect>(cs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CompanySelect>(cs,HttpStatus.OK);
		
	}

	public ResponseEntity<List<CompanySelect>> selectCompanyByOwnerId(Long ownerId)
	{
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		if(ownerId==null) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=cdi.selectCompanyByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanySelect>> selectCompanyByCountryId(Long countryId) {
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		if(countryId==null) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=cdi.selectCompanyByCountryId(countryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.OK);
		
	}

	public ResponseEntity<List<CompanySelect>> selectCompanyByStateId(Long countryId, Long stateId){
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		if(countryId==null||stateId==null) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=cdi.selectCompanyByStateId(countryId,stateId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanySelect>> selectCompanyByCityId(Long countryId, Long stateId, Long cityId) {
		List<CompanySelect> lcs=new ArrayList<CompanySelect>();
		if(countryId==null||stateId==null||cityId==null) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=cdi.selectCompanyByCityId(countryId,stateId,cityId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(lcs.isEmpty()) {
			return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanySelect>>(lcs,HttpStatus.OK);
	}

		private  ResponseEntity<Void> updateCompanyCityId(Connection c, Long companyId, Long cityId)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyCityId(c, companyId, cityId);
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

		private  ResponseEntity<Void> updateCompanyCompanyAddress(Connection c, Long companyId, Long companyAddress)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyCompanyAddress(c, companyId, companyAddress);
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

		private  ResponseEntity<Void> updateCompanyCompanyCode(Connection c, Long companyId, String companyCode)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyCompanyCode(c, companyId, companyCode);
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

		private  ResponseEntity<Void> updateCompanyCompanyName(Connection c, Long companyId, String companyName)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyCompanyName(c, companyId, companyName);
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

		private  ResponseEntity<Void> updateCompanyIsActive(Connection c, Long companyId, Boolean isActive)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyIsActive(c, companyId, isActive);
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

		private  ResponseEntity<Void> updateCompanyLastEditedDeviceType(Connection c, Long companyId, Integer lastEditedDeviceType)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyLastEditedDeviceType(c, companyId, lastEditedDeviceType);
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

		private  ResponseEntity<Void> updateCompanyLastEditedBy(Connection c, Long companyId, Long lastEditedBy)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyLastEditedBy(c, companyId, lastEditedBy);
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

		private  ResponseEntity<Void> updateCompanyLastEditedOn(Connection c, Long companyId, Timestamp lastEditedOn)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyLastEditedOn(c, companyId, lastEditedOn);
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
		
		private  ResponseEntity<Void> updateCompanyOwnerContactId(Connection c, Long companyId, Long ownerContactId)
		{
			Boolean rs=false;
			try {
				 rs=cdi.updateCompanyOwnerContactId(c, companyId, ownerContactId);
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
	
	public ResponseEntity<Void> updateFields(Long companyId,CompanyUpdate cu) {
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
		if(cu.getCityId()!=null) {
			rs=updateCompanyCityId(c, companyId, cu.getCityId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getCompanyAddress()!=null) {
			rs=updateCompanyCompanyAddress(c, companyId, cu.getCompanyAddress());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getCompanyCode()!=null) {
			rs=updateCompanyCompanyCode(c, companyId, cu.getCompanyCode());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getCompanyName()!=null) {
			rs=updateCompanyCompanyName(c, companyId, cu.getCompanyName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getIsActive()!=null) {
			rs=updateCompanyIsActive(c, companyId, cu.getIsActive());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getLastEditDeviceType()!=null) {
			rs=updateCompanyLastEditedDeviceType(c, companyId, cu.getLastEditDeviceType());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getLastEditBy()!=null) {
			rs=updateCompanyLastEditedBy(c, companyId, cu.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getLastEditOn()!=null) {
			rs=updateCompanyLastEditedOn(c, companyId, cu.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cu.getOwnerContactId()!=null) {
			rs=updateCompanyOwnerContactId(c, companyId, cu.getOwnerContactId());
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
	
}


