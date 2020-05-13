package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.client.ClientInsert;
import ivgroup.master.database.dto.client.ClientSelect;

public interface ClientDAO 
{
	public List<ClientSelect> 	selectClientByCompanyId(Long companyId)															throws SQLException,ClassNotFoundException;
	public List<ClientSelect> 	selectClientByCountryId(Long countryId)															throws SQLException,ClassNotFoundException;
	public List<ClientSelect> 	selectClientByStateId(Long stateId)																throws SQLException,ClassNotFoundException;
	public List<ClientSelect> 	selectClientByCityId(Long cityId)																throws SQLException,ClassNotFoundException;
	public List<ClientSelect> 	selectClientByAreaId(Long areaId)																throws SQLException,ClassNotFoundException;
	public List<ClientSelect> 	selectClientByOwnerId(Long ownerId)																throws SQLException,ClassNotFoundException;
	public Long					selectClientLocationIdByClientId(Long clientId)													throws SQLException,ClassNotFoundException;
	public Boolean 				addClient(ClientInsert ci)																		throws SQLException,ClassNotFoundException;
	public Boolean 				deleteClient(Long clientId)																		throws SQLException,ClassNotFoundException;
	public Boolean 				deleteClientLocation(Long clientLocationId)														throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientClientContactName(Connection c,Long clientId,String contactNumber)					throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientClientContactPerson(Connection c,Long clientId,String contactPerson)				throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientEmailId(Connection c,Long clientId,String emailId)									throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientContactNumber(Connection c,Long clientId,String contactNumber)						throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientCompany(Connection c,Long clientId,Long companyId)									throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientIsActive(Connection c,Long clientId,Boolean isActive)								throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLastEditOn(Connection c,Long clientId,Timestamp lastEditOn)							throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLastEditBy(Connection c,Long clientId,Long lastEditBy)								throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationContry(Connection c,Long clientLocationId,Long countryId)					throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationState(Connection c,Long clientLocationId,Long stateId)						throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationCity(Connection c,Long clientLocationId,Long cityId)						throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationArea(Connection c,Long clientLocationId,Long areaId)						throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationAddressLine1(Connection c,Long clientLocationId,String addressLine1)		throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationAddressLine2(Connection c,Long clientLocationId,String addressLine2)		throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationAddressLine3(Connection c,Long clientLocationId,String addressLine3)		throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationPincode(Connection c,Long clientLocationId,String pincode)					throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationLatitude(Connection c,Long clientLocationId,String latitude)				throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationLongitude(Connection c,Long clientLocationId,String longitude)				throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationIsActive(Connection c,Long clientLocationId,Boolean isActive)				throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationLastEditOn(Connection c,Long clientLocationId,Timestamp lastEditOn)			throws SQLException,ClassNotFoundException;
	public Boolean 				updateClientLocationLastEditBy(Connection c,Long clientLocationId,Long lastEditBy)				throws SQLException,ClassNotFoundException;
	
}
