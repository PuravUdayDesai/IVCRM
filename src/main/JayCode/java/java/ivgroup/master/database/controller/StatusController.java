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
import ivgroup.master.database.bl.StatusBusinessLogic;
import ivgroup.master.database.dto.status.StatusInsert;
import ivgroup.master.database.dto.status.StatusSelect;
import ivgroup.master.database.dto.status.StatusUpdate;

@RestController
@RequestMapping("/status")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class StatusController 
{
	@Autowired
	StatusBusinessLogic sbl;
	
	@GetMapping(path="/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<StatusSelect>> selectStatusByCompanyId(@PathVariable @NotNull Long companyId) 
	{
		return sbl.selectStatusByCompanyId(companyId);
	}

	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addStatus(@Valid @RequestBody StatusInsert si)
	{
		return sbl.addStatus(si);
	}

	@DeleteMapping(path="/{statusId}")
	public ResponseEntity<Void> deleteStatus(@PathVariable @NotNull Long statusId) 
	{	
		return sbl.deleteStatus(statusId);
	}
	
	@PutMapping(path = "/{statusId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateStatusFields(@PathVariable @NotNull Long statusId,@Valid @RequestBody StatusUpdate su)
	{
		return sbl.updateStatusFields(statusId, su);
	}
}
