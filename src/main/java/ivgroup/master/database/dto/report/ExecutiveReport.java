package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotNull;

public class ExecutiveReport {

	@NotNull
	String ExecutiveName;

	@NotNull
	Long TotalTickets;

	@NotNull
	Long TicketCompleted;

	@NotNull
	Long TicketDelayed;

	@NotNull
	Long TicketPending;

	@NotNull
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

	public ExecutiveReport(@NotNull String executiveName, @NotNull Long totalTickets, @NotNull Long ticketCompleted,
			@NotNull Long ticketDelayed, @NotNull Long ticketPending, @NotNull Integer plRate) {
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
