package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotNull;

public class LocationPriorityReport {

	@NotNull
	private String LocationName;

	@NotNull
	private Long NumOfTickets;

	@NotNull
	private Long Immediate;

	@NotNull
	private Long High;

	@NotNull
	private Long Normal;

	@NotNull
	private Long Low;

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

	public LocationPriorityReport(@NotNull String locationName, @NotNull Long numOfTickets, @NotNull Long immediate,
			@NotNull Long high, @NotNull Long normal, @NotNull Long low) {
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
