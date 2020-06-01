package ivgroup.master.database.dto.state;

import javax.validation.constraints.NotEmpty;

public class StateInfoFromCountryId {
	
	@NotEmpty(message = "StateID cannot be NULL")
	private long StateID;

	@NotEmpty(message = "StateName cannot be NULL")
	private String StateName;

	@NotEmpty(message = "StateCode cannot be NULL")
	private String StateCode;
	
	@NotEmpty(message = "StateDescription cannot be NULL")
	private String StateDescription;

	public long getStateID() {
		return StateID;
	}

	public void setStateID(long stateID) {
		StateID = stateID;
	}

	public String getStateName() {
		return StateName;
	}

	public void setStateName(String stateName) {
		StateName = stateName;
	}

	public String getStateCode() {
		return StateCode;
	}

	public void setStateCode(String stateCode) {
		StateCode = stateCode;
	}

	public String getStateDescription() {
		return StateDescription;
	}

	public void setStateDescription(String stateDescription) {
		StateDescription = stateDescription;
	}

	public StateInfoFromCountryId(@NotEmpty(message = "StateID cannot be NULL") long stateID,
			@NotEmpty(message = "StateName cannot be NULL") String stateName,
			@NotEmpty(message = "StateCode cannot be NULL") String stateCode,
			@NotEmpty(message = "StateDescription cannot be NULL") String stateDescription) {
		super();
		StateID = stateID;
		StateName = stateName;
		StateCode = stateCode;
		StateDescription = stateDescription;
	}
	
	public StateInfoFromCountryId() {}
	
}
