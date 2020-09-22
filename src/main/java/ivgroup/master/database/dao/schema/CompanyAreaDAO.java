package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.companyArea.CompanyAreaInsert;
import ivgroup.master.database.dto.companyArea.CompanyAreaSelect;

public interface CompanyAreaDAO {
	public List<CompanyAreaSelect>	selectCompanyArea()																						throws SQLException,ClassNotFoundException;
	public CompanyAreaSelect		selectCompanyAreaByCompanyAreaID(Long companyAreaId)													throws SQLException,ClassNotFoundException;
	public List<CompanyAreaSelect> 	selectCompanyAreaByCompanyID(Long companyId)															throws SQLException,ClassNotFoundException;
	public List<CompanyAreaSelect> 	selectCompanyAreaByOwnerID(Long ownerId)																throws SQLException,ClassNotFoundException;
	public List<CompanyAreaSelect> 	selectCompanyAreaByRegionID(Long regionId)																throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaCompanyAreaName(Connection c,Long CompanyAreaId,String CompanyAreaName) 				throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaCompanyAreaCode(Connection c,Long CompanyAreaId,String CompanyAreaCode) 				throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaCompanyAreaDescription(Connection c,Long CompanyAreaId,String CompanyAreaDescription) 	throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaCompanyID(Connection c,Long CompanyAreaId,Long companyID) 								throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaCompanyRegionID(Connection c,Long CompanyAreaId,Long companyRegionID) 					throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaIsActive(Connection c,Long CompanyAreaId,Boolean isActive) 							throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaLastEditOn(Connection c,Long CompanyAreaId,Timestamp lastEditOn) 						throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaLastEditBy(Connection c,Long CompanyAreaId,Long lastEditBy) 							throws SQLException,ClassNotFoundException;
	public Boolean 					updateCompanyAreaLastEditDeviceType(Connection c,Long CompanyAreaId,Integer lastEditDeviceType) 		throws SQLException,ClassNotFoundException;
	public Integer					checkCompanyAreaDeleteStatus(Long companyAreaID)														throws SQLException,ClassNotFoundException;
	public Boolean 					addCompanyArea(CompanyAreaInsert cri) 																	throws SQLException,ClassNotFoundException;
	public Boolean 					deleteCompanyArea(Long CompanyAreaId) 																	throws SQLException,ClassNotFoundException;
	public Boolean 					revokeCompanyArea(Long CompanyAreaId) 																	throws SQLException,ClassNotFoundException;
}
