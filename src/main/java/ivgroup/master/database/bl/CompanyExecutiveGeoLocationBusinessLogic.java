package ivgroup.master.database.bl;

import java.sql.Date;
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

import ivgroup.master.database.dao.impl.CompanyExecutiveGeoLocationDAOImpl;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationInsert;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationSelect;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationTextSelect;

@Service
public class CompanyExecutiveGeoLocationBusinessLogic
{
	@Autowired
	CompanyExecutiveGeoLocationDAOImpl cdi;

	Logger logger =LoggerFactory.getLogger(CompanyExecutiveGeoLocationBusinessLogic.class);
	
	public ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>
	selectCompanyExecutiveGeoLocationByCompanyExecutiveId(Long companyExecutiveId) 
	{
		List<CompanyExecutiveGeoLocationSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationSelect>();
		if(companyExecutiveId==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		
		try {
			lcs=cdi.selectCompanyExecutiveGeoLocationByCompanyExecutiveId(companyExecutiveId);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.OK);
	}

	
	public ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>
	selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(
																Long companyExecutiveId, 
																Date dateOfSearch)  
	{
		List<CompanyExecutiveGeoLocationSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationSelect>();
		if(companyExecutiveId==null||dateOfSearch==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		
		try {
			lcs=cdi.selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(companyExecutiveId, dateOfSearch);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.OK);
	}

	
	public ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>
	selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndBetweenDate(
																		Long companyExecutiveId, 
																		Timestamp startDate, 
																		Timestamp endDate)
	{
		List<CompanyExecutiveGeoLocationSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationSelect>();
		if(companyExecutiveId==null||startDate==null||endDate==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		
		try {
			lcs=cdi.selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndBetweenDate(companyExecutiveId,
																				startDate, 
																				endDate);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>(lcs,HttpStatus.OK);
	}

	
	public ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>
	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndDate(
																	Long companyExecutiveId, 
																	Date dateOfSearch) 
	{
		List<CompanyExecutiveGeoLocationTextSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationTextSelect>();
		if(companyExecutiveId==null||dateOfSearch==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		
		try {
			lcs=cdi.selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndDate(companyExecutiveId, dateOfSearch);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.OK);
	}

	
	public ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>
	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndBetweenDate(
																			Long companyExecutiveId, 
																			Timestamp startDate, 
																			Timestamp endDate)
	{
		List<CompanyExecutiveGeoLocationTextSelect> lcs=new ArrayList<CompanyExecutiveGeoLocationTextSelect>();
		if(companyExecutiveId==null||startDate==null||endDate==null)
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.BAD_REQUEST);
		}
		
		try {
			lcs=cdi.selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndBetweenDate(companyExecutiveId, 
																					startDate, 
																					endDate);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(lcs.isEmpty())
		{
			return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>(lcs,HttpStatus.OK);
	}

	
	public ResponseEntity<Void> addCompanyExecutiveGeoLocation(CompanyExecutiveGeoLocationInsert cgi)
	{
		if(cgi==null)
		{
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Boolean rs=false;
		try {
			 rs=cdi.addCompanyExecutiveGeoLocation(cgi);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if(!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}

}
