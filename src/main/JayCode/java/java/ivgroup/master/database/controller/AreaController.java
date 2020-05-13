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
import ivgroup.master.database.bl.AreaBusinessLogic;
import ivgroup.master.database.dto.area.Area;
import ivgroup.master.database.dto.area.AreaInfoFromCityId;
import ivgroup.master.database.dto.area.AreaInsert;
import ivgroup.master.database.dto.area.AreaUpdate;

@RestController
@RequestMapping("area")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class AreaController {

	@Autowired
	AreaBusinessLogic area_business_logic;

	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<Area>> getAllAreaInfo() {
		return area_business_logic.getAllArea();
	}

	@GetMapping(path = "/{area_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Area> getOneAreaInfo(@PathVariable long area_id) {
		return area_business_logic.getOneAreaById(area_id);
	}

	@GetMapping(path = "search/{search_content}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<Area>> searchInArea(@PathVariable String search_content) {
		return area_business_logic.searchInArea(search_content);
	}

	@GetMapping(path = "/city/{city_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<AreaInfoFromCityId>> selectAreaUsingCityId(@PathVariable Long city_id) {
		return area_business_logic.selectAreaUsingCityId(city_id);
	}
	
	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addArea(@Valid @RequestBody AreaInsert area_info) {
		return area_business_logic.addArea(area_info);
	}

	@PutMapping(path = "/{area_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateCountryName(@PathVariable long area_id,
			@Valid @RequestBody AreaUpdate area_info) {
		return area_business_logic.updateArea(area_id, area_info);
	}

	@DeleteMapping(path = "/{area_id}")
	public ResponseEntity<Void> delAreaName(@PathVariable Long area_id) {
		return area_business_logic.deleteArea(area_id);
	}

	@PatchMapping(path = "revoke/{area_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> revokeAreaInfo(@PathVariable Long area_id) {
		return area_business_logic.revokeArea(area_id);
	}
}