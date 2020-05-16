package ivgroup.master.database.dao.schema;

import java.util.List;

import ivgroup.master.database.dto.report.ExecutiveReport;
import ivgroup.master.database.dto.report.LocationNStatusReport;
import ivgroup.master.database.dto.report.LocationPriorityReport;
import ivgroup.master.database.dto.report.LocationTimeReport;
import ivgroup.master.database.dto.report.ProductReport;

public interface ReportDao {

	public List<ProductReport> generateProductReport();
	
	public List<ExecutiveReport> generateExecutiveReport(Long companyID);

	public List<LocationTimeReport> generateStateTimeReport();

	public List<LocationTimeReport> generateCityTimeReport(Long companyID);

	public List<LocationTimeReport> generateAreaTimeReport(Long companyID);

	public List<LocationPriorityReport> generateStatePriorityReport();

	public List<LocationPriorityReport> generateCityPriorityReport(Long companyID);

	public List<LocationPriorityReport> generateAreaPriorityReport(Long companyID);

	public List<LocationNStatusReport> generateStateStatusReport();

	public List<LocationNStatusReport> generateCityStatusReport(Long companyID);

	public List<LocationNStatusReport> generateAreaStatusReport(Long companyID);
}
