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
import ivgroup.master.database.dao.impl.CompanyBranchTypeDAOImpl;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeInsert;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeSelect;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeUpdate;

@Service
public class CompanyBranchTypeBusinessLogic
{

	@Autowired
	CompanyBranchTypeDAOImpl cbdi;
	
	Logger logger =LoggerFactory.getLogger(CompanyBranchTypeBusinessLogic.class);
	
	public ResponseEntity<List<CompanyBranchTypeSelect>> selectCompanyBranchTypeByCompanyId(Long companyId)
	{
		List<CompanyBranchTypeSelect> lcs=new ArrayList<CompanyBranchTypeSelect>();
		if(companyId==null)
		{
			return new ResponseEntity<List<CompanyBranchTypeSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=cbdi.selectCompanyBranchTypeByCompanyId(companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyBranchTypeSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyBranchTypeSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<CompanyBranchTypeSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchTypeSelect>>(lcs,HttpStatus.OK);
	}
	
	public ResponseEntity<Void> addCompanyBranchType(CompanyBranchTypeInsert cbi)
	{
		if(cbi==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rsMain=false;
		try {
			rsMain=cbdi.addCompanyBranchType(cbi);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	private ResponseEntity<Void> updateCompanyBranchTypeCompanyBranchTypeName(Connection c, Long companyBranchTypeId,String companyBranchTypeName)
	{
		Boolean rsMain=false;
		try {
			rsMain=cbdi.updateCompanyBranchTypeCompanyBranchTypeName(c, companyBranchTypeId, companyBranchTypeName);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCompanyBranchTypeCompanyId(Connection c, Long companyBranchTypeId, Long companyId)
	{
		Boolean rsMain=false;
		try {
			rsMain=cbdi.updateCompanyBranchTypeCompanyId(c, companyBranchTypeId, companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCompanyBranchTypeCompanyBranchTypePosition(Connection c, Long companyBranchTypeId,Integer companyBranchTypePosition) 
	{
		Boolean rsMain=false;
		try {
			rsMain=cbdi.updateCompanyBranchTypeCompanyBranchTypePosition(c, companyBranchTypeId, companyBranchTypePosition);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCompanyBranchTypeLastEditBy(Connection c, Long companyBranchTypeId,Long companyBranchTypeLastEditBy) 
	{
		Boolean rsMain=false;
		try {
			rsMain=cbdi.updateCompanyBranchTypeLastEditBy(c, companyBranchTypeId, companyBranchTypeLastEditBy);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCompanyBranchTypeLastEditOn(Connection c, Long companyBranchTypeId,Timestamp companyBranchTypeLastEditOn)
	{
		Boolean rsMain=false;
		try {
			rsMain=cbdi.updateCompanyBranchTypeLastEditOn(c, companyBranchTypeId, companyBranchTypeLastEditOn);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	public ResponseEntity<Void> updateCompanyBranchTypeFields(Long companyId,CompanyBranchTypeUpdate cbu)
	{
		if(cbu==null) {
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
		if(cbu.getCompanyBranchTypeName()!=null) {
			rs=updateCompanyBranchTypeCompanyBranchTypeName(c, companyId,cbu.getCompanyBranchTypeName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(cbu.getCompanyId()!=null) {
			rs=updateCompanyBranchTypeCompanyId(c, companyId,cbu.getCompanyId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(cbu.getCompanyBranchPosition()!=null) {
			rs=updateCompanyBranchTypeCompanyBranchTypePosition(c, companyId,cbu.getCompanyBranchPosition());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(cbu.getLastEditBy()!=null) {
			rs=updateCompanyBranchTypeLastEditBy(c, companyId,cbu.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(cbu.getLastEditOn()!=null) {
			rs=updateCompanyBranchTypeLastEditOn(c, companyId,cbu.getLastEditOn());
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

	public ResponseEntity<Void> deleteCompanyBranchType(Long companyBranchTypeId) 
	{
		Boolean rsMain=false;
		try {
			rsMain=cbdi.deleteCompanyBranchType(companyBranchTypeId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
