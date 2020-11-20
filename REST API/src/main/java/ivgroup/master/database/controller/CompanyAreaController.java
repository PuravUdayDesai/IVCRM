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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CompanyAreaBusinessLogic;
import ivgroup.master.database.dto.companyArea.CompanyAreaInsert;
import ivgroup.master.database.dto.companyArea.CompanyAreaSelect;
import ivgroup.master.database.dto.companyArea.CompanyAreaUpdate;

@RestController
@RequestMapping("/companyArea")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyAreaController {
	@Autowired
	CompanyAreaBusinessLogic crbl;
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyArea(@Valid @RequestBody CompanyAreaInsert cri) {
		return crbl.addCompanyArea(cri);
	}

	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyAreaSelect>> selectCompanyArea() {
		return crbl.selectCompanyArea();
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path= "/{companyAreaId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<@Valid CompanyAreaSelect> selectCompanyAreaByCompanyAreaID(@PathVariable @NotNull Long companyAreaId){
		return crbl.selectCompanyAreaByCompanyAreaID(companyAreaId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path= "/company/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyAreaSelect>> selectCompanyAreaByCompanyID(@PathVariable @NotNull Long companyId){
		return crbl.selectCompanyAreaByCompanyID(companyId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path= "/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyAreaSelect>> selectCompanyAreaByOwnerID(@PathVariable @NotNull Long ownerId){
		return crbl.selectCompanyAreaByOwnerID(ownerId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path= "/region/{companyRegionId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyAreaSelect>> selectCompanyAreaByCompanyRegionID(@PathVariable @NotNull Long companyRegionId){
		return crbl.selectCompanyAreaByRegionID(companyRegionId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/{companyAreaId}")
	public  ResponseEntity<Void> updateCompanyArea(@PathVariable @NotNull Long companyAreaId,@Valid @RequestBody CompanyAreaUpdate cru) {
		return crbl.updateCompanyArea(companyAreaId, cru);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping(path = "{companyAreaId}")
	public  ResponseEntity<Void> deleteCompanyArea(@PathVariable @NotNull Long companyAreaId)  {
		return crbl.deleteCompanyArea(companyAreaId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PatchMapping(path = "{companyAreaId}")
	public  ResponseEntity<Void> revokeCompanyArea(@PathVariable @NotNull Long companyAreaId)  {
		return crbl.revokeCompanyArea(companyAreaId);
	}
}
