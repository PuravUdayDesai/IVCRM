package ivgroup.master.database.dao.schema;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import ivgroup.master.database.dto.country.Country;
import ivgroup.master.database.dto.country.CountryInsert;

public interface CountryDao {
	public List<Country> getAllCountry();

	public Country getOneCountryById(long country_id);

	public List<Country> searchInCountry(String search_content);

	public Boolean addCountry(CountryInsert country_info);

	public Boolean updateCountryName(Connection c, Long countryId, String countryName)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCountryDescription(Connection c, Long countryId, String countryDescription)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCountryCode(Connection c, Long countryId, String countryCode)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCountryLastEditOn(Connection c, Long countryId, Timestamp countryLastEditOn)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCountryIsActive(Connection c, Long countryId, Boolean countryIsActive)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCountryLastEditBy(Connection c, Long countryId, long countryLastEditBy)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCountryDeviceType(Connection c, Long countryId, int deviceType)
			throws SQLException, ClassNotFoundException;

	public Boolean updateCountryLastEditDeviceType(Connection c, Long countryId, int lastEditDeviceType)
			throws SQLException, ClassNotFoundException;

	public Boolean deleteCountry(Long country_id) throws SQLException, ClassNotFoundException;

	public Boolean revokeCountry(Long country_id) throws SQLException, ClassNotFoundException;

}
