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
import ivgroup.master.database.bl.CompanyBranchBusinessLogic;
import ivgroup.master.database.dto.companyBranch.CompanyBranchInsert;
import ivgroup.master.database.dto.companyBranch.CompanyBranchSelect;
import ivgroup.master.database.dto.companyBranch.CompanyBranchUpdate;

@RestController
@RequestMapping("/companyBranch")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyBranchController {
	
	@Autowired
	CompanyBranchBusinessLogic cbbl;
		
	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCompanyBranch(@Valid @RequestBody CompanyBranchInsert cb)  {
			return cbbl.addCompanyBranch(cb);
	}
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranch()
	{
		return cbbl.selectCompanyBranch();
	}
	@GetMapping(path="{companyBranchId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<CompanyBranchSelect> selectCompanyBranchByCompanyBranchID(@PathVariable @NotNull Long companyBranchId) 
	{
		return cbbl.selectCompanyBranchByCompanyBranchID(companyBranchId);
	}
	@GetMapping(path="/company/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByCompanyID(@PathVariable @NotNull Long companyId)
	{
		return cbbl.selectCompanyBranchByCompanyID(companyId);
	}
	@GetMapping(path="/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByOwnerID(@PathVariable @NotNull Long ownerId)
	{
		return cbbl.selectCompanyBranchByOwnerID(ownerId);
	}
	@GetMapping(path="region/{companyRegionID}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByCompanyRegionID(@PathVariable @NotNull Long companyRegionID)
	{
		return cbbl.selectCompanyBranchByCompanyRegionID(companyRegionID);
	}
	@GetMapping(path="area/{companyAreaID}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyBranchSelect>> selectCompanyBranchByCompanyAreaID(@PathVariable @NotNull Long companyAreaID)
	{
		return cbbl.selectCompanyBranchByCompanyAreaID(companyAreaID);
	}

	@PutMapping(path = "/{companyBranchId}")
	public ResponseEntity<Void> updateCompanyBranch(@PathVariable @NotNull Long companyBranchId,@Valid @RequestBody CompanyBranchUpdate cu) {
		return cbbl.updateCompanyBranch(companyBranchId, cu);
	}
	
	@DeleteMapping(path = "/{companyBranchId}")	
	public ResponseEntity<Void> deleteCompanyBranch(@PathVariable @NotNull Long companyBranchId)  {
		return cbbl.deleteCompanyBranch(companyBranchId);
	}

	@PatchMapping(path = "/{companyBranchId}")
	public ResponseEntity<Void> revokeCompanyBranch(@PathVariable @NotNull Long companyBranchId)  {
		return cbbl.revokeCompanyBranch(companyBranchId);
	}
}
