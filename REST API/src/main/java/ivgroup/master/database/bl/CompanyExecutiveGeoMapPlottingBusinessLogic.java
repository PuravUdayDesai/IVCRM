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

import ivgroup.master.database.dao.impl.CompanyExecutiveGeoMapPlottingDAOImpl;
import ivgroup.master.database.dto.geoMapPlotting.CompanyExecutiveGeoMapPlotting;

@Service
public class CompanyExecutiveGeoMapPlottingBusinessLogic 
{
	
	@Autowired
	CompanyExecutiveGeoMapPlottingDAOImpl cgdi;
	
	Logger logger =LoggerFactory.getLogger(CompanyExecutiveGeoMapPlottingBusinessLogic.class);
	
	public ResponseEntity<List<CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByOwnerId(Long ownerId)
	{
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cgdi.getCompanyExecutiveGeoMapByOwnerId(ownerId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByCompanyId(Long companyId)
	{
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		if(companyId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cgdi.getCompanyExecutiveGeoMapByCompanyId(companyId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByCountryId(Long ownerId, Long countryId)
	{
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		if(ownerId==null||countryId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cgdi.getCompanyExecutiveGeoMapByCountryId(ownerId, countryId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByStateId(Long ownerId, Long countryId,Long stateId)
	{
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cgdi.getCompanyExecutiveGeoMapByStateId(ownerId, countryId, stateId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.OK);
	}
	
	public ResponseEntity<List<CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByCityId(Long ownerId, Long countryId,Long stateId, Long cityId)
	{
		List<CompanyExecutiveGeoMapPlotting> ll=new ArrayList<CompanyExecutiveGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null||cityId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cgdi.getCompanyExecutiveGeoMapByCityId(ownerId, countryId, stateId, cityId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoMapPlotting>>(ll,HttpStatus.OK);
	}
}
