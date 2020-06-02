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
import ivgroup.master.database.bl.CompanyRegionBusinessLogic;
import ivgroup.master.database.dto.companyRegion.CompanyRegionInsert;
import ivgroup.master.database.dto.companyRegion.CompanyRegionSelect;
import ivgroup.master.database.dto.companyRegion.CompanyRegionUpdate;

@RestController
@RequestMapping("/companyRegion")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyRegionController {
	
	@Autowired
	CompanyRegionBusinessLogic crbl;
	
	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyRegion(@Valid @RequestBody CompanyRegionInsert cri) {
		return crbl.addCompanyRegion(cri);
	}
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyRegionSelect>> selectCompanyRegion() {
		return crbl.selectCompanyRegion();
	}
	
	@GetMapping(path= "/{companyRegionId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<@Valid CompanyRegionSelect> selectCompanyRegionByCompanyRegionID(@PathVariable @NotNull Long companyRegionId){
		return crbl.selectCompanyRegionByCompanyRegionID(companyRegionId);
	}
	
	@GetMapping(path= "/company/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyRegionSelect>> selectCompanyRegionByCompanyID(@PathVariable @NotNull Long companyId){
		return crbl.selectCompanyRegionByCompanyID(companyId);
	}

	@GetMapping(path= "/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyRegionSelect>> selectCompanyRegionByOwnerID(@PathVariable @NotNull Long ownerId){
		return crbl.selectCompanyRegionByOwnerID(ownerId);
	}
	
	@PutMapping(path = "/{companyRegionId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public  ResponseEntity<Void> updateCompanyRegion(@PathVariable @NotNull Long companyRegionId,@Valid @RequestBody CompanyRegionUpdate cru) {
		return crbl.updateCompanyRegion(companyRegionId, cru);
	}
	
	@DeleteMapping(path = "/{companyRegionId}")
	public  ResponseEntity<Void> deleteCompanyRegion(@PathVariable @NotNull Long companyRegionId)  {
		return crbl.deleteCompanyRegion(companyRegionId);
	}
	@PatchMapping(path = "/{companyRegionId}")
	public  ResponseEntity<Void> revokeCompanyRegion(@PathVariable @NotNull Long companyRegionId)  {
		return crbl.revokeCompanyRegion(companyRegionId);
	}
}
