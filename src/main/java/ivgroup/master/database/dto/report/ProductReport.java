package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotNull;

public class ProductReport {

	@NotNull
	private String ProductName;

	@NotNull
	private Long NumOfTickets;

	@NotNull
	private Long NumOfClients;

	@NotNull
	private Long CompletedTickets;

	@NotNull
	private Double TotalRevenue;

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public Long getNumOfTickets() {
		return NumOfTickets;
	}

	public void setNumOfTickets(Long numOfTickets) {
		NumOfTickets = numOfTickets;
	}

	public Long getNumOfClients() {
		return NumOfClients;
	}

	public void setNumOfClients(Long numOfClients) {
		NumOfClients = numOfClients;
	}

	public Long getCompletedTickets() {
		return CompletedTickets;
	}

	public void setCompletedTickets(Long completedTickets) {
		CompletedTickets = completedTickets;
	}

	public Double getTotalRevenue() {
		return TotalRevenue;
	}

	public void setTotalRevenue(Double totalRevenue) {
		TotalRevenue = totalRevenue;
	}

	public ProductReport(@NotNull String productName, @NotNull Long numOfTickets, @NotNull Long numOfClients,
			@NotNull Long completedTickets, @NotNull Double totalRevenue) {
		super();
		ProductName = productName;
		NumOfTickets = numOfTickets;
		NumOfClients = numOfClients;
		CompletedTickets = completedTickets;
		TotalRevenue = totalRevenue;
	}

	public ProductReport() {
	}
}
