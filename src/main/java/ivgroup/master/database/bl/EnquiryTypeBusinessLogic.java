package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.impl.EnquiryTypeDAOImpl;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeInsert;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeSelect;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeUpdate;

@Service
public class EnquiryTypeBusinessLogic
{

	@Autowired
	EnquiryTypeDAOImpl ebi;
	
	
	public ResponseEntity<List<EnquiryTypeSelect>> selectEnquiryTypeByCompanyId(Long companyId)
	{
		List<EnquiryTypeSelect> lct=new ArrayList<EnquiryTypeSelect>();
		if(companyId==null)
		{
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.BAD_REQUEST);
		}
		try {
			lct=ebi.selectEnquiryTypeByCompanyId(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lct.isEmpty())
		{
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquiryTypeSelect>> selectEnquiryTypeByOwnerId(Long ownerId)
	{
		List<EnquiryTypeSelect> lct=new ArrayList<EnquiryTypeSelect>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.BAD_REQUEST);
		}
		try {
			lct=ebi.selectEnquiryTypeByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lct.isEmpty())
		{
			return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryTypeSelect>>(lct,HttpStatus.OK);
	}
	
	public ResponseEntity<Void> addEnquiryType(EnquiryTypeInsert eti)
	{
		if(eti==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rsMain=false;
		try {
			rsMain=ebi.addEnquiryType(eti);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	
	private ResponseEntity<Void> updateEnquiryTypeEnquiryTypeName(Connection c, Long enquiryTypeId, String enquiryTypeName)
	{
		Boolean rsMain=false;
		try {
			rsMain=ebi.updateEnquiryTypeEnquiryTypeName(c, enquiryTypeId, enquiryTypeName);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	private ResponseEntity<Void> updateEnquiryTypeEnquiryTypeColorCode(Connection c, Long enquiryTypeId, String enquiryTypeColorCode)
	{
		Boolean rsMain=false;
		try {
			rsMain=ebi.updateEnquiryTypeEnquiryTypeColorCode(c, enquiryTypeId, enquiryTypeColorCode);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryTypeCompanyId(Connection c, Long enquiryTypeId, Long companyId)
	{
		Boolean rsMain=false;
		try {
			rsMain=ebi.updateEnquiryTypeCompanyId(c, enquiryTypeId, companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryTypeLastEditBy(Connection c, Long enquiryTypeId, Long lastEditBy)
	{
		Boolean rsMain=false;
		try {
			rsMain=ebi.updateEnquiryTypeLastEditBy(c, enquiryTypeId, lastEditBy);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateEnquiryTypeLastEditOn(Connection c, Long enquiryTypeId, Timestamp lastEditOn)
	{
		Boolean rsMain=false;
		try {
			rsMain=ebi.updateEnquiryTypeLastEditOn(c, enquiryTypeId, lastEditOn);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> updateEnquiryTypeAllFields(Long enquiryTypeId,EnquiryTypeUpdate etu)
	{
		if(etu==null) {
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
		if(etu.getEnquiryTypeName()!=null) {
			rs=updateEnquiryTypeEnquiryTypeName(c, enquiryTypeId,etu.getEnquiryTypeName());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;
		if(etu.getEnquiryTypeColorCode()!=null) {
			rs=updateEnquiryTypeEnquiryTypeColorCode(c, enquiryTypeId,etu.getEnquiryTypeColorCode());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(etu.getCompanyId()!=null) {
			rs=updateEnquiryTypeCompanyId(c, enquiryTypeId,etu.getCompanyId());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;						
		if(etu.getLastEditBy()!=null) {
			rs=updateEnquiryTypeLastEditBy(c, enquiryTypeId,etu.getLastEditBy());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;		
		if(etu.getLastEditOn()!=null) {
			rs=updateEnquiryTypeLastEditOn(c, enquiryTypeId,etu.getLastEditOn());
			wentIn=true;
		}
				if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
				}
				rs=null;					
				rs=null;				
		try {
				c.close();
			}catch (SQLException e) {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		return new ResponseEntity<Void>(HttpStatus.OK); 							
	}
	
	public ResponseEntity<Void> deleteEnquiryType(Long enquiryTypeId)
	{
		Boolean rsMain=false;
		try {
			rsMain=ebi.deleteEnquiryType(enquiryTypeId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
