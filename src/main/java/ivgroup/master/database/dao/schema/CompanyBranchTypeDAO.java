package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeInsert;
import ivgroup.master.database.dto.companyBranchType.CompanyBranchTypeSelect;

public interface CompanyBranchTypeDAO 
{
	public List<CompanyBranchTypeSelect> 	selectCompanyBranchTypeByCompanyId(Long companyId)																			throws SQLException,ClassNotFoundException;
	public Boolean 							addCompanyBranchType(CompanyBranchTypeInsert cbi)																			throws SQLException,ClassNotFoundException;
	public Boolean 							updateCompanyBranchTypeCompanyBranchTypeName(Connection c,Long companyBranchTypeId,String companyBranchTypeName)			throws SQLException,ClassNotFoundException;
	public Boolean 							updateCompanyBranchTypeCompanyId(Connection c,Long companyBranchTypeId,Long companyId)										throws SQLException,ClassNotFoundException;
	public Boolean 							updateCompanyBranchTypeCompanyBranchTypePosition(Connection c,Long companyBranchTypeId,Integer companyBranchTypePosition)	throws SQLException,ClassNotFoundException;
	public Boolean 							updateCompanyBranchTypeLastEditBy(Connection c,Long companyBranchTypeId,Long companyBranchTypeLastEditBy)					throws SQLException,ClassNotFoundException;
	public Boolean 							updateCompanyBranchTypeLastEditOn(Connection c,Long companyBranchTypeId,Timestamp companyBranchTypeLastEditOn)				throws SQLException,ClassNotFoundException;
	public Boolean 							deleteCompanyBranchType(Long companyBranchTypeId)																			throws SQLException,ClassNotFoundException;
}
