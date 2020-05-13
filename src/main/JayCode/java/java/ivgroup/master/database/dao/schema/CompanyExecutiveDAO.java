package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveInsert;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveLogin;
import ivgroup.master.database.dto.companyExecutive.CompanyExecutiveSelect;

public interface CompanyExecutiveDAO {
	
	public Long 							checkCompanyExecutiveDeleteDependency(Long companyExecutiveID)													throws SQLException, ClassNotFoundException;
	public Long 							checkCompanyExecutiveDeleteStatus(Long companyExecutiveID)														throws SQLException, ClassNotFoundException;
	public Long								selectOwnerIdByCompanyExecutiveId(Long companyExecutiveID)														throws SQLException, ClassNotFoundException;
	public List<CompanyExecutiveSelect>		selectCompanyExecutive()																						throws SQLException, ClassNotFoundException;
	public CompanyExecutiveSelect 			selectCompanyExecutiveByCompanyExecutiveId(Long companyExecutiveID)												throws SQLException, ClassNotFoundException;
	public List<CompanyExecutiveSelect>	 	selectCompanyExecutiveByCompanyId(Long companyId)																throws SQLException, ClassNotFoundException;
	public List<CompanyExecutiveSelect> 	selectCompanyExecutiveByOwnerId(Long ownerId)																	throws SQLException, ClassNotFoundException;
	public List<CompanyExecutiveSelect> 	selectCompanyExecutiveByCompanyBranchId(Long companyBranchId)													throws SQLException, ClassNotFoundException;
	public List<CompanyExecutiveSelect>		selectCompanyExecutiveOfSubPosition(Long companyExecutiveId)													throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveExecutiveName(Connection c, Long companyExecutiveId, String executiveName)				throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveLoginID(Connection c, Long companyExecutiveId, String loginID)							throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutivePassword(Connection c, Long companyExecutiveId, String password)							throws SQLException, ClassNotFoundException; 
	public Boolean 							updateCompanyExecutiveCompanyBranchID(Connection c, Long companyExecutiveId, Long companyBranchID)				throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveBaseCityID(Connection c, Long companyExecutiveId, Long baseCityID)						throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveCompanyID(Connection c, Long companyExecutiveId, Long companyID)							throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveContactNumber(Connection c, Long companyExecutiveId, String contactNumber)				throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveIsActive(Connection c, Long companyExecutiveId, Boolean isActive)							throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveLastEditOn(Connection c, Long companyExecutiveId, Timestamp lastEditOn)					throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveLastEditBy(Connection c, Long companyExecutiveId, Long lastEditBy)						throws SQLException, ClassNotFoundException;
	public Boolean 							updateCompanyExecutiveLastEditDeviceType(Connection c, Long companyExecutiveId, Integer lastEditDeviceType)		throws SQLException, ClassNotFoundException;	
	public Boolean 							addCompanyExecutive(CompanyExecutiveInsert cei)																	throws SQLException, ClassNotFoundException;
	public Boolean 							deleteCompanyExecutive(Long companyExecutiveId)																	throws SQLException, ClassNotFoundException;
	public CompanyExecutiveLogin			loginCompanyExecutive(String loginId,String password)															throws SQLException, ClassNotFoundException;
}
