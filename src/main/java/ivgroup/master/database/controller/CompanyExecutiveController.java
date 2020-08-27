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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CompanyExecutiveBusinessLogic;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveInsert;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveLogin;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveLoginRequest;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveSelect;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveUpdate;

@RestController
@RequestMapping("/companyExecutive")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyExecutiveController {

	@Autowired
	CompanyExecutiveBusinessLogic cebl;
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyExecutive(@Valid @RequestBody CompanyExecutiveInsert ci)
	{
		return cebl.addCompanyExecutive(ci);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveSelect>> selectCompanyExecutive()
	{
		return cebl.selectCompanyExecutive();
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/{companyExecutiveID}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<@Valid CompanyExecutiveSelect> selectCompanyByCompanyExecutiveId(@PathVariable @NotNull Long companyExecutiveID)
	{
		return cebl.selectCompanyByCompanyExecutiveId(companyExecutiveID);
	}	
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/company/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveSelect>> selectCompanyExecutiveByCompanyId(@PathVariable @NotNull Long companyId)
	{
		return cebl.selectCompanyExecutiveByCompanyId(companyId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveSelect>> selectCompanyExecutiveByOwnerId(@PathVariable @NotNull Long ownerId)
	{
		return cebl.selectCompanyExecutiveByOwnerId(ownerId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/branch/{companyBranchId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveSelect>> selectCompanyExecutiveByCompanyBranchId(@PathVariable @NotNull Long companyBranchId)
	{
		return cebl.selectCompanyExecutiveByCompanyBranchId(companyBranchId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/subPosition/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveSelect>> selectCompanyExecutiveOfSubPosition(@PathVariable @NotNull Long companyExecutiveId)
	{
		return cebl.selectCompanyExecutiveOfSubPosition(companyExecutiveId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping
	public ResponseEntity<Void> deleteCompanyExecutive(@RequestParam(name = "companyExecutiveId") Long companyExecutiveId,@RequestParam(name = "companyId") Long companyId)
	{
		return cebl.deleteCompanyExecutive(companyExecutiveId, companyId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/{companyExecutiveId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateFields(@PathVariable @NotNull Long companyExecutiveId,@Valid @RequestBody CompanyExecutiveUpdate cu) 
	{
		return cebl.updateCompanyExecutiveFields(companyExecutiveId, cu);
	}
	
	@PostMapping(path="/login",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<CompanyExecutiveLogin> loginCompanyExecutive(@RequestBody CompanyExecutiveLoginRequest companyExecutiveLoginRequest)
	{
		return cebl.loginCompanyExecutive(companyExecutiveLoginRequest.getLoginId(), companyExecutiveLoginRequest.getPassword());
	}

}
