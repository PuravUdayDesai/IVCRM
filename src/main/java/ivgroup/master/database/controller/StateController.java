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
import ivgroup.master.database.bl.StateBusinessLogic;
import ivgroup.master.database.dto.state.State;
import ivgroup.master.database.dto.state.StateInfoFromCountryId;
import ivgroup.master.database.dto.state.StateInsert;
import ivgroup.master.database.dto.state.StateUpdate;

@RestController
@RequestMapping("state")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class StateController {

	@Autowired
	StateBusinessLogic state_business_logic;

	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<State>> getAllStateInfo() {
		return state_business_logic.getAllState();
	}

	@GetMapping(path = "/{state_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<State> getOneStateInfo(@PathVariable long state_id) {
		return state_business_logic.getOneStateById(state_id);
	}

	@GetMapping(path = "search/{search_content}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<State>> searchInState(@PathVariable String search_content) {
		return state_business_logic.searchInState(search_content);
	}
	
	@GetMapping(path = "/country/{country_id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<StateInfoFromCountryId>> selectStateUsingCountryId(@PathVariable Long country_id) {
		return state_business_logic.selectStateUsingCountryId(country_id);
	}

	@PostMapping(consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> addState(@Valid @RequestBody StateInsert state_info) {
		return state_business_logic.addState(state_info);
	}

	@PutMapping(path = "/{state_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> updateCountryName(@PathVariable long state_id,
			@Valid @RequestBody StateUpdate state_info) {
		return state_business_logic.updateState(state_id, state_info);
	}

	@DeleteMapping(path = "/{state_id}")
	public ResponseEntity<Void> delStateName(@PathVariable Long state_id) {
		return state_business_logic.deleteState(state_id);
	}

	@PatchMapping(path = "revoke/{state_id}", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, produces = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Void> revokeStateInfo(@PathVariable Long state_id) {
		return state_business_logic.revokeState(state_id);
	}
}
