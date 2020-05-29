package ivgroup.master.database.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonFormat;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CompanyExecutiveGeoLocationBusinessLogic;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationInsert;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationSelect;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationTextSelect;

@RestController
@RequestMapping("/companyExecutiveGeoLocation")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyExecutiveGeoLocationController 
{
	@Autowired
	CompanyExecutiveGeoLocationBusinessLogic cbl;
	
	@GetMapping(path="{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>
	selectCompanyExecutiveGeoLocationByCompanyExecutiveId(@PathVariable @NotNull Long companyExecutiveId) 
	{
		return cbl.selectCompanyExecutiveGeoLocationByCompanyExecutiveId(companyExecutiveId);
	}

	@GetMapping(path="date/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>
	selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(
																@PathVariable @NotNull Long companyExecutiveId, 
																@RequestParam("date") @JsonFormat(pattern = "yyyy-MM-dd", timezone = "IST") Date dateOfSearch)  
	{
		return cbl.selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(
																				companyExecutiveId,
																				dateOfSearch);
	}

	@GetMapping(path="dateRange/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutiveGeoLocationSelect>>
	selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndBetweenDate(
																		@PathVariable @NotNull Long companyExecutiveId, 
																		@RequestParam("startDate") @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST") Timestamp startDate, 
																		@RequestParam("endDate") @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST") Timestamp endDate)
	{
		return cbl.selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndBetweenDate(
																					companyExecutiveId, 
																					startDate,
																					endDate);
	}

	@GetMapping(path="date/text/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>
	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndDate(
																	@PathVariable @NotNull Long companyExecutiveId, 
																	@RequestParam("date") @JsonFormat(pattern = "yyyy-MM-dd", timezone = "IST") Date dateOfSearch) 
	{
		return cbl.selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndDate(
																	companyExecutiveId, 
																	dateOfSearch);
	}

	@GetMapping(path="dateRange/text/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutiveGeoLocationTextSelect>>
	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndBetweenDate(
																			@PathVariable @NotNull Long companyExecutiveId, 
																			@RequestParam("startDate") @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST") Timestamp startDate, 
																			@RequestParam("endDate") @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST") Timestamp endDate)
	{
		return cbl.selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndBetweenDate(
																			companyExecutiveId, 
																			startDate, 
																			endDate);
	}

	@PostMapping(	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
					produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyExecutiveGeoLocation(@Valid @RequestBody CompanyExecutiveGeoLocationInsert cgi)
	{
		return cbl.addCompanyExecutiveGeoLocation(cgi);
	}
	
}
