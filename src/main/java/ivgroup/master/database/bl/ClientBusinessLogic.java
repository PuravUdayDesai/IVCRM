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
import ivgroup.master.database.dao.impl.ClientDAOImpl;
import ivgroup.master.database.dto.client.ClientInsert;
import ivgroup.master.database.dto.client.ClientSelect;
import ivgroup.master.database.dto.client.ClientUpdate;

@Service
public class ClientBusinessLogic
{

	@Autowired
	ClientDAOImpl cdi;
	
	public ResponseEntity<List<ClientSelect>> selectClientByCompanyId(Long companyId)
	{
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		if(companyId==null)
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
			lcs=cdi.selectClientByCompanyId(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<List<ClientSelect>> selectClientByCountryId(Long countryId)  
	{
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		if(countryId==null)
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
		lcs=cdi.selectClientByCountryId(countryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<List<ClientSelect>> selectClientByStateId(Long stateId)  
	{
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		if(stateId==null)
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
		lcs=cdi.selectClientByStateId(stateId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<List<ClientSelect>> selectClientByCityId(Long cityId)  
	{
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		if(cityId==null)
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
		lcs=cdi.selectClientByCityId(cityId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<List<ClientSelect>> selectClientByAreaId(Long areaId) 
	{
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		if(areaId==null)
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
		lcs=cdi.selectClientByAreaId(areaId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<List<ClientSelect>> selectClientByOwnerId(Long ownerId) 
	{
		List<ClientSelect> lcs=new ArrayList<ClientSelect>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		try {
		lcs=cdi.selectClientByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientSelect>>(lcs,HttpStatus.OK);
	}

	public ResponseEntity<Void> addClient(ClientInsert ci)  
	{
		Boolean rsMain=false;
		if(ci==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try {
			rsMain=cdi.addClient(ci);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		System.out.println(rsMain);
		if(!rsMain)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

	private ResponseEntity<Void> deleteClient(Long clientId)  
	{
		Boolean rsMain=false;
		if(clientId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try {
			rsMain=cdi.deleteClient(clientId);
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

	private ResponseEntity<Void> deleteClientLocation(Long clientLocationId)  
	{
		Boolean rsMain=false;
		if(clientLocationId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		try {
			rsMain=cdi.deleteClientLocation(clientLocationId);
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

	private ResponseEntity<Void> updateClientClientContactName(Connection c, Long clientId, String contactNumber)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientClientContactName(c, clientId, contactNumber);
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

	private ResponseEntity<Void> updateClientClientContactPerson(Connection c, Long clientId, String contactPerson)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientClientContactPerson(c, clientId, contactPerson);
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

	private ResponseEntity<Void> updateClientEmailId(Connection c, Long clientId, String emailId)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientEmailId(c, clientId, emailId);
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

	private ResponseEntity<Void> updateClientContactNumber(Connection c, Long clientId, String contactNumber)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientContactNumber(c, clientId, contactNumber);
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

	private ResponseEntity<Void> updateClientCompany(Connection c, Long clientId, Long companyId)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientCompany(c, clientId, companyId);
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

	private ResponseEntity<Void> updateClientIsActive(Connection c, Long clientId, Boolean isActive)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientIsActive(c, clientId, isActive);
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

	private ResponseEntity<Void> updateClientLastEditOn(Connection c, Long clientId, Timestamp lastEditOn)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLastEditOn(c, clientId, lastEditOn);
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

	private ResponseEntity<Void> updateClientLastEditBy(Connection c, Long clientId, Long lastEditBy)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLastEditBy(c, clientId, lastEditBy);
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

	private ResponseEntity<Void> updateClientLocationContry(Connection c, Long clientLocationId, Long countryId)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationContry(c, clientLocationId, countryId);
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

	private ResponseEntity<Void> updateClientLocationState(Connection c, Long clientLocationId, Long stateId)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationState(c, clientLocationId, stateId);
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

	private ResponseEntity<Void> updateClientLocationCity(Connection c, Long clientLocationId, Long cityId)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationCity(c, clientLocationId, cityId);
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

	private ResponseEntity<Void> updateClientLocationArea(Connection c, Long clientLocationId, Long areaId)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationArea(c, clientLocationId, areaId);
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

	private ResponseEntity<Void> updateClientLocationAddressLine1(Connection c, Long clientLocationId, String addressLine1)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationAddressLine1(c, clientLocationId, addressLine1);
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

	private ResponseEntity<Void> updateClientLocationAddressLine2(Connection c, Long clientLocationId, String addressLine2)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationAddressLine2(c, clientLocationId, addressLine2);
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

	private ResponseEntity<Void> updateClientLocationAddressLine3(Connection c, Long clientLocationId, String addressLine3)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationAddressLine3(c, clientLocationId, addressLine3);
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

	private ResponseEntity<Void> updateClientLocationPincode(Connection c, Long clientLocationId, String pincode)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationPincode(c, clientLocationId, pincode);
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

	private ResponseEntity<Void> updateClientLocationLatitude(Connection c, Long clientLocationId, String latitude)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationLatitude(c, clientLocationId, latitude);
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

	private ResponseEntity<Void> updateClientLocationLongitude(Connection c, Long clientLocationId, String longitude)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationLongitude(c, clientLocationId, longitude);
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

	private ResponseEntity<Void> updateClientLocationIsActive(Connection c, Long clientLocationId, Boolean isActive)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationIsActive(c, clientLocationId, isActive);
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

	private ResponseEntity<Void> updateClientLocationLastEditOn(Connection c, Long clientLocationId, Timestamp lastEditOn)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationLastEditOn(c, clientLocationId, lastEditOn);
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

	private ResponseEntity<Void> updateClientLocationLastEditBy(Connection c, Long clientLocationId, Long lastEditBy)
	{
		Boolean rsMain=false;
		try {
			rsMain=cdi.updateClientLocationLastEditBy(c, clientLocationId, lastEditBy);
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
	
	public ResponseEntity<Void> updateClientFields(Long clientId,ClientUpdate cu)
	{
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
		
		if(cu.getContactName()!=null) {
			rs=updateClientClientContactName(c, clientId,cu.getContactName());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;
		if(cu.getContactPerson()!=null) {
			rs=updateClientClientContactPerson(c, clientId,cu.getContactPerson());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getEmailId()!=null) {
			rs=updateClientEmailId(c, clientId,cu.getEmailId());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getContactNumber()!=null) {
			rs=updateClientContactNumber(c, clientId,cu.getContactNumber());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getCompanyId()!=null) {
			rs=updateClientCompany(c, clientId,cu.getCompanyId());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;				
		if(cu.getIsActive()!=null) {
			rs=updateClientIsActive(c, clientId,cu.getIsActive());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;					
		if(cu.getLastEditOn()!=null) {
			rs=updateClientLastEditOn(c, clientId,cu.getLastEditOn());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;				
		if(cu.getLastEditBy()!=null) {
			rs=updateClientLastEditBy(c, clientId,cu.getLastEditBy());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;		
if(	cu.getAddressLine1()!=null||
	cu.getAddressLine2()!=null||
	cu.getAddressLine3()!=null||
	cu.getCountryId()!=null||
	cu.getStateId()!=null||
	cu.getCityId()!=null||
	cu.getAreaId()!=null||
	cu.getPincode()!=null||
	cu.getLatitude()!=null||
	cu.getLongitude()!=null)
	{
		Long clientLocationId=null;
		try {
			clientLocationId=cdi.selectClientLocationIdByClientId(clientId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(clientLocationId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		
		if(cu.getAddressLine1()!=null) {
			rs=updateClientLocationAddressLine1(c, clientLocationId,cu.getAddressLine1());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getAddressLine2()!=null) {
			rs=updateClientLocationAddressLine2(c, clientLocationId,cu.getAddressLine2());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;		
		if(cu.getAddressLine3()!=null) {
			rs=updateClientLocationAddressLine3(c, clientLocationId,cu.getAddressLine2());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;			
		if(cu.getCountryId()!=null) {
			rs=updateClientLocationContry(c, clientLocationId,cu.getCountryId());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getStateId()!=null) {
			rs=updateClientLocationState(c, clientLocationId,cu.getStateId());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getCityId()!=null) {
			rs=updateClientLocationCity(c, clientLocationId,cu.getCityId());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;		
		if(cu.getAreaId()!=null) {
			rs=updateClientLocationArea(c, clientLocationId,cu.getAreaId());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getPincode()!=null) {
			rs=updateClientLocationPincode(c, clientLocationId,cu.getPincode());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;		
		if(cu.getLatitude()!=null) {
			rs=updateClientLocationLatitude(c, clientLocationId,cu.getLatitude());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
		if(cu.getLongitude()!=null) {
			rs=updateClientLocationLongitude(c, clientLocationId,cu.getLongitude());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;		
		if(cu.getIsActive()!=null) {
			rs=updateClientLocationIsActive(c, clientLocationId,cu.getIsActive());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;		
		if(cu.getLastEditOn()!=null) {
			rs=updateClientLocationLastEditOn(c, clientLocationId,cu.getLastEditOn());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;				
		if(cu.getLastEditBy()!=null) {
			rs=updateClientLocationLastEditBy(c, clientLocationId,cu.getLastEditBy());
			wentIn=true;
		}
			if(rs!=null&&rs.getStatusCode()!=HttpStatus.OK&&wentIn) {
				wentIn=false;
				return rs;
			}
			rs=null;	
	}
		try {
			c.close();
			}catch (SQLException e) {
				return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		return new ResponseEntity<Void>(HttpStatus.OK); 
	}
	
	public ResponseEntity<Void> deleteClientAndClientLocation(Long clientId)
	{
		if(clientId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Long clientLocationId=null;
		try {
			clientLocationId=cdi.selectClientLocationIdByClientId(clientId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(clientLocationId==null)
		{
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
		ResponseEntity<Void> rs2=null;
		rs2=deleteClientLocation(clientLocationId);
		ResponseEntity<Void> rs=null;
		rs=deleteClient(clientId);
		if(rs.getStatusCode()==HttpStatus.OK&&rs2.getStatusCode()==HttpStatus.OK)
		{
			return new ResponseEntity<Void>(HttpStatus.OK);
		}
		return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
	}
	
}