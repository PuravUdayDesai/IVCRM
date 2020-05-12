package ivgroup.master.database.dao.schema;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForAllYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForMonth;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLGeneralSelectForYear;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLInsert;
import ivgroup.master.database.dto.companyExecutivePL.CompanyExecutivePLSelect;

public interface CompanyExecutivePLDAO {

	public Boolean 												addCompanyExecutivePL(CompanyExecutivePLInsert cpli)													throws SQLException,ClassNotFoundException;
	public List<CompanyExecutivePLSelect> 						selectCompanyExecutivePLByExecutiveId(Long companyExecutiveId)											throws SQLException,ClassNotFoundException;
	public List<CompanyExecutivePLSelect> 						selectCompanyExecutivePLByExecutiveIdAndDate(Long companyExecutiveId,Date date)							throws SQLException,ClassNotFoundException;
	public List<CompanyExecutivePLSelect> 						selectCompanyExecutivePLByExecutiveIdBetweenDate(Long companyExecutiveId,Date dateStart,Date dateEnd)	throws SQLException,ClassNotFoundException;
	public List<CompanyExecutivePLGeneralSelectForMonth>	 	selectCompanyExecutiveMonthReport(Long companyExecutive,Integer monthNumber,Integer yearNumber)			throws SQLException,ClassNotFoundException;
	public List<CompanyExecutivePLGeneralSelectForYear>		 	selectCompanyExecutiveYearReport(Long companyExecutive,Integer yearNumber)								throws SQLException,ClassNotFoundException;
	public List<CompanyExecutivePLGeneralSelectForAllYear>		selectCompanyExecutiveAllYearsReport(Long companyExecutive)												throws SQLException,ClassNotFoundException;
}
