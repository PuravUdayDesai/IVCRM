package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.companyRegion.CompanyRegionInsert;
import ivgroup.master.database.dto.companyRegion.CompanyRegionSelect;

public interface CompanyRegionDAO {
	
	public List<CompanyRegionSelect> 	selectCompanyRegion()																								throws SQLException,ClassNotFoundException;
	public CompanyRegionSelect 			selectCompanyRegionByCompanyRegionID(Long companyRegionId)															throws SQLException,ClassNotFoundException;
	public List<CompanyRegionSelect>	selectCompanyRegionByCompanyID(Long companyId)																		throws SQLException,ClassNotFoundException;
	public List<CompanyRegionSelect>	selectCompanyRegionByOwnerID(Long ownerId)																			throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionCompanyRegionName(Connection c,Long companyRegionId,String companyRegionName) 					throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionCompanyRegionCode(Connection c,Long companyRegionId,String companyRegionCode) 					throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionCompanyRegionDescription(Connection c,Long companyRegionId,String companyRegionDescription) 		throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionCompanyID(Connection c,Long companyRegionId,Long companyID) 										throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionIsActive(Connection c,Long companyRegionId,Boolean isActive) 									throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionLastEditOn(Connection c,Long companyRegionId,Timestamp lastEditOn) 								throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionLastEditBy(Connection c,Long companyRegionId,Long lastEditBy) 									throws SQLException,ClassNotFoundException;
	public Boolean 						updateCompanyRegionLastEditDeviceType(Connection c,Long companyRegionId,Integer lastEditDeviceType)					throws SQLException,ClassNotFoundException;
	public Boolean 						addCompanyRegion(CompanyRegionInsert cri) 																			throws SQLException,ClassNotFoundException;
	public Boolean 						deleteCompanyRegion(Long companyRegionId) 																			throws SQLException,ClassNotFoundException;
	public Long 						checkCompanyRegionDeleteStatus(Long companyRegionId)																throws SQLException,ClassNotFoundException;
	public Boolean 						revokeCompanyRegion(Long companyRegionId) 																			throws SQLException,ClassNotFoundException;
}
