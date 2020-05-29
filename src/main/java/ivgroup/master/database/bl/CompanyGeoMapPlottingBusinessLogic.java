package ivgroup.master.database.bl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.dao.impl.CompanyGeoMapPlottingDAOImpl;
import ivgroup.master.database.dto.geoMapPlotting.CompanyGeoMapPlotting;

@Service
public class CompanyGeoMapPlottingBusinessLogic
{
	
	@Autowired
	CompanyGeoMapPlottingDAOImpl cgpdi;
	
	public ResponseEntity<List<CompanyGeoMapPlotting>> getComapnyByOwnerId(Long ownerId) 
	{
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		if(ownerId==null) 
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgpdi.getComapnyByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			System.out.println(e);
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyGeoMapPlotting>> getCompanyByCountry(Long ownerId, Long countryId)
	{
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		if(ownerId==null||countryId==null) 
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgpdi.getCompanyByCountry(ownerId, countryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyGeoMapPlotting>> getCompanyByState(Long ownerId, Long countryId, Long stateId)
	{
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null) 
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgpdi.getCompanyByState(ownerId, countryId, stateId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyGeoMapPlotting>> getCompanyByCity(Long ownerId, Long countryId, Long stateId, Long cityId)
	{
		List<CompanyGeoMapPlotting> ll=new ArrayList<CompanyGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null||cityId==null) 
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		
		try {
			ll=cgpdi.getCompanyByCity(ownerId, countryId, stateId, cityId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyGeoMapPlotting>>(ll,HttpStatus.OK);
	}
}
