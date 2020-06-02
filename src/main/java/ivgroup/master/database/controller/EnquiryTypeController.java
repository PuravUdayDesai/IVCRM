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
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.EnquiryTypeBusinessLogic;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeInsert;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeSelect;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeUpdate;

@RestController
@RequestMapping("/enquiryType")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class EnquiryTypeController
{
	@Autowired
	EnquiryTypeBusinessLogic ebl;
	
	@GetMapping(path="/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryTypeSelect>> selectEnquiryTypeByCompanyId(@PathVariable @NotNull Long companyId)
	{
		return ebl.selectEnquiryTypeByCompanyId(companyId);
	}
	
	@GetMapping(path="/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryTypeSelect>> selectEnquiryTypeByOwnerId(@PathVariable @NotNull Long ownerId)
	{
		return ebl.selectEnquiryTypeByOwnerId(ownerId);
	}
	
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addEnquiryType(@Valid @RequestBody EnquiryTypeInsert eti)
	{
		return ebl.addEnquiryType(eti);
	}

	@PutMapping(path = "/{enquiryTypeId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateEnquiryTypeAllFields(@PathVariable @NotNull Long enquiryTypeId,@Valid @RequestBody EnquiryTypeUpdate etu)
	{
		return ebl.updateEnquiryTypeAllFields(enquiryTypeId, etu);			
	}
	@DeleteMapping(path="/{enquiryTypeId}")
	public ResponseEntity<Void> deleteEnquiryType(@PathVariable @NotNull Long enquiryTypeId)
	{
		return ebl.deleteEnquiryType(enquiryTypeId);
	}
}
