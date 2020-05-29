package ivgroup.master.database.bl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import ivgroup.master.database.dao.impl.CompanyBranchGeoMapPlottingDAOImpl;
import ivgroup.master.database.dto.geoMapPlotting.CompanyBranchGeoMapPlotting;

@Service
public class CompanyBranchGeoMapPlottingBusinessLogic 
{
	
	@Autowired
	CompanyBranchGeoMapPlottingDAOImpl cbdi; 
	
	public ResponseEntity<List<CompanyBranchGeoMapPlotting>> getCompaynBranchByOwnerId(Long ownerId)
	{
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		if(ownerId==null)
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cbdi.getCompaynBranchByOwnerId(ownerId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyBranchGeoMapPlotting>> getCompanyBranchByCompanyId(Long companyId)
	{
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		if(companyId==null)
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cbdi.getCompanyBranchByCompanyId(companyId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyBranchGeoMapPlotting>> getCompanyBranchByCountryId(Long ownerId, Long countryId)
	{
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		if(ownerId==null||countryId==null)
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cbdi.getCompanyBranchByCountryId(ownerId, countryId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyBranchGeoMapPlotting>> getCompanyBranchByStateId(Long ownerId, Long countryId, Long stateId)
	{
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null)
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cbdi.getCompanyBranchByStateId(ownerId, countryId, stateId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.OK);
	}

	public ResponseEntity<List<CompanyBranchGeoMapPlotting>> getCompanyBranchByCityId(Long ownerId, Long countryId, Long stateId,Long cityId)
	{
		List<CompanyBranchGeoMapPlotting> ll=new ArrayList<CompanyBranchGeoMapPlotting>();
		if(ownerId==null||countryId==null||stateId==null||cityId==null)
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.BAD_REQUEST);
		}
		try {
			ll=cbdi.getCompanyBranchByCityId(ownerId, countryId, stateId, cityId);
		} catch (ClassNotFoundException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NOT_FOUND);
		} catch (SQLException e) {
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(ll.isEmpty())
		{
			return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyBranchGeoMapPlotting>>(ll,HttpStatus.OK);
	}
}
