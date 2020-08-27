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

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.ClientBusinessLogic;
import ivgroup.master.database.dto.client.ClientContactCheckSelect;
import ivgroup.master.database.dto.client.ClientInsert;
import ivgroup.master.database.dto.client.ClientSelect;
import ivgroup.master.database.dto.client.ClientUpdate;

@RestController
@RequestMapping("/client")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class ClientController 
{
	
	@Autowired
	ClientBusinessLogic cbl;
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/company/{companyId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ClientSelect>> selectClientByCompanyId(@PathVariable @NotNull Long companyId)
	{
		return cbl.selectClientByCompanyId(companyId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/country/{countryId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ClientSelect>> selectClientByCountryId(@PathVariable @NotNull Long countryId)  
	{
		return cbl.selectClientByCountryId(countryId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/state/{stateId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ClientSelect>> selectClientByStateId(@PathVariable @NotNull Long stateId)  
	{
		return cbl.selectClientByStateId(stateId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/city/{cityId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ClientSelect>> selectClientByCityId(@PathVariable @NotNull Long cityId)  
	{
		return cbl.selectClientByCityId(cityId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/area/{areaId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ClientSelect>> selectClientByAreaId(@PathVariable @NotNull Long areaId) 
	{
		return cbl.selectClientByAreaId(areaId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/owner/{ownerId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ClientSelect>> selectClientByOwnerId(@PathVariable @NotNull Long ownerId) 
	{
		return cbl.selectClientByOwnerId(ownerId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PostMapping(consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addClient(@Valid @RequestBody ClientInsert ci)  
	{
		return cbl.addClient(ci);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@PutMapping(path = "/{clientId}",	consumes = { 	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, 
			produces = {	MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateClientFields(@PathVariable @NotNull Long clientId,@Valid @RequestBody ClientUpdate cu)
	{
		return cbl.updateClientFields(clientId, cu);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@DeleteMapping(path="/{clientId}")
	public ResponseEntity<Void> deleteClientAndClientLocation(@PathVariable @NotNull Long clientId)
	{
		return cbl.deleteClientAndClientLocation(clientId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/checkForClientContact/{companyExecutiveId}",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<ClientContactCheckSelect> checkForClientContactNumber(@RequestParam("contactNumber") @NotNull String contactNumber,@PathVariable @NotNull Long companyExecutiveId)
	{
		return cbl.checkForClientContactNumber(contactNumber, companyExecutiveId);
	}

}
