package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import ivgroup.master.database.dto.companyBranch.CompanyBranchInsert;
import ivgroup.master.database.dto.companyBranch.CompanyBranchSelect;

public interface CompanyBranchDAO {
	public List<CompanyBranchSelect>	selectCompanyBranch() 																										throws SQLException,ClassNotFoundException;
	public CompanyBranchSelect 			selectCompanyBranchByCompanyBranchID(Long companyBranchId)																	throws SQLException,ClassNotFoundException;
	public List<CompanyBranchSelect> 	selectCompanyBranchByCompanyID(Long companyId)																				throws SQLException,ClassNotFoundException;
	public List<CompanyBranchSelect> 	selectCompanyBranchByOwnerID(Long ownerId)																				throws SQLException,ClassNotFoundException;
	public List<CompanyBranchSelect> 	selectCompanyBranchByCompanyRegionID(Long companyRegionID)																	throws SQLException,ClassNotFoundException;
	public List<CompanyBranchSelect> 	selectCompanyBranchByCompanyAreaID(Long companyAreaID)																		throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyBranchName(Connection c,Long companyBranchId,String companyBranchName)							throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyBranchCode(Connection c,Long companyBranchId,String companyBranchCode)							throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyRegionID(Connection c,Long companyBranchId,Long companyRegionID)									throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyAreaID(Connection c,Long companyBranchId,Long companyAreaID)										throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyID(Connection c,Long companyBranchId,Long companyID)												throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyBranchType(Connection c,Long companyBranchId,Integer companyBranchType)							throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyBranchAddressID(Connection c,Long companyBranchId,Long companyBranchAddressID)					throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchCompanyBranchPrimaryContactID(Connection c,Long companyBranchId,Long companyBranchPrimaryContactID)		throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchIsActive(Connection c,Long companyBranchId,Boolean isActive)												throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchLastEditOn(Connection c,Long companyBranchId,Timestamp lastEditOn)										throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchLastEditBy(Connection c,Long companyBranchId,Long lastEditBy)											throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyBranchLastEditDeviceType(Connection c,Long companyBranchId,Integer lastEditDeviceType)							throws SQLException,ClassNotFoundException;
	public HashMap<Long,Long> 			addCompanyBranch(CompanyBranchInsert cbi)																					throws SQLException,ClassNotFoundException;
	public Boolean 						deleteCompanyBranch(Long companyBranchId)																					throws SQLException,ClassNotFoundException;
	public Long 						checkCompanyBranchDeleteStatus(Long companyBranchId)																		throws SQLException,ClassNotFoundException;
	public Boolean 						revokeCompanyBranch(Long companyBranchId)																					throws SQLException,ClassNotFoundException;
}
