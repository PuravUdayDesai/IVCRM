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
import ivgroup.master.database.bl.CompanyBranchGeoMapPlottingBusinessLogic;
import ivgroup.master.database.dto.geoMapPlotting.CompanyBranchGeoMapPlotting;

@RestController
@RequestMapping("/companyBranchGeoMap")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyBranchGeoMapPlottingController 
{
	@Autowired
	CompanyBranchGeoMapPlottingBusinessLogic cbbl;
	
	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/owner",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyBranchGeoMapPlotting>> getCompaynBranchByOwnerId(@RequestParam("ownerId") @NotNull Long ownerId)
	{
		return cbbl.getCompaynBranchByOwnerId(ownerId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/company",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyBranchGeoMapPlotting>> getCompanyBranchByCompanyId(@RequestParam("companyId") @NotNull Long companyId)
	{
		return cbbl.getCompanyBranchByCompanyId(companyId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/country",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyBranchGeoMapPlotting>> getCompanyBranchByCountryId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId)
	{
		return cbbl.getCompanyBranchByCountryId(ownerId, countryId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/state",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyBranchGeoMapPlotting>> getCompanyBranchByStateId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId)
	{
		return cbbl.getCompanyBranchByStateId(ownerId, countryId, stateId);
	}

	@ApiImplicitParams({
		@ApiImplicitParam(name="Authorization",value="${ivclient.request.authorization.description}",paramType="header")
	})
	@GetMapping(path="/city",produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyBranchGeoMapPlotting>> getCompanyBranchByCityId(@RequestParam("ownerId") @NotNull Long ownerId,@RequestParam("countryId") @NotNull  Long countryId,@RequestParam("stateId") @NotNull  Long stateId,@RequestParam("cityId") @NotNull  Long cityId)
	{
		return cbbl.getCompanyBranchByCityId(ownerId, countryId, stateId, cityId);
	}
}
