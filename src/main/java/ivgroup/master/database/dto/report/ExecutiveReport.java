package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotEmpty;

public class ExecutiveReport {

	@NotEmpty
	String ExecutiveName;

	@NotEmpty
	Long TotalTickets;

	@NotEmpty
	Long TicketCompleted;

	@NotEmpty
	Long TicketDelayed;

	@NotEmpty
	Long TicketPending;

	@NotEmpty
	Integer PlRate;

	public String getExecutiveName() {
		return ExecutiveName;
	}

	public void setExecutiveName(String executiveName) {
		ExecutiveName = executiveName;
	}

	public Long getTotalTickets() {
		return TotalTickets;
	}

	public void setTotalTickets(Long totalTickets) {
		TotalTickets = totalTickets;
	}

	public Long getTicketCompleted() {
		return TicketCompleted;
	}

	public void setTicketCompleted(Long ticketCompleted) {
		TicketCompleted = ticketCompleted;
	}

	public Long getTicketDelayed() {
		return TicketDelayed;
	}

	public void setTicketDelayed(Long ticketDelayed) {
		TicketDelayed = ticketDelayed;
	}

	public Long getTicketPending() {
		return TicketPending;
	}

	public void setTicketPending(Long ticketPending) {
		TicketPending = ticketPending;
	}

	public Integer getPlRate() {
		return PlRate;
	}

	public void setPlRate(Integer plRate) {
		PlRate = plRate;
	}

	public ExecutiveReport(@NotEmpty String executiveName, @NotEmpty Long totalTickets, @NotEmpty Long ticketCompleted,
			@NotEmpty Long ticketDelayed, @NotEmpty Long ticketPending, @NotEmpty Integer plRate) {
		super();
		ExecutiveName = executiveName;
		TotalTickets = totalTickets;
		TicketCompleted = ticketCompleted;
		TicketDelayed = ticketDelayed;
		TicketPending = ticketPending;
		PlRate = plRate;
	}

	public ExecutiveReport() {
	}
}
