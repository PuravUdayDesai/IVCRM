package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import ivgroup.master.database.dto.city.City;
import ivgroup.master.database.dto.city.CityInfoFromStateId;
import ivgroup.master.database.dto.city.CityInsert;


public interface CityDao {

	public List<City> getAllCity();

	public City getOneCityById(long city_id);

	public List<City> searchInCity(String search_content);
	
	public List<CityInfoFromStateId> selectCityUsingStateId(Long state_id);

	public Boolean addCity(CityInsert city_info);

	public Boolean updateCityName(Connection c, Long cityId, String cityName)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityDescription(Connection c, Long cityId, String cityDescription)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityCode(Connection c, Long cityId, String cityCode)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityLastEditOn(Connection c, Long cityId, Timestamp cityLastEditOn)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityIsActive(Connection c, Long cityId, Boolean cityIsActive)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityLastEditBy(Connection c, Long cityId, Long cityLastEditBy)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityDeviceType(Connection c, Long cityId, int deviceType)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCityLastEditDeviceType(Connection c, Long cityId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateCityCountryId(Connection c, Long cityId, Long cityCountryId)
			throws SQLException, ClassNotFoundException;
	
	public Boolean updateCityStateId(Connection c, Long cityId, Long cityStateId)
			throws SQLException, ClassNotFoundException;

	public Boolean deleteCity(Long cityId) throws SQLException, ClassNotFoundException;

	public Boolean revokeCity(Long cityId) throws SQLException, ClassNotFoundException;

}
