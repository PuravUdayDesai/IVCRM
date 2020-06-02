package ivgroup.master.database.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ivgroup.master.database.Constants;
import ivgroup.master.database.bl.ReportBusinessLogic;
import ivgroup.master.database.dto.report.ExecutiveReport;
import ivgroup.master.database.dto.report.LocationNStatusReport;
import ivgroup.master.database.dto.report.LocationPriorityReport;
import ivgroup.master.database.dto.report.LocationTimeReport;
import ivgroup.master.database.dto.report.ProductReport;

@RestController
@RequestMapping("/report")
@CrossOrigin(origins = Constants.URL_TO_REQUEST)
public class ReportController {

	@Autowired
	ReportBusinessLogic rbl;

	@GetMapping(path = "/product", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ProductReport>> generateProductReport() {
		return rbl.generateProductReport();
	}
	
	@GetMapping(path = "/executive", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid ExecutiveReport>> generateExecutiveReport(@RequestParam("companyID") Long comp_id) {
		return rbl.generateExecutiveReport(comp_id);
	}

	@GetMapping(path = "/time", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid LocationTimeReport>> generateLocationTimeReport(@RequestParam("location") String loc,
			@RequestParam(value = "companyID", required = false) Long comp_id) {
		return rbl.generateLocationTimeReport(loc, comp_id);
	}

	@GetMapping(path = "/priority", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid LocationPriorityReport>> generateLocationPriorityReport(
			@RequestParam("location") String loc, @RequestParam(value = "companyID", required = false) Long comp_id) {
		return rbl.generateLocationPriorityReport(loc, comp_id);
	}

	@GetMapping(path = "/status", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<@Valid LocationNStatusReport>> generateLocationStatusReport(
			@RequestParam("location") String loc, @RequestParam(value = "companyID", required = false) Long comp_id) {
		return rbl.generateLocationStatusReport(loc, comp_id);
	}
}
