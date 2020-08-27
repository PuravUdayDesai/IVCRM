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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.BusinessAreaForCompanyBusinessLogic;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompany;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyByCityID;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyInsert;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyUpdate;

@RestController
@RequestMapping("businessAreaForCompany")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class BusinessAreaForCompanyController {
	@Autowired
	BusinessAreaForCompanyBusinessLogic businessAreaForCompany_business_logic;

	/*
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<BusinessAreaForCompany>> getAllBusinessAreaForCompanyInfo() {
		return businessAreaForCompany_business_logic.getAllBusinessAreaForCompany();
	}
	*/

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path = "/{businessAreaForCompany_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<BusinessAreaForCompany>> getBusinessAreaForCompanyInfoUsingId(
			@PathVariable long businessAreaForCompany_id) {
		return businessAreaForCompany_business_logic.getOneBusinessAreaForCompanyById(businessAreaForCompany_id);
	}
	
	/*
	@GetMapping(path = "area/{businessAreaForCompany_Areaid}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<BusinessAreaForCompany> getBusinessAreaForCompanyInfoByAreaId(
			@PathVariable long businessAreaForCompany_Areaid) {
		return businessAreaForCompany_business_logic.getBusinessAreaForCompanyByAreaId(businessAreaForCompany_Areaid);
	}
	*/
	

	/*
	@GetMapping(path = "search/{search_content}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<BusinessAreaForCompany>> searchInBusinessAreaForCompany(
			@PathVariable String search_content) {
		return businessAreaForCompany_business_logic.searchInBusinessAreaForCompany(search_content);
	}
	*/

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path = "/city/{city_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<BusinessAreaForCompanyByCityID>> selectBusinessAreaUsingCityId(@PathVariable Long city_id,
			@RequestParam("ownerID") Long owner_id) {
		return businessAreaForCompany_business_logic.selectBusinessAreaUsingCityId(city_id, owner_id);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addBusinessAreaForCompanyName(
			@Valid @RequestBody BusinessAreaForCompanyInsert businessAreaForCompany_info) {
		return businessAreaForCompany_business_logic.addBusinessAreaForCompany(businessAreaForCompany_info);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/{businessAreaForCompany_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateBusinessAreaForCompanyName(@PathVariable Long businessAreaForCompany_id,
			@Valid @RequestBody BusinessAreaForCompanyUpdate businessAreaForCompany_info) {
		return businessAreaForCompany_business_logic.updateBusinessAreaForCompany(businessAreaForCompany_id,
				businessAreaForCompany_info);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping(path = "/{businessAreaForCompany_id}")
	public ResponseEntity<Void> delBusinessAreaForCompanyName(@PathVariable Long businessAreaForCompany_id) {
		return businessAreaForCompany_business_logic.deleteBusinessAreaForCompany(businessAreaForCompany_id);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PatchMapping(path = "revoke/{businessAreaForCompany_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> revokeBusinessAreaForCompanyInfo(@PathVariable Long businessAreaForCompany_id) {
		return businessAreaForCompany_business_logic.revokeBusinessAreaForCompany(businessAreaForCompany_id);
	}

}