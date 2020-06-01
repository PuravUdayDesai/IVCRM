package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotEmpty;

public class LocationPriorityReport {

	@NotEmpty
	String LocationName;

	@NotEmpty
	Long NumOfTickets;

	@NotEmpty
	Long Immediate;

	@NotEmpty
	Long High;

	@NotEmpty
	Long Normal;

	@NotEmpty
	Long Low;

	public String getLocationName() {
		return LocationName;
	}

	public void setLocationName(String locationName) {
		LocationName = locationName;
	}

	public Long getNumOfTickets() {
		return NumOfTickets;
	}

	public void setNumOfTickets(Long numOfTickets) {
		NumOfTickets = numOfTickets;
	}

	public Long getImmediate() {
		return Immediate;
	}

	public void setImmediate(Long immediate) {
		Immediate = immediate;
	}

	public Long getHigh() {
		return High;
	}

	public void setHigh(Long high) {
		High = high;
	}

	public Long getNormal() {
		return Normal;
	}

	public void setNormal(Long normal) {
		Normal = normal;
	}

	public Long getLow() {
		return Low;
	}

	public void setLow(Long low) {
		Low = low;
	}

	public LocationPriorityReport(@NotEmpty String locationName, @NotEmpty Long numOfTickets, @NotEmpty Long immediate,
			@NotEmpty Long high, @NotEmpty Long normal, @NotEmpty Long low) {
		super();
		LocationName = locationName;
		NumOfTickets = numOfTickets;
		Immediate = immediate;
		High = high;
		Normal = normal;
		Low = low;
	}

	public LocationPriorityReport() {
	}
}
