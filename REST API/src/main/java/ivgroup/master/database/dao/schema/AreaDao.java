package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.area.Area;
import ivgroup.master.database.dto.area.AreaInfoFromCityId;
import ivgroup.master.database.dto.area.AreaInsert;

public interface AreaDao {

	public List<Area> getAllArea();

	public Area getOneAreaById(long area_id);

	public List<Area> searchInArea(String search_content);

	public List<AreaInfoFromCityId> selectAreaUsingCityId(Long city_id);
	
	public Boolean addArea(AreaInsert area_info);

	public Boolean updateAreaName(Connection c, Long areaId, String areaName)
			throws SQLException, ClassNotFoundException;

	public Boolean updateAreaDescription(Connection c, Long areaId, String areaDescription)
			throws SQLException, ClassNotFoundException;

	public Boolean updateAreaCode(Connection c, Long areaId, String areaCode)
			throws SQLException, ClassNotFoundException;

	public Boolean updateAreaLastEditOn(Connection c, Long areaId, Timestamp areaLastEditOn)
			throws SQLException, ClassNotFoundException;

	public Boolean updateAreaIsActive(Connection c, Long areaId, Boolean areaIsActive)
			throws SQLException, ClassNotFoundException;

	public Boolean updateAreaLastEditBy(Connection c, Long areaId, Long areaLastEditBy)
			throws SQLException, ClassNotFoundException;

	public Boolean updateAreaDeviceType(Connection c, Long areaId, int deviceType)
			throws SQLException, ClassNotFoundException;

	public Boolean updateAreaLastEditDeviceType(Connection c, Long areaId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateAreaCountryId(Connection c, Long areaId, Long areaCountryId)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateAreaStateId(Connection c, Long areaId, Long areaStateId)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateAreaCityId(Connection c, Long areaId, Long areaCityId)
			throws SQLException, ClassNotFoundException;

	public Boolean deleteArea(Long areaId) throws SQLException, ClassNotFoundException;

	public Boolean revokeArea(Long areaId) throws SQLException, ClassNotFoundException;

}
