package ivgroup.master.database.dto.state;

import javax.validation.constraints.NotNull;

public class StateInfoFromCountryId {
	
	@NotNull(message = "StateID cannot be NULL")
	private long StateID;

	@NotNull(message = "StateName cannot be NULL")
	private String StateName;

	@NotNull(message = "StateCode cannot be NULL")
	private String StateCode;
	
	@NotNull(message = "StateDescription cannot be NULL")
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

	public StateInfoFromCountryId(@NotNull(message = "StateID cannot be NULL") long stateID,
			@NotNull(message = "StateName cannot be NULL") String stateName,
			@NotNull(message = "StateCode cannot be NULL") String stateCode,
			@NotNull(message = "StateDescription cannot be NULL") String stateDescription) {
		super();
		StateID = stateID;
		StateName = stateName;
		StateCode = stateCode;
		StateDescription = stateDescription;
	}
	
	public StateInfoFromCountryId() {}
	
}
