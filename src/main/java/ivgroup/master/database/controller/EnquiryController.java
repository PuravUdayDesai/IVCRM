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

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.EnquiryBusinessLogic;
import ivgroup.master.database.dto.enquiry.EnquiryAccessListInsert;
import ivgroup.master.database.dto.enquiry.EnquiryAccessListSelect;
import ivgroup.master.database.dto.enquiry.EnquiryInsert;
import ivgroup.master.database.dto.enquiry.EnquiryNonAddedProductSelect;
import ivgroup.master.database.dto.enquiry.EnquiryProductInsert;
import ivgroup.master.database.dto.enquiry.EnquiryProductSelect;
import ivgroup.master.database.dto.enquiry.EnquirySelect;
import ivgroup.master.database.dto.enquiry.EnquiryUpdate;
import ivgroup.master.database.dto.enquiry.NonAccessibleExecutiveListSelect;	

@RestController
@RequestMapping("/enquiry")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class EnquiryController 
{
	@Autowired
	EnquiryBusinessLogic ebl;
	
	
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addEnquiry(@Valid @RequestBody EnquiryInsert ei)
	{
		return ebl.addEnquiry(ei);
	}
	
	@PostMapping(path="/product",
			consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Long> addEnquiryProduct(@Valid @RequestBody EnquiryProductInsert epi)
	{
		return ebl.addEnquiryProduct(epi);
	}
	
	@DeleteMapping(path="/product/{productId}")
	public ResponseEntity<Void> deleteEnquiryProduct(@PathVariable @NotNull Long productId,@RequestParam("companyExecutiveId") Long companyExecutiveId)  
	{
		return ebl.deleteEnquiryProduct(productId,companyExecutiveId);
	}
	
	@DeleteMapping(path="/{enquiryId}")
	public ResponseEntity<Void> deleteEnquiry(@PathVariable @NotNull Long enquiryId,@RequestParam("companyExecutiveId") Long companyExecutiveId)  
	{
		return ebl.deleteEnquiry(enquiryId,companyExecutiveId);
	}
		
	@PutMapping(path = "/{enquiryId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateEnquiryFields(@PathVariable @NotNull Long enquiryId,@Valid @RequestBody EnquiryUpdate eu)
	{
		return ebl.updateEnquiryFields(enquiryId, eu);
	}
	
	@PostMapping(path="/enquiryAccessList",
			consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addEnquiryAccessList(@Valid @RequestBody EnquiryAccessListInsert eai,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.addEnquiryAccessList(eai,companyExecutiveId);
	}
	
	@GetMapping(path="/enquiryAccessList/{enquiryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryAccessListSelect>> selectEnquiryAccessListByEnquiryId(@PathVariable @NotNull Long enquiryId)
	{
		return ebl.selectEnquiryAccessListByEnquiryId(enquiryId);
	}

	@DeleteMapping(path="/enquiryAccessList/{companyExecutiveAccessId}")
	public ResponseEntity<Void> deleteEnquiryAccessListExecutive(@PathVariable @NotNull Long companyExecutiveAccessId,@RequestParam("enquiryId") Long enquiryId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.deleteEnquiryAccessListExecutive(companyExecutiveAccessId,enquiryId,companyExecutiveId);
	}
	
	@GetMapping(path="/enquiryNonAddedProducts/{enquiryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryNonAddedProductSelect>> selectEnquiryNonAddedProducts(@PathVariable @NotNull Long enquiryId)
	{
		return ebl.selectEnquiryNonAddedProducts(enquiryId);
	}
	
	//NOT REQUIRED
	@GetMapping(path="/enquiryProduct/{enquiryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryProductSelect>> selectEnquiryProduct(@PathVariable @NotNull Long enquiryId)
	{
		return ebl.selectEnquiryProduct(enquiryId);
	}
		
	@GetMapping(path="/country/{countryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByCountry(@PathVariable @NotNull  Long countryId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.selectEnquiryByCountry(companyExecutiveId, countryId);
	}

	@GetMapping(path="/state/{stateId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByState(@PathVariable @NotNull  Long stateId,@RequestParam("companyExecutiveId") Long companyExecutiveId) 
	{
		return ebl.selectEnquiryByState(companyExecutiveId, stateId);
	}
	
	@GetMapping(path="/city/{cityId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByCity(@PathVariable @NotNull  Long cityId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.selectEnquiryByCity(companyExecutiveId, cityId);
	}

	@GetMapping(path="/area/{areaId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByArea(@PathVariable @NotNull Long areaId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.selectEnquiryByArea(companyExecutiveId, areaId);
	}
	
	@GetMapping(path="/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByCompanyExecutiveId(@PathVariable @NotNull Long companyExecutiveId)
	{
		return ebl.selectEnquiryByCompanyExecutiveId(companyExecutiveId);
	}
	
	@GetMapping(path="/client/{clientId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByClient(@PathVariable @NotNull Long clientId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.selectEnquiryByClient(companyExecutiveId, clientId);
	}
	
	@GetMapping(path="/product/{productId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByProduct(@PathVariable @NotNull Long productId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.selectEnquiryByProduct(companyExecutiveId, productId);
	}
	
	@GetMapping(path="/enquiryType/{enquiryTypeId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquirySelect>> selectEnquiryByEnquiryType(@PathVariable @NotNull Long enquiryTypeId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.selectEnquiryByEnquiryType(companyExecutiveId, enquiryTypeId);
	}
	
	
	@GetMapping(path="/enquiryNonAccessibleExecutives/{enquiryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid NonAccessibleExecutiveListSelect>> selectNonAccessibleExecutivesOfEnquiry(@PathVariable @NotNull Long enquiryId)
	{
		return ebl.selectNonAccessibleExecutivesOfEnquiry(enquiryId);
	}
}