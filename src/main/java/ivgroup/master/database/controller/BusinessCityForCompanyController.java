package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.Valid;

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
import ivgroup.master.database.bl.BusinessCityForCompanyBusinessLogic;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompany;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyInsert;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyUpdate;

@RestController
@RequestMapping("businessCityForCompany")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class BusinessCityForCompanyController {
	@Autowired
	BusinessCityForCompanyBusinessLogic businessCityForCompany_business_logic;

	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<BusinessCityForCompany>> getAllBusinessCityForCompanyInfo() {
		return businessCityForCompany_business_logic.getAllBusinessCityForCompany();
	}

	@GetMapping(path = "city/{businessCityForCompany_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<BusinessCityForCompany> getOneBusinessCityForCompanyInfo(
			@PathVariable long businessCityForCompany_id) {
		return businessCityForCompany_business_logic.getOneBusinessCityForCompanyById(businessCityForCompany_id);
	}

	@GetMapping(path = "/{businessCityForCompany_Companyid}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<BusinessCityForCompany>> getBusinessCityForCompanyInfoByCompanyId(
			@PathVariable long businessCityForCompany_Companyid) {
		return businessCityForCompany_business_logic.getBusinessCityForCompanyInfoByCompanyId(businessCityForCompany_Companyid);
	}
	
	@GetMapping(path = "search/{search_content}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<BusinessCityForCompany>> searchInBusinessCityForCompany(
			@PathVariable String search_content) {
		return businessCityForCompany_business_logic.searchInBusinessCityForCompany(search_content);
	}

	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addBusinessCityForCompanyName(
			@Valid @RequestBody BusinessCityForCompanyInsert businessCityForCompany_info) {
		return businessCityForCompany_business_logic.addBusinessCityForCompany(businessCityForCompany_info);
	}

	@PutMapping(path = "/{businessCityForCompany_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateBusinessCityForCompanyName(@PathVariable Long businessCityForCompany_id,
			@Valid @RequestBody BusinessCityForCompanyUpdate businessCityForCompany_info) {
		return businessCityForCompany_business_logic.updateBusinessCityForCompany(businessCityForCompany_id,
				businessCityForCompany_info);
	}

	@DeleteMapping(path = "/{businessCityForCompany_id}")
	public ResponseEntity<Void> delBusinessCityForCompanyName(@PathVariable Long businessCityForCompany_id) {
		return businessCityForCompany_business_logic.deleteBusinessCityForCompany(businessCityForCompany_id);
	}

	@PatchMapping(path = "revoke/{businessCityForCompany_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> revokeBusinessCityForCompanyInfo(@PathVariable Long businessCityForCompany_id) {
		return businessCityForCompany_business_logic.revokeBusinessCityForCompany(businessCityForCompany_id);
	}

}
