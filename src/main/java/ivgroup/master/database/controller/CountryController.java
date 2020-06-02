package ivgroup.master.database.controller;

import java.util.List;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.CountryBusinessLogic;
import ivgroup.master.database.dto.country.Country;
import ivgroup.master.database.dto.country.CountryInsert;
import ivgroup.master.database.dto.country.CountryUpdate;

@RestController
@RequestMapping("country")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CountryController {

	@Autowired
	CountryBusinessLogic country_business_logic;

	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid Country>> getAllCountryInfo() {
		return country_business_logic.getAllCountry();
	}

	@GetMapping(path = "/{country_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<@Valid Country> getOneCountryInfo(@PathVariable long country_id) {
		return country_business_logic.getOneCountryById(country_id);
	}

	@GetMapping(path = "search/{search_content}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid Country>> searchInCountry(@PathVariable String search_content) {
		return country_business_logic.searchInCountry(search_content);
	}

	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCountryName(@Valid @RequestBody CountryInsert country_info) {
		return country_business_logic.addCountry(country_info);
	}

	@PutMapping(path = "/{country_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateCountryName(@PathVariable long country_id,
			@Valid @RequestBody CountryUpdate country_info) {
		return country_business_logic.updateCountry(country_id, country_info);
	}

	@DeleteMapping(path = "/{country_id}")
	public ResponseEntity<Void> delCountryName(@PathVariable Long country_id) {
		return country_business_logic.deleteCountry(country_id);
	}

	@PatchMapping(path = "revoke/{country_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> revokeCountryInfo(@PathVariable Long country_id) {
		return country_business_logic.revokeCountry(country_id);
	}
}
