package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompany;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyByStateID;
import ivgroup.master.database.dto.businessCityForCompany.BusinessCityForCompanyInsert;

public interface BusinessCityForCompanyDao {
	//public List<BusinessCityForCompany> getAllBusinessCityForCompany();

	//public BusinessCityForCompany getOneBusinessCityForCompanyById(long businessCityForCompany_id);
	
	public List<BusinessCityForCompany> getBusinessCityForCompanyInfoByCompanyId(long companyID);

	//public List<BusinessCityForCompany> searchInBusinessCityForCompany(String search_content);
	
	public List<BusinessCityForCompanyByStateID> selectBusinessCityUsingStateId(Long stateID, Long ownerID);

	public Boolean addBusinessCityForCompany(BusinessCityForCompanyInsert businessCityForCompany_info);

	public Boolean updateBusinessCityForCompanyCompanyId(Connection c, Long businessCityForCompanyId, Long companyId)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessCityForCompanyCityID(Connection c, Long businessCityForCompanyId, Long cityId)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessCityForCompanyLastEditOn(Connection c, Long businessCityForCompanyId,
			Timestamp businessCityForCompanyLastEditOn) throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessCityForCompanyIsActive(Connection c, Long businessCityForCompanyId,
			Boolean businessCityForCompanyIsActive) throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessCityForCompanyLastEditBy(Connection c, Long businessCityForCompanyId,
			long businessCityForCompanyLastEditBy) throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessCityForCompanyDeviceType(Connection c, Long businessCityForCompanyId, int deviceType)
			throws SQLException, ClassNotFoundException;

	public Boolean updateBusinessCityForCompanyLastEditDeviceType(Connection c, Long businessCityForCompanyId,
			int lastEditDeviceType) throws SQLException, ClassNotFoundException;

	public Boolean updateCityName(Connection c, Long cityId, String cityName)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityDescription(Connection c, Long cityId, String cityDescription)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateCityCode(Connection c, Long cityId, String cityCode)
			throws SQLException, ClassNotFoundException; 
	
	public Boolean updateCityStateID(Connection c, Long cityID, Long stateID)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateCityCountryID(Connection c, Long cityID, Long countryID)
			throws SQLException, ClassNotFoundException;

	public Boolean deleteBusinessCityForCompany(Long businessCityForCompany_id)
			throws SQLException, ClassNotFoundException;

	public Boolean revokeBusinessCityForCompany(Long businessCityForCompany_id)
			throws SQLException, ClassNotFoundException;
	
	public List<Long> selectBusinessAreaIdByBusinessCityId(Long businessCityForCompanyId)throws SQLException, ClassNotFoundException;
	

}
