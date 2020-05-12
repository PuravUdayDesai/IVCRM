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
import ivgroup.master.database.bl.CompanyBranchTypeBusinessLogic;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeInsert;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeSelect;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeUpdate;

@RestController
@RequestMapping("/companyBranchType")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyBranchTypeController 
{
	@Autowired
	CompanyBranchTypeBusinessLogic cbbl;
	
	@GetMapping(path="/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyBranchTypeSelect>> selectCompanyBranchTypeByCompanyId(@PathVariable @NotNull Long companyId)
	{
		return cbbl.selectCompanyBranchTypeByCompanyId(companyId);
	}
	
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyBranchType(@Valid @RequestBody CompanyBranchTypeInsert cbi)
	{
		return cbbl.addCompanyBranchType(cbi);
	}
	
	@PutMapping(path = "/{companyId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateCompanyBranchTypeFields(@PathVariable @NotNull Long companyId,@Valid @RequestBody CompanyBranchTypeUpdate cbu)
	{
		return cbbl.updateCompanyBranchTypeFields(companyId, cbu);
	}
	
	@DeleteMapping(path="/{companyBranchTypeId}")
	public ResponseEntity<Void> deleteCompanyBranchType(@PathVariable @NotNull Long companyBranchTypeId) 
	{
		return cbbl.deleteCompanyBranchType(companyBranchTypeId);
	}
}
