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
import ivgroup.master.database.bl.PositionBusinessLogic;
import ivgroup.master.database.dto.position.PositionInsert;
import ivgroup.master.database.dto.position.PositionSelect;
import ivgroup.master.database.dto.position.PositionUpdate;

@RestController
@RequestMapping("/position")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class PositionController 
{
	@Autowired
	PositionBusinessLogic pbl;
	
	@GetMapping(path="/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<PositionSelect>> selectPosition(@PathVariable @NotNull Long ownerId)
	{
		return pbl.selectPosition(ownerId);
	}

	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addPosition(@RequestParam("companyExecutiveId") @NotNull Long companyExecutiveId,@Valid @RequestBody PositionInsert pi) 
	{
		return pbl.addPosition(companyExecutiveId,pi);
	}
	
	@PutMapping(path = "/{positionId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateFields(@RequestParam("companyExecutiveId") @NotNull Long companyExecutiveId,@PathVariable @NotNull Long positionId,@Valid @RequestBody PositionUpdate pu)
	{
		return pbl.updateFields(companyExecutiveId,positionId, pu);
	}

	@DeleteMapping(path="/{positionId}")
	public ResponseEntity<Void> deletePosition(@PathVariable @NotNull Long positionId)
	{
		return pbl.deletePosition(positionId);
	}
}
