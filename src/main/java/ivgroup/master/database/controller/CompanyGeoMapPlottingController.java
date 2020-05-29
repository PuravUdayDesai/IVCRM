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
import ivgroup.master.database.bl.CompanyGeoMapPlottingBusinessLogic;
import ivgroup.master.database.dto.geoMapPlotting.CompanyGeoMapPlotting;

@RestController
@RequestMapping("/companyGeoMap")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyGeoMapPlottingController 
{

	@Autowired
	CompanyGeoMapPlottingBusinessLogic cgpbl;
	
	@GetMapping(path="/owner",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyGeoMapPlotting>> getComapnyByOwnerId(@RequestParam("ownerId") @NotNull Long ownerId) 
	{
		return cgpbl.getComapnyByOwnerId(ownerId);
	}

	@GetMapping(path="/country",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyGeoMapPlotting>> getCompanyByCountry(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId)
	{	
		return cgpbl.getCompanyByCountry(ownerId, countryId);
	}

	@GetMapping(path="/state",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyGeoMapPlotting>> getCompanyByState(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId)
	{
		return cgpbl.getCompanyByState(ownerId, countryId, stateId);
	}

	@GetMapping(path="/city",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CompanyGeoMapPlotting>> getCompanyByCity(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId,@RequestParam("cityId") @NotNull  Long cityId)
	{
		return cgpbl.getCompanyByCity(ownerId, countryId, stateId, cityId);
	}
}
