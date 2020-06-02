package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CompanyAddressDetailsBusinessLogic;
import ivgroup.master.database.dto.companyAddressDetails.CompanyAddressDetailsSelect;
import ivgroup.master.database.dto.companyAddressDetails.CompanyAddressDetailsUpdate;

@RestController
@RequestMapping("/companyAddressDetails")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CompanyAddressDetailsController {
	
	@Autowired
	CompanyAddressDetailsBusinessLogic cabl;
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid CompanyAddressDetailsSelect>> selectCompanyAddressDetails()
	{
		return cabl.selectCompanyAddressDetails();
	}
	
	@PutMapping(path = "/{companyAddressDetailId}")
	public ResponseEntity<Void> updateCompanyAddressDetails(@PathVariable Long companyAddressDetailId,@Valid @RequestBody CompanyAddressDetailsUpdate cbu){
		return cabl.updateCompanyAddressDetails(companyAddressDetailId, cbu);
	}

}
