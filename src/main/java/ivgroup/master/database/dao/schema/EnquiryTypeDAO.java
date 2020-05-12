package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.enquiryType.EnquiryTypeInsert;
import ivgroup.master.database.dto.enquiryType.EnquiryTypeSelect;

public interface EnquiryTypeDAO 
{
	public List<EnquiryTypeSelect> 	selectEnquiryTypeByCompanyId(Long companyId)														throws SQLException,ClassNotFoundException;
	public List<EnquiryTypeSelect>	selectEnquiryTypeByOwnerId(Long ownerId)															throws SQLException,ClassNotFoundException;
	public Boolean 					addEnquiryType(EnquiryTypeInsert eti)																throws SQLException,ClassNotFoundException;
	public Boolean 					updateEnquiryTypeEnquiryTypeName(Connection c,Long enquiryTypeId,String enquiryTypeName)			throws SQLException,ClassNotFoundException;
	public Boolean 					updateEnquiryTypeEnquiryTypeColorCode(Connection c,Long enquiryTypeId,String enquiryTypeColorCode)	throws SQLException,ClassNotFoundException;
	public Boolean 					updateEnquiryTypeCompanyId(Connection c,Long enquiryTypeId,Long companyId)							throws SQLException,ClassNotFoundException;
	public Boolean 					updateEnquiryTypeLastEditBy(Connection c,Long enquiryTypeId,Long lastEditBy)						throws SQLException,ClassNotFoundException;
	public Boolean 					updateEnquiryTypeLastEditOn(Connection c,Long enquiryTypeId,Timestamp lastEditOn)					throws SQLException,ClassNotFoundException;
	public Boolean 					deleteEnquiryType(Long enquiryTypeId)																throws SQLException,ClassNotFoundException;
}
