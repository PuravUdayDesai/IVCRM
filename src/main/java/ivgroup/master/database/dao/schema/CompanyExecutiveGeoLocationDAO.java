package ivgroup.master.database.dao.schema;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationInsert;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationSelect;
import ivgroup.master.database.dto.companyExecutiveGeoLocation.CompanyExecutiveGeoLocationTextSelect;

public interface CompanyExecutiveGeoLocationDAO 
{
	public List<CompanyExecutiveGeoLocationSelect> 			selectCompanyExecutiveGeoLocationByCompanyExecutiveId(Long companyExecutiveId)																throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoLocationSelect> 			selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndDate(Long companyExecutiveId,Date dateOfSearch)										throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoLocationSelect> 			selectCompanyExecutiveGeoLocationByCompanyExecutiveIdAndBetweenDate(Long companyExecutiveId,Timestamp startDate,Timestamp endDate)			throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoLocationTextSelect>	 	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndDate(Long companyExecutiveId,Date dateOfSearch)									throws SQLException,ClassNotFoundException;
	public List<CompanyExecutiveGeoLocationTextSelect>	 	selectCompanyExecutiveGeoLocationTextByCompanyExecutiveIdAndBetweenDate(Long companyExecutiveId,Timestamp startDate,Timestamp endDate)		throws SQLException,ClassNotFoundException;
	public Boolean 											addCompanyExecutiveGeoLocation(CompanyExecutiveGeoLocationInsert cgi)																		throws SQLException,ClassNotFoundException;
}
