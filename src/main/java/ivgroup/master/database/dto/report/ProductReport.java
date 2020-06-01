package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotEmpty;

public class ProductReport {

	@NotEmpty
	String ProductName;

	@NotEmpty
	Long NumOfTickets;

	@NotEmpty
	Long NumOfClients;

	@NotEmpty
	Long CompletedTickets;

	@NotEmpty
	Double TotalRevenue;

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

	public ProductReport(@NotEmpty String productName, @NotEmpty Long numOfTickets, @NotEmpty Long numOfClients,
			@NotEmpty Long completedTickets, @NotEmpty Double totalRevenue) {
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
