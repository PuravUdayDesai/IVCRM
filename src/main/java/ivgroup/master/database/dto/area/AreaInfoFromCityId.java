package ivgroup.master.database.dto.area;

import javax.validation.constraints.NotNull;

public class AreaInfoFromCityId {

	@NotNull(message = "BusinessAreaID cannot be NULL")
	private long BusinessAreaID;

	@NotNull(message = "BusinessAreaName cannot be NULL")
	private String BusinessAreaName;

	@NotNull(message = "BusinessAreaCode cannot be NULL")
	private String BusinessAreaCode;
	
	@NotNull(message = "BusinessAreaDescription cannot be NULL")
	private String BusinessAreaDescription;

	public long getBusinessAreaID() {
		return BusinessAreaID;
	}

	public void setBusinessAreaID(long businessAreaID) {
		BusinessAreaID = businessAreaID;
	}

	public String getBusinessAreaName() {
		return BusinessAreaName;
	}

	public void setBusinessAreaName(String businessAreaName) {
		BusinessAreaName = businessAreaName;
	}

	public String getBusinessAreaCode() {
		return BusinessAreaCode;
	}

	public void setBusinessAreaCode(String businessAreaCode) {
		BusinessAreaCode = businessAreaCode;
	}

	public String getBusinessAreaDescription() {
		return BusinessAreaDescription;
	}

	public void setBusinessAreaDescription(String businessAreaDescription) {
		BusinessAreaDescription = businessAreaDescription;
	}

	public AreaInfoFromCityId(@NotNull(message = "BusinessAreaID cannot be NULL") long businessAreaID,
			@NotNull(message = "BusinessAreaName cannot be NULL") String businessAreaName,
			@NotNull(message = "BusinessAreaCode cannot be NULL") String businessAreaCode,
			@NotNull(message = "BusinessAreaDescription cannot be NULL") String businessAreaDescription) {
		super();
		BusinessAreaID = businessAreaID;
		BusinessAreaName = businessAreaName;
		BusinessAreaCode = businessAreaCode;
		BusinessAreaDescription = businessAreaDescription;
	}

	public AreaInfoFromCityId() {}
}
