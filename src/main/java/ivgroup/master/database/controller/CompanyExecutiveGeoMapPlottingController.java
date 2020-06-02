package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.Valid;
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
import ivgroup.master.database.bl.CompanyExecutiveGeoMapPlottingBusinessLogic;
import ivgroup.master.database.dto.geoMapPlotting.CompanyExecutiveGeoMapPlotting;

@RestController
@RequestMapping("/companyExecutiveGeoMap")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyExecutiveGeoMapPlottingController 
{
	@Autowired
	CompanyExecutiveGeoMapPlottingBusinessLogic cgbl;
	
	@GetMapping(path="/owner",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByOwnerId(@RequestParam("ownerId") @NotNull Long ownerId)
	{
		return cgbl.getCompanyExecutiveGeoMapByOwnerId(ownerId);
	}

	@GetMapping(path="/company",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByCompanyId(@RequestParam("companyId") @NotNull Long companyId)
	{
		return cgbl.getCompanyExecutiveGeoMapByCompanyId(companyId);
	}

	@GetMapping(path="/country",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByCountryId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId)
	{
		return cgbl.getCompanyExecutiveGeoMapByCountryId(ownerId, countryId);
	}

	@GetMapping(path="/state",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByStateId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId)
	{
		return cgbl.getCompanyExecutiveGeoMapByStateId(ownerId, countryId, stateId);
	}
	
	@GetMapping(path="/city",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyExecutiveGeoMapPlotting>> getCompanyExecutiveGeoMapByCityId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId,@RequestParam("cityId") @NotNull  Long cityId)
	{
		return cgbl.getCompanyExecutiveGeoMapByCityId(ownerId, countryId, stateId, cityId);
	}
}
