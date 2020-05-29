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
	
	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyArea(@Valid @RequestBody CompanyAreaInsert cri) {
		return crbl.addCompanyArea(cri);
	}

	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyArea() {
		return crbl.selectCompanyArea();
	}
	
	@GetMapping(path= "/{companyAreaId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<CompanyAreaSelect> selectCompanyAreaByCompanyAreaID(@PathVariable @NotNull Long companyAreaId){
		return crbl.selectCompanyAreaByCompanyAreaID(companyAreaId);
	}
	
	@GetMapping(path= "/company/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyAreaByCompanyID(@PathVariable @NotNull Long companyId){
		return crbl.selectCompanyAreaByCompanyID(companyId);
	}
	
	@GetMapping(path= "/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyAreaByOwnerID(@PathVariable @NotNull Long ownerId){
		return crbl.selectCompanyAreaByOwnerID(ownerId);
	}
	
	@GetMapping(path= "/region/{companyRegionId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyAreaSelect>> selectCompanyAreaByCompanyRegionID(@PathVariable @NotNull Long companyRegionId){
		return crbl.selectCompanyAreaByRegionID(companyRegionId);
	}
	
	@PutMapping(path = "/{companyAreaId}")
	public  ResponseEntity<Void> updateCompanyArea(@PathVariable @NotNull Long companyAreaId,@Valid @RequestBody CompanyAreaUpdate cru) {
		return crbl.updateCompanyArea(companyAreaId, cru);
	}
	
	@DeleteMapping(path = "{companyAreaId}")
	public  ResponseEntity<Void> deleteCompanyArea(@PathVariable @NotNull Long companyAreaId)  {
		return crbl.deleteCompanyArea(companyAreaId);
	}
	@PatchMapping(path = "{companyAreaId}")
	public  ResponseEntity<Void> revokeCompanyArea(@PathVariable @NotNull Long companyAreaId)  {
		return crbl.revokeCompanyArea(companyAreaId);
	}
}
