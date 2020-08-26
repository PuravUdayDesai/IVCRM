package ivgroup.master.database.bl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;


import ivgroup.master.database.connection.ConnectionProvider;
import ivgroup.master.database.dao.schema.CountryDao;
import ivgroup.master.database.dto.country.Country;
import ivgroup.master.database.dto.country.CountryInsert;
import ivgroup.master.database.dto.country.CountryUpdate;

@Component
public class CountryBusinessLogic {

	@Autowired
	CountryDao country_dao;
	
	Logger logger =LoggerFactory.getLogger(CountryBusinessLogic.class);

	public ResponseEntity<List<Country>> getAllCountry() {
		List<Country> res = country_dao.getAllCountry();
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<Country> getOneCountryById(long country_id) {
		Country res = country_dao.getOneCountryById(country_id);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<List<Country>> searchInCountry(String search_content) {
		List<Country> res = country_dao.searchInCountry(search_content);
		if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(res, HttpStatus.OK);
	}

	public ResponseEntity<Void> addCountry(CountryInsert country_info) {
		Boolean res = country_dao.addCountry(country_info);
		if (res == false)
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		else if (res == null)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.CREATED);
	}

	// UPDATE SCRIPTS FOR EACH SINGLE UPDATE STARTS FROM HERE

	private ResponseEntity<Void> updateCountryCountryName(Connection c, Long countryId, String countryName) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryName(c, countryId, countryName);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCountryCountryCode(Connection c, Long countryId, String countryCode) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryCode(c, countryId, countryCode);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCountryCountryDescription(Connection c, Long countryId,
			String countryDescription) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryDescription(c, countryId, countryDescription);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCountryLastEditOn(Connection c, Long countryId, Timestamp countryLastEditOn) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryLastEditOn(c, countryId, countryLastEditOn);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCountryIsActive(Connection c, Long countryId, Boolean countryIsActive) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryIsActive(c, countryId, countryIsActive);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCountryLastEditBy(Connection c, Long countryId, long countryLastEditBy) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryLastEditBy(c, countryId, countryLastEditBy);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCountryDeviceType(Connection c, Long countryId, int countryDeviceType) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryDeviceType(c, countryId, countryDeviceType);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	private ResponseEntity<Void> updateCountryLastEditDeviceType(Connection c, Long countryId,
			int countryLastEditDeviceType) {
		Boolean rs = false;
		try {
			rs = country_dao.updateCountryLastEditDeviceType(c, countryId, countryLastEditDeviceType);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (!rs) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// ENDS HERE

	public ResponseEntity<Void> updateCountry(Long countryId, CountryUpdate country_info) {
		if (country_info == null) {
			return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}
		Connection c = null;
		try {
			c = ConnectionProvider.getConnection();
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		ResponseEntity<Void> rs = null;
		Boolean wentIn = false;

		if (country_info.getCountryName() != null) {
			rs = updateCountryCountryName(c, countryId, country_info.getCountryName());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (country_info.getCountryCode() != null) {
			rs = updateCountryCountryCode(c, countryId, country_info.getCountryCode());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (country_info.getCountryDescription() != null) {
			rs = updateCountryCountryDescription(c, countryId, country_info.getCountryDescription());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (country_info.getLastEditOn() != null) {
			rs = updateCountryLastEditOn(c, countryId, country_info.getLastEditOn());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (country_info.getIsActive() != null) {
			rs = updateCountryIsActive(c, countryId, country_info.getIsActive());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (country_info.getLastEditBy() != null) {
			rs = updateCountryLastEditBy(c, countryId, country_info.getLastEditBy());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (country_info.getDeviceType() != null) {
			rs = updateCountryDeviceType(c, countryId, country_info.getDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		if (country_info.getLastEditDeviceType() != null) {
			rs = updateCountryLastEditDeviceType(c, countryId, country_info.getLastEditDeviceType());
			wentIn = true;
		}
		if (rs != null && rs.getStatusCode() != HttpStatus.OK && wentIn) {
			wentIn = false;
			return rs;
		}
		rs = null;

		try {
			c.close();
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	public ResponseEntity<Void> deleteCountry(Long country_id) {
		Boolean res;
		try {
			res = country_dao.deleteCountry(country_id);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}

	public ResponseEntity<Void> revokeCountry(Long country_id) {
		Boolean res;
		try {
			res = country_dao.revokeCountry(country_id);
		} catch (ClassNotFoundException e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.NOT_FOUND);
		} catch (SQLException  e) { logger.error("Exception: "+e.getMessage());
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		if (res == false)
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		else
			return new ResponseEntity<>(HttpStatus.OK);
	}
}
