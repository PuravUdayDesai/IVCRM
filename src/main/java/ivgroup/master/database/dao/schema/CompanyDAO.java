package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import ivgroup.master.database.dto.company.CompanyInsert;
import ivgroup.master.database.dto.company.CompanyInsertWithCompanyBranchType;
import ivgroup.master.database.dto.company.CompanyInsertWithExecutivePosition;
import ivgroup.master.database.dto.company.CompanyInsetWithCompanyBranchTypeAndExecutivePosition;
import ivgroup.master.database.dto.company.CompanySelect;

public interface CompanyDAO {
	
	public List<CompanySelect>	selectCompany()																							throws SQLException,ClassNotFoundException;
	public CompanySelect 		selectCompanyByCompanyId(Long companyId)																throws SQLException,ClassNotFoundException;
	public List<CompanySelect> 	selectCompanyByCountryId(Long countryId)																throws SQLException,ClassNotFoundException;
	public List<CompanySelect> 	selectCompanyByStateId(Long countryId,Long stateId)														throws SQLException,ClassNotFoundException;
	public List<CompanySelect> 	selectCompanyByCityId(Long countryId,Long stateId,Long cityId)											throws SQLException,ClassNotFoundException;
	public List<CompanySelect> 	selectCompanyByOwnerId(Long ownerId)																	throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyCityId(Connection c,Long companyId,Long cityId)											throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyCompanyAddress(Connection c,Long companyId,Long companyAddress)							throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyCompanyCode(Connection c,Long companyId,String companyCode)				  				throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyCompanyName(Connection c,Long companyId,String companyName)				 				throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyIsActive(Connection c,Long companyId,Boolean isActive)			  		  					throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyLastEditedDeviceType(Connection c,Long companyId,Integer lastEditedDeviceType)				throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyLastEditedBy(Connection c,Long companyId,Long lastEditedBy)								throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyLastEditedOn(Connection c,Long companyId,Timestamp lastEditedOn)							throws SQLException,ClassNotFoundException;
	public Boolean 				updateCompanyOwnerContactId(Connection c,Long companyId,Long ownerContactId)							throws SQLException,ClassNotFoundException;
	public HashMap<Long, Long> 	addCompany(CompanyInsert ci) 																			throws SQLException,ClassNotFoundException;
	public HashMap<Long, Long>	addCompanyWithCompanyBranchType(CompanyInsertWithCompanyBranchType ci) 									throws SQLException,ClassNotFoundException;
	public HashMap<Long, Long>	addCompanyWithCompanyBranchTypeAndPosition(CompanyInsetWithCompanyBranchTypeAndExecutivePosition ci)	throws SQLException,ClassNotFoundException;
	public HashMap<Long, Long>	addCompanyWithExecutivePosition(CompanyInsertWithExecutivePosition ci) 									throws SQLException,ClassNotFoundException;
	public Long 				checkCompanyDeleteStatus(Long companyId)																throws SQLException,ClassNotFoundException;
	public Long 				deleteCompany(Long companyId)																			throws SQLException,ClassNotFoundException;
	
}