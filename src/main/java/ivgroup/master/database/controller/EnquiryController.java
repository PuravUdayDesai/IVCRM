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
import ivgroup.master.database.dto.enquiry.EnquiryUpdate;	

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
	public ResponseEntity<List<EnquiryAccessListSelect>> selectEnquiryAccessListByEnquiryId(@PathVariable @NotNull Long enquiryId)
	{
		return ebl.selectEnquiryAccessListByEnquiryId(enquiryId);
	}

	@DeleteMapping(path="/enquiryAccessList/{companyExecutiveAccessId}")
	public ResponseEntity<Void> deleteEnquiryAccessListExecutive(@PathVariable @NotNull Long companyExecutiveAccessId,@RequestParam("enquiryId") Long enquiryId,@RequestParam("companyExecutiveId") Long companyExecutiveId)
	{
		return ebl.deleteEnquiryAccessListExecutive(companyExecutiveAccessId,enquiryId,companyExecutiveId);
	}
	
	@GetMapping(path="/enquiryNonAddedProducts/{enquiryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<EnquiryNonAddedProductSelect>> selectEnquiryNonAddedProducts(@PathVariable @NotNull Long enquiryId)
	{
		return ebl.selectEnquiryNonAddedProducts(enquiryId);
	}
	
}
