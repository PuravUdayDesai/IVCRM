package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotNull;

public class LocationTimeReport {

	@NotNull
	private String LocationName;

	@NotNull
	private Long NumOfTickets;

	@NotNull
	private Long Today;

	@NotNull
	private Long Tommorow;

	@NotNull
	private Long NextWeek;

	@NotNull
	private Long NextMonth;

	@NotNull
	private Long NextQuarter;

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

	public LocationTimeReport(@NotNull String locationName, @NotNull Long numOfTickets, @NotNull Long today,
			@NotNull Long tommorow, @NotNull Long nextWeek, @NotNull Long nextMonth, @NotNull Long nextQuarter) {
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
