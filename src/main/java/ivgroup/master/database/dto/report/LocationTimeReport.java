package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotEmpty;

public class LocationTimeReport {

	@NotEmpty
	String LocationName;

	@NotEmpty
	Long NumOfTickets;

	@NotEmpty
	Long Today;

	@NotEmpty
	Long Tommorow;

	@NotEmpty
	Long NextWeek;

	@NotEmpty
	Long NextMonth;

	@NotEmpty
	Long NextQuarter;

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

	public Long getToday() {
		return Today;
	}

	public void setToday(Long today) {
		Today = today;
	}

	public Long getTommorow() {
		return Tommorow;
	}

	public void setTommorow(Long tommorow) {
		Tommorow = tommorow;
	}

	public Long getNextWeek() {
		return NextWeek;
	}

	public void setNextWeek(Long nextWeek) {
		NextWeek = nextWeek;
	}

	public Long getNextMonth() {
		return NextMonth;
	}

	public void setNextMonth(Long nextMonth) {
		NextMonth = nextMonth;
	}

	public Long getNextQuarter() {
		return NextQuarter;
	}

	public void setNextQuarter(Long nextQuarter) {
		NextQuarter = nextQuarter;
	}

	public LocationTimeReport(@NotEmpty String locationName, @NotEmpty Long numOfTickets, @NotEmpty Long today,
			@NotEmpty Long tommorow, @NotEmpty Long nextWeek, @NotEmpty Long nextMonth, @NotEmpty Long nextQuarter) {
		super();
		LocationName = locationName;
		NumOfTickets = numOfTickets;
		Today = today;
		Tommorow = tommorow;
		NextWeek = nextWeek;
		NextMonth = nextMonth;
		NextQuarter = nextQuarter;
	}

	public LocationTimeReport() {
	}
}
