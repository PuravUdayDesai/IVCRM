package ivgroup.master.database.controller;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.EnquiryBusinessLogic;
import ivgroup.master.database.dto.enquiry.EnquiryInsert;
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
	public ResponseEntity<Void> deleteEnquiryProduct(@PathVariable @NotNull Long productId)  
	{
		return ebl.deleteEnquiryProduct(productId);
	}

	@DeleteMapping(path="/{enquiryId}")
	public ResponseEntity<Void> deleteEnquiry(@PathVariable @NotNull Long enquiryId)  
	{
		return ebl.deleteEnquiry(enquiryId);
	}

	@PutMapping(path = "/{enquiryId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateEnquiryFields(@PathVariable @NotNull Long enquiryId,@Valid @RequestBody EnquiryUpdate eu)
	{
		return ebl.updateEnquiryFields(enquiryId, eu);
	}

	
	
	
}
