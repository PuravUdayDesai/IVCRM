package ivgroup.master.database.bl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.dao.impl.EnquiryGeoMapPlottingDAOImpl;
import ivgroup.master.database.dto.geoMapPlotting.EnquiryGeoMapPlotting;

@Service
public class EnquiryGeoMapPlottingBusinessLogic 
{

	@Autowired
	EnquiryGeoMapPlottingDAOImpl egdi;
	
	Logger logger =LoggerFactory.getLogger(EnquiryGeoMapPlottingBusinessLogic.class);
	
	public ResponseEntity<List<EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByOwnerId(Long ownerId)
	{
		
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=egdi.getEnquiryGeoMapPlottingByOwnerId(ownerId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquiryGeoMapPlotting>> getEnquryGeoMapPlottingByCompanyId(Long companyId)
	{
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		if(companyId==null)
		{
			
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=egdi.getEnquryGeoMapPlottingByCompanyId(companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByCountry(Long ownerId, Long countryId)
	{
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		if(ownerId==null||countryId==null)
		{
			
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=egdi.getEnquiryGeoMapPlottingByCountry(ownerId, countryId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByState(Long ownerId, Long countryId, Long stateId)
	{
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null)
		{
			
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=egdi.getEnquiryGeoMapPlottingByState(ownerId, countryId, stateId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByCity(Long ownerId, Long countryId, Long stateId,Long cityId)
	{
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null||cityId==null)
		{
			
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=egdi.getEnquiryGeoMapPlottingByCity(ownerId, countryId, stateId, cityId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByArea(Long ownerId, Long countryId, Long stateId,Long cityId, Long areaId)
	{
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null||cityId==null)
		{
			
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=egdi.getEnquiryGeoMapPlottingByArea(ownerId, countryId, stateId, cityId, areaId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.OK);
	}
	
	public ResponseEntity<List<EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByCompanyExecutive(Long companyExecutiveId)
	{
		List<EnquiryGeoMapPlotting> ll=new ArrayList<EnquiryGeoMapPlotting>();
		if(companyExecutiveId==null)
		{
			
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=egdi.getEnquiryGeoMapPlottingByCompanyExecutive(companyExecutiveId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<EnquiryGeoMapPlotting>>(ll,HttpStatus.OK);
	}
}
