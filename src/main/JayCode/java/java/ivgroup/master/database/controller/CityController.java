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
import ivgroup.master.database.bl.CityBusinessLogic;
import ivgroup.master.database.dto.city.City;
import ivgroup.master.database.dto.city.CityInfoFromStateId;
import ivgroup.master.database.dto.city.CityInsert;
import ivgroup.master.database.dto.city.CityUpdate;

@RestController
@RequestMapping("city")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class CityController {

	@Autowired
	CityBusinessLogic city_business_logic;

	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<City>> getAllCityInfo() {
		return city_business_logic.getAllCity();
	}

	@GetMapping(path = "/{city_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<City> getOneCityInfo(@PathVariable long city_id) {
		return city_business_logic.getOneCityById(city_id);
	}

	@GetMapping(path = "search/{search_content}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<City>> searchInCity(@PathVariable String search_content) {
		return city_business_logic.searchInCity(search_content);
	}
	
	@GetMapping(path = "/state/{state_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<CityInfoFromStateId>> selectCityUsingStateId(@PathVariable Long state_id) {
		return city_business_logic.selectCityUsingStateId(state_id);
	}


	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addCity(@Valid @RequestBody CityInsert city_info) {
		return city_business_logic.addCity(city_info);
	}

	@PutMapping(path = "/{city_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateCountryName(@PathVariable long city_id,
			@Valid @RequestBody CityUpdate city_info) {
		return city_business_logic.updateCity(city_id, city_info);
	}

	@DeleteMapping(path = "/{city_id}")
	public ResponseEntity<Void> delCityName(@PathVariable Long city_id) {
		return city_business_logic.deleteCity(city_id);
	}

	@PatchMapping(path = "revoke/{city_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> revokeCityInfo(@PathVariable Long city_id) {
		return city_business_logic.revokeCity(city_id);
	}
}
