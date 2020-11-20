package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.position.PositionCompanyExecutiveMasterListInsert;
import ivgroup.master.database.dto.position.PositionInsert;
import ivgroup.master.database.dto.position.PositionSelect;

public interface PositionDAO {

	public List<PositionSelect> 	selectPosition(Long ownerId)																		throws SQLException,ClassNotFoundException;
	public PositionSelect 			selectPositionByPositionId(Long positionId)															throws SQLException,ClassNotFoundException;
	public Boolean 					addPosition(PositionInsert pi)																		throws SQLException,ClassNotFoundException;
	public Long 					addCompanyExecutiveMasterList(PositionCompanyExecutiveMasterListInsert pei)							throws SQLException,ClassNotFoundException;
	public Boolean 					updatePositionName(Connection c,Long positionId,String positionName)								throws SQLException,ClassNotFoundException;
	public Boolean 					updatePositionPriority(Connection c,Long positionId,Integer positionPriority)						throws SQLException,ClassNotFoundException;
	public Boolean 					updatePositionCompanyId(Connection c,Long positionId,Long companyId)								throws SQLException,ClassNotFoundException;
	public Boolean 					updatePositionExecutiveMasterId(Connection c,Long positionId,Long companyExecutiveMasterId)			throws SQLException,ClassNotFoundException;
	public Boolean 					updatePositionIsActive(Connection c,Long positionId,Boolean isActive)								throws SQLException,ClassNotFoundException;
	public Boolean 					updatePositionLastEditBy(Connection c,Long positionId,Long lastEditBy)								throws SQLException,ClassNotFoundException;
	public Boolean 					updatePositionLastEditOn(Connection c,Long positionId,Timestamp lastEditOn)							throws SQLException,ClassNotFoundException;
	public Boolean 					deletePosition(Long positionId)																		throws SQLException,ClassNotFoundException;
	public Integer					checkPositionDeleteStatus(Long positionId)															throws SQLException,ClassNotFoundException;
}
