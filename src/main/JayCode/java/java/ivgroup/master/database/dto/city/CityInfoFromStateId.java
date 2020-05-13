package ivgroup.master.database.dto.city;

import javax.validation.constraints.NotNull;

public class CityInfoFromStateId {

	@NotNull(message = "CityID cannot be NULL")
	private long CityID;

	@NotNull(message = "CityName cannot be NULL")
	private String CityName;

	@NotNull(message = "CityCode cannot be NULL")
	private String CityCode;

	@NotNull(message = "CityDescription cannot be NULL")
	private String CityDescription;

	public long getCityID() {
		return CityID;
	}

	public void setCityID(long cityID) {
		CityID = cityID;
	}

	public String getCityName() {
		return CityName;
	}

	public void setCityName(String cityName) {
		CityName = cityName;
	}

	public String getCityCode() {
		return CityCode;
	}

	public void setCityCode(String cityCode) {
		CityCode = cityCode;
	}

	public String getCityDescription() {
		return CityDescription;
	}

	public void setCityDescription(String cityDescription) {
		CityDescription = cityDescription;
	}

	public CityInfoFromStateId(@NotNull(message = "CityID cannot be NULL") long cityID,
			@NotNull(message = "CityName cannot be NULL") String cityName,
			@NotNull(message = "CityCode cannot be NULL") String cityCode,
			@NotNull(message = "CityDescription cannot be NULL") String cityDescription) {
		super();
		CityID = cityID;
		CityName = cityName;
		CityCode = cityCode;
		CityDescription = cityDescription;
	}

	public CityInfoFromStateId() {
	}
}
