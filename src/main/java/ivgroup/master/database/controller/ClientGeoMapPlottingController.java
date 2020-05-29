package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.ClientGeoMapPlottingBusinessLogic;
import ivgroup.master.database.dto.geoMapPlotting.ClientGeoMapPlotting;

@RestController
@RequestMapping("/clientGeoMap")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class ClientGeoMapPlottingController 
{
	@Autowired
	ClientGeoMapPlottingBusinessLogic cgbl;
	
	@GetMapping(path="/owner",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByOwnerId(@RequestParam("ownerId") @NotNull Long ownerId)
	{
		return cgbl.getClientGeoMapByOwnerId(ownerId);
	}
	
	@GetMapping(path="/company",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByCompanyId(@RequestParam("companyId") @NotNull Long companyId)
	{
		return cgbl.getClientGeoMapByCompanyId(companyId);
	}

	@GetMapping(path="/country",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByCountryId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId)
	{	
		return cgbl.getClientGeoMapByCountryId(ownerId, countryId);
	}
	
	@GetMapping(path="/state",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByStateId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId) 
	{
		return cgbl.getClientGeoMapByStateId(ownerId, countryId, stateId);
	}

	@GetMapping(path="/city",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByCityId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId,@RequestParam("cityId") @NotNull  Long cityId)
	{
		return cgbl.getClientGeoMapByCityId(ownerId, countryId, stateId, cityId);
	}

	@GetMapping(path="/area",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<ClientGeoMapPlotting>> getClientGeoMapByAreaId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId,@RequestParam("cityId") @NotNull  Long cityId,@RequestParam("areaId") @NotNull Long areaId)
	{
		return cgbl.getClientGeoMapByAreaId(ownerId, countryId, stateId, cityId, areaId);
	}
}
