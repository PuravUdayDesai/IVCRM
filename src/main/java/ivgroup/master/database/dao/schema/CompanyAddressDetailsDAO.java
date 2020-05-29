package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.companyAddressDetails.CompanyAddressDetailsSelect;


public interface CompanyAddressDetailsDAO {
	
	public Boolean 								updateCompanyAddressDetailsAddressLine1(Connection c,Long companyAddressId,String addressLine1) 				throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsAddressLine2(Connection c,Long companyAddressId,String addressLine2) 				throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsAddressLine3(Connection c,Long companyAddressId,String addressLine3) 				throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsCityId(Connection c,Long companyAddressId,Long cityId) 								throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsStateId(Connection c,Long companyAddressId,Long stateId) 							throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsCountryId(Connection c,Long companyAddressId,Long countryId) 						throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsLatitude(Connection c,Long companyAddressId,String latitude) 						throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsLongitude(Connection c,Long companyAddressId,String longitude) 						throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsGeoLocation(Connection c,Long companyAddressId,String geoLocation) 					throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsPincode(Connection c,Long companyAddressId,Long pincode) 							throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsLastEditOn(Connection c,Long companyAddressId,Timestamp lastEditOn) 					throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsLastEditBy(Connection c,Long companyAddressId,Long lastEditBy) 						throws SQLException,ClassNotFoundException;
	public Boolean 								updateCompanyAddressDetailsLastEditDeviceType(Connection c,Long companyAddressId,Integer lastEditDeviceType) 	throws SQLException,ClassNotFoundException;
	public List<CompanyAddressDetailsSelect>	selectCompanyAddressDetails()																					throws SQLException,ClassNotFoundException;
	public Boolean 								deleteCompanyAddressDetails(Long companyAddressId)																throws SQLException,ClassNotFoundException;
	
}
