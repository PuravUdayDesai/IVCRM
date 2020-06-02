package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.PriorityBusinessLogic;
import ivgroup.master.database.dto.priority.PrioritySelect;

@RestController
@RequestMapping("/priority")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class PriorityController
{
	@Autowired
	PriorityBusinessLogic pbl;
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid PrioritySelect>> selectPriority()
	{
		return pbl.selectPriority();
	}
	
}
