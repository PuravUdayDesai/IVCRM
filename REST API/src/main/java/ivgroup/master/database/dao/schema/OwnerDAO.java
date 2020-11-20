package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.google.people.api.GooglePeopleAPICredentials;
import ivgroup.master.database.dto.owner.OwnerCredentials;
import ivgroup.master.database.dto.owner.OwnerDashboard;
import ivgroup.master.database.dto.owner.OwnerInsert;
import ivgroup.master.database.dto.owner.OwnerSelect;
import ivgroup.master.database.dto.owner.TopExecutivesList;

public interface OwnerDAO {

	public OwnerSelect 						selectOwnerById(Long ownerId)													throws SQLException,ClassNotFoundException;
	public OwnerCredentials 				selectOwnerCredentials(Long ownerId)											throws SQLException,ClassNotFoundException;
	public GooglePeopleAPICredentials		selectOwnerGooglePeopleAPICredentialsByOwnerId(Long ownerId)					throws SQLException,ClassNotFoundException;
	public Long								loginOwner(String userName,String secretKey)									throws SQLException,ClassNotFoundException;
	public Boolean	 						updateOwnerOwnerName(Connection c,Long ownerId,String ownerName)				throws SQLException,ClassNotFoundException;
	public Boolean 							updateOwnerOwnerContact(Connection c,Long ownerId,String ownerContact)			throws SQLException,ClassNotFoundException;
	public Boolean 							updateOwnerOwnerEmail(Connection c,Long ownerId,String ownerEmail)				throws SQLException,ClassNotFoundException;
	public Boolean 							updateOwnerOwnerSecretKey(Connection c,Long ownerId, String secretkey)			throws SQLException,ClassNotFoundException;
	public Boolean 							updateOwnerOwnerUserName(Connection c,Long ownerId,String userName)				throws SQLException,ClassNotFoundException;
	public Boolean 							updateOwnerOwnerPassword(Connection c,Long ownerId, String password)			throws SQLException,ClassNotFoundException;
	public Boolean 							updateOwnerIsActive(Connection c,Long ownerId,Boolean isActive)					throws SQLException,ClassNotFoundException;
	public Boolean 							updateOwnerLastEditOn(Connection c,Long ownerId,Timestamp lastEditOn)			throws SQLException,ClassNotFoundException;
	public String 							addOwner(OwnerInsert oi,GooglePeopleAPICredentials googlePeopleCredential)		throws SQLException,ClassNotFoundException;
	public Boolean 							deleteOwner(Long ownerId)														throws SQLException,ClassNotFoundException;
	public Long								checkOwnerDeleteStatus(Long ownerId)											throws SQLException,ClassNotFoundException;
	public List<TopExecutivesList>			getTopExecutives(Long ownerId)													throws SQLException,ClassNotFoundException;
	public OwnerDashboard					getOwnerDashboardDetails(Long ownerId)											throws SQLException,ClassNotFoundException;
}
