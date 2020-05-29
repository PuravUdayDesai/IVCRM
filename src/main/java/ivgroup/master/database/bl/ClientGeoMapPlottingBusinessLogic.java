package ivgroup.master.database.bl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.dao.impl.ClientGeoMapPlottingDAOImpl;
import ivgroup.master.database.dto.geoMapPlotting.ClientGeoMapPlotting;

@Service
public class ClientGeoMapPlottingBusinessLogic 
{
	
	@Autowired
	ClientGeoMapPlottingDAOImpl cgdl;
	
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByOwnerId(Long ownerId)
	{
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgdl.getClientGeoMapByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByCompanyId(Long companyId)
	{
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		if(companyId==null)
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgdl.getClientGeoMapByCompanyId(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByCountryId(Long ownerId, Long countryId)
	{
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		if(ownerId==null||countryId==null)
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgdl.getClientGeoMapByCountryId(ownerId, countryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.OK);
	}
	
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByStateId(Long ownerId, Long countryId, Long stateId) 
	{
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null)
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgdl.getClientGeoMapByStateId(ownerId, countryId, stateId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByCityId(Long ownerId, Long countryId, Long stateId, Long cityId)
	{
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null||cityId==null)
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgdl.getClientGeoMapByCityId(ownerId, countryId, stateId, cityId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByAreaId(Long ownerId, Long countryId, Long stateId, Long cityId,Long areaId)
	{
		List<ClientGeoMapPlotting> ll=new ArrayList<ClientGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null||cityId==null||areaId==null)
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgdl.getClientGeoMapByAreaId(ownerId, countryId, stateId, cityId, areaId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<ClientGeoMapPlotting>>(ll,HttpStatus.OK);
	}

}
