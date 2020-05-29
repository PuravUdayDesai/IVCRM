package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CompanyBusinessLogic;
import ivgroup.master.database.dto.company.CompanyInsert;
import ivgroup.master.database.dto.company.CompanyInsertWithCompanyBranchType;
import ivgroup.master.database.dto.company.CompanyInsetWithCompanyBranchTypeAndExecutivePosition;
import ivgroup.master.database.dto.company.CompanySelect;
import ivgroup.master.database.dto.company.CompanyUpdate;

@RestController
@RequestMapping("/company")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyController {
	
	@Autowired
	CompanyBusinessLogic cbl;

	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
				produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompany(@Valid @RequestBody CompanyInsert ci)
	{
		return cbl.addCompany(ci);
	}
	
	@PostMapping(path="/companyBranchType",consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyWithCompanyBranchType(@Valid @RequestBody CompanyInsertWithCompanyBranchType ci)
	{
		return cbl.addCompanyWithCompanyBranchType(ci);
	}
	
	@PostMapping(path="/companyBranchTypeAndExecutivePosition",consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyWithCompanyBranchTypeAndPosition(@Valid @RequestBody CompanyInsetWithCompanyBranchTypeAndExecutivePosition ci)
	{
		return cbl.addCompanyWithCompanyBranchTypeAndPosition(ci);
	}
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanySelect>> selectCompany()
	{
		return cbl.selectCompany();
	}
	
	@GetMapping(path="/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<CompanySelect> selectCompanyByCompanyId(@PathVariable @NotNull Long companyId)
	{
		return cbl.selectCompanyByCompanyId(companyId);
	}
	
	@GetMapping(path="owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanySelect>> selectCompanyByOwnerId(@PathVariable @NotNull Long ownerId)
	{
		return cbl.selectCompanyByOwnerId(ownerId);
	}
	
	@GetMapping(path="country/{countryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanySelect>> selectCompanyByCountryId(@PathVariable @NotNull Long countryId)
	{
		return cbl.selectCompanyByCountryId(countryId);
	}
	
	@GetMapping(path="state/{countryId}/{stateId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanySelect>> selectCompanyByStateId(@PathVariable @NotNull Long countryId,@PathVariable @NotNull Long stateId)
	{
		return cbl.selectCompanyByStateId(countryId, stateId);
	}
	
	@GetMapping(path="city/{countryId}/{stateId}/{cityId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanySelect>> selectCompanyByCityId(@PathVariable @NotNull Long countryId,@PathVariable @NotNull Long stateId,@PathVariable @NotNull Long cityId)
	{
		return cbl.selectCompanyByCityId(countryId, stateId, cityId);
	}
	
	@DeleteMapping(path="/{companyId}")
	public ResponseEntity<Void> deleteCompany(@PathVariable @NotNull Long companyId)
	{
		return cbl.deleteCompany(companyId);
	}
	
	@PutMapping(path = "/{companyId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
										produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateFields(@PathVariable @NotNull Long companyId,@Valid @RequestBody CompanyUpdate cu) 
	{
		return cbl.updateFields(companyId, cu);
	}


}
