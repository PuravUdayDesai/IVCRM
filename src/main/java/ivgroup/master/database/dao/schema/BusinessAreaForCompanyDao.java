package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;


import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompany;
import ivgroup.master.database.dto.businessAreaForCompany.BusinessAreaForCompanyInsert;

public interface BusinessAreaForCompanyDao {
	public List<BusinessAreaForCompany> getAllBusinessAreaForCompany();

	public List<BusinessAreaForCompany> getOneBusinessAreaForCompanyById(long businessAreaForCompany_id);

	public List<BusinessAreaForCompany> searchInBusinessAreaForCompany(String search_content);
	
	public BusinessAreaForCompany getBusinessAreaForCompanyByAreaId(Long AreaId);

	public Boolean addBusinessAreaForCompany(BusinessAreaForCompanyInsert businessAreaForCompany_info);

	public Boolean updateBusinessAreaForCompanyBusinessAreaID(Connection c, Long businessAreaForCompanyId, Long businessAreaId)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessAreaForCompanyCompanyId(Connection c, Long businessAreaForCompanyId, Long companyId)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessAreaForCompanyCityID(Connection c, Long businessAreaForCompanyId, Long cityId)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessAreaForCompanyLastEditOn(Connection c, Long businessAreaForCompanyId, Timestamp businessAreaForCompanyLastEditOn)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessAreaForCompanyIsActive(Connection c, Long businessAreaForCompanyId, Boolean businessAreaForCompanyIsActive)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessAreaForCompanyLastEditBy(Connection c, Long businessAreaForCompanyId, long businessAreaForCompanyLastEditBy)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessAreaForCompanyDeviceType(Connection c, Long businessAreaForCompanyId, int deviceType)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessAreaForCompanyLastEditDeviceType(Connection c, Long businessAreaForCompanyId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateAreaName(Connection c, Long areaId, String areaName) throws SQLException, ClassNotFoundException;
	
	public Boolean updateAreaDescription(Connection c, Long areaId, String areaDescription) throws SQLException, ClassNotFoundException;
	
	public Boolean updateAreaCode(Connection c, Long areaId, String areaCode) throws SQLException, ClassNotFoundException;

	public Boolean deleteBusinessAreaForCompany(Long businessAreaForCompany_id) throws SQLException, ClassNotFoundException;

	public Boolean revokeBusinessAreaForCompany(Long businessAreaForCompany_id) throws SQLException, ClassNotFoundException;

}
