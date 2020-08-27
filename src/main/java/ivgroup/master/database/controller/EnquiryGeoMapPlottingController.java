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

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.EnquiryGeoMapPlottingBusinessLogic;
import ivgroup.master.database.dto.geoMapPlotting.EnquiryGeoMapPlotting;

@RestController
@RequestMapping("/enquiryGeoMap")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class EnquiryGeoMapPlottingController
{
	@Autowired
	EnquiryGeoMapPlottingBusinessLogic egbl;
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/owner",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByOwnerId(@RequestParam("ownerId") @NotNull Long ownerId)
	{
		return egbl.getEnquiryGeoMapPlottingByOwnerId(ownerId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/company",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryGeoMapPlotting>> getEnquryGeoMapPlottingByCompanyId(@RequestParam("companyId") @NotNull Long companyId)
	{
		return egbl.getEnquryGeoMapPlottingByCompanyId(companyId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/country",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByCountry(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId)
	{
		return egbl.getEnquiryGeoMapPlottingByCountry(ownerId, countryId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/state",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByState(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId)
	{
		return egbl.getEnquiryGeoMapPlottingByState(ownerId, countryId, stateId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/city",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByCity(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId,@RequestParam("cityId") @NotNull  Long cityId)
	{
		return egbl.getEnquiryGeoMapPlottingByCity(ownerId, countryId, stateId, cityId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/area",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByArea(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId,@RequestParam("cityId") @NotNull  Long cityId,@RequestParam("areaId") @NotNull  Long areaId)
	{
		return egbl.getEnquiryGeoMapPlottingByArea(ownerId, countryId, stateId, cityId, areaId);
	}
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/companyExecutive",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid EnquiryGeoMapPlotting>> getEnquiryGeoMapPlottingByCompanyExecutive(@RequestParam("companyExecutiveId") @NotNull Long companyExecutiveId)
	{
		return egbl.getEnquiryGeoMapPlottingByCompanyExecutive(companyExecutiveId);
	}
}
