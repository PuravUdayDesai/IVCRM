package ivgroup.master.database.bl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import ivgroup.master.database.dao.schema.ReportDao;
import ivgroup.master.database.dto.report.ExecutiveReport;
import ivgroup.master.database.dto.report.LocationNStatusReport;
import ivgroup.master.database.dto.report.LocationPriorityReport;
import ivgroup.master.database.dto.report.LocationTimeReport;
import ivgroup.master.database.dto.report.ProductReport;

@Component
public class ReportBusinessLogic {

	@Autowired
	ReportDao rd;
	
	Logger logger =LoggerFactory.getLogger(ReportBusinessLogic.class);

	public ResponseEntity<List<ProductReport>> generateProductReport() {
		List<ProductReport> report = rd.generateProductReport();
		if (report == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		else
			return new ResponseEntity<>(report, HttpStatus.OK);
	}
	
	public ResponseEntity<List<ExecutiveReport>> generateExecutiveReport(Long company_id) {
		List<ExecutiveReport> report = rd.generateExecutiveReport(company_id);
		if (report == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		else
			return new ResponseEntity<>(report, HttpStatus.OK);
	}

	public ResponseEntity<List<LocationTimeReport>> generateLocationTimeReport(String location, Long companyID) {
		List<LocationTimeReport> report;
		if (location.equalsIgnoreCase("state") && companyID != null)
			report = rd.generateStateTimeReport();
		else if (location.equalsIgnoreCase("city") && companyID != null)
			report = rd.generateCityTimeReport(companyID);
		else if (location.equalsIgnoreCase("area") && companyID != null)
			report = rd.generateAreaTimeReport(companyID);
		else
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		if (report == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		else
			return new ResponseEntity<>(report, HttpStatus.OK);
	}

	public ResponseEntity<List<LocationPriorityReport>> generateLocationPriorityReport(String location,
			Long companyID) {
		List<LocationPriorityReport> report;
		if (location.equalsIgnoreCase("state") && companyID != null)
			report = rd.generateStatePriorityReport();
		else if (location.equalsIgnoreCase("city") && companyID != null)
			report = rd.generateCityPriorityReport(companyID);
		else if (location.equalsIgnoreCase("area") && companyID != null)
			report = rd.generateAreaPriorityReport(companyID);
		else
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		if (report == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		else
			return new ResponseEntity<>(report, HttpStatus.OK);
	}

	public ResponseEntity<List<LocationNStatusReport>> generateLocationStatusReport(String location, Long companyID) {
		List<LocationNStatusReport> report;
		if (location.equalsIgnoreCase("state") && companyID != null)
			report = rd.generateStateStatusReport();
		else if (location.equalsIgnoreCase("city") && companyID != null)
			report = rd.generateCityStatusReport(companyID);
		else if (location.equalsIgnoreCase("area") && companyID != null)
			report = rd.generateAreaStatusReport(companyID);
		else
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		if (report == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else if (report.isEmpty())
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		else
			return new ResponseEntity<>(report, HttpStatus.OK);
	}

}
