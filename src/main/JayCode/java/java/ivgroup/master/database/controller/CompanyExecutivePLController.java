package ivgroup.master.database.controller;

import java.sql.Date;
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

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CompanyExecutivePLBusinessLogic;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForAllYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForMonth;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLInsert;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLSelect;

@RestController
@RequestMapping("/companyExecutivePL")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyExecutivePLController 
{
	@Autowired
	CompanyExecutivePLBusinessLogic cebl;
	
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyExecutivePL(@Valid @RequestBody CompanyExecutivePLInsert cpli)
	{
		return cebl.addCompanyExecutivePL(cpli);
	}
	@GetMapping(path="/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutivePLSelect>> selectCompanyExecutivePLByExecutiveId(@PathVariable @NotNull Long companyExecutiveId) 
	{
		return cebl.selectCompanyExecutivePLByExecutiveId(companyExecutiveId);
	}

	@GetMapping(path="/date/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutivePLSelect>> selectCompanyExecutivePLByExecutiveIdAndDate(@PathVariable @NotNull Long companyExecutiveId,@RequestParam("date") Date date)  
	{
		return cebl.selectCompanyExecutivePLByExecutiveIdAndDate(companyExecutiveId, date);
	}
	@GetMapping(path="/betweenDate/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutivePLSelect>> selectCompanyExecutivePLByExecutiveIdBetweenDate(@PathVariable @NotNull Long companyExecutiveId,@RequestParam("dateStart")Date dateStart,@RequestParam("dateEnd") Date dateEnd)  
	{
		return cebl.selectCompanyExecutivePLByExecutiveIdBetweenDate(companyExecutiveId, dateStart, dateEnd);
	}
	@GetMapping(path="/month/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutivePLGeneralSelectForMonth>> selectCompanyExecutiveMonthreport(@PathVariable @NotNull Long companyExecutiveId,@RequestParam("month")Integer monthNumber,@RequestParam("year") Integer yearNumber)  
	{
		return cebl.selectCompanyExecutiveMonthReport(companyExecutiveId, monthNumber, yearNumber);
	}
	@GetMapping(path="/year/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutivePLGeneralSelectForYear>> selectCompanyExecutiveYearreport(@PathVariable @NotNull Long companyExecutiveId,@RequestParam("year")Integer yearNumber)  
	{
		return cebl.selectCompanyExecutiveYearReport(companyExecutiveId, yearNumber);
	}
	@GetMapping(path="/years/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyExecutivePLGeneralSelectForAllYear>> selectCompanyExecutiveYearreport(@PathVariable @NotNull Long companyExecutiveId)  
	{
		return cebl.selectCompanyExecutiveAllYearsReport(companyExecutiveId);
	}
	
}
