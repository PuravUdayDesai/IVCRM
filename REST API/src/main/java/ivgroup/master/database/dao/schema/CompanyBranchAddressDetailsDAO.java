package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.companyBranchAddressDetails.CompanyBranchAddressDetailsSelect;


public interface CompanyBranchAddressDetailsDAO {	

	public List<CompanyBranchAddressDetailsSelect> 	selectCompanyBranchAddressDetails()																							throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsAddressLine1(Connection c,Long companyBranchAddressId,String addressLine1) 				throws SQLException,ClassNotFoundException;
	public Boolean									updateCompanyBranchAddressDetailsAddressLine2(Connection c,Long companyBranchAddressId,String addressLine2) 				throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsAddressLine3(Connection c,Long companyBranchAddressId,String addressLine3) 				throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsCityId(Connection c,Long companyBranchAddressId,Long cityId) 								throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsStateId(Connection c,Long companyBranchAddressId,Long stateId) 							throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsCountryId(Connection c,Long companyBranchAddressId,Long countryId) 						throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsLatitude(Connection c,Long companyBranchAddressId,String latitude) 						throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsLongitude(Connection c,Long companyBranchAddressId,String longitude) 						throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsGeoLocation(Connection c,Long companyBranchAddressId,String geoLocation) 					throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsPincode(Connection c,Long companyBranchAddressId,Long pincode) 							throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsLastEditOn(Connection c,Long companyBranchAddressId,Timestamp lastEditOn) 					throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsLastEditBy(Connection c,Long companyBranchAddressId,Long lastEditBy) 						throws SQLException,ClassNotFoundException;
	public Boolean 									updateCompanyBranchAddressDetailsLastEditDeviceType(Connection c,Long companyBranchAddressId,Integer lastEditDeviceType) 	throws SQLException,ClassNotFoundException;
	public Boolean 									deleteCompanyBranchAddressDetails(Long companyBranchAddressId)																throws SQLException,ClassNotFoundException;
}
