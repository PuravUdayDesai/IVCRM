package ivgroup.master.database.dto.owner;

import java.util.List;

import javax.validation.constraints.NotNull;

public class OwnerDashboard 
{
	@NotNull(message = "TopExecutives cannot be NULL")
	private List<TopExecutivesList> topExecutives;
	@NotNull(message = "NumberOfClients cannot be NULL")
	private Long numberOfClients;
	@NotNull(message = "NumberOfCompanies cannot be NULL")
	private Long numberOfCompanies;
	@NotNull(message = "NumberOfBranch cannot be NULL")
	private Long numberOfBranch;
	@NotNull(message = "NumberOfProducts cannot be NULL")
	private Long numberOfProducts;
	@NotNull(message = "NumberOfExecutives cannot be NULL")
	private Long numberOfExecutives;
	@NotNull(message = "NumberOfTickets cannot be NULL")
	private Long numberOfTickets;
	
	public OwnerDashboard()
	{
		
	}

	public OwnerDashboard(
			@NotNull(message = "TopExecutives cannot be NULL") List<TopExecutivesList> topExecutives,
			@NotNull(message = "NumberOfClients cannot be NULL") Long numberOfClients,
			@NotNull(message = "NumberOfCompanies cannot be NULL") Long numberOfCompanies,
			@NotNull(message = "NumberOfBranch cannot be NULL") Long numberOfBranch,
			@NotNull(message = "NumberOfProducts cannot be NULL") Long numberOfProducts,
			@NotNull(message = "NumberOfExecutives cannot be NULL") Long numberOfExecutives,
			@NotNull(message = "NumberOftickets cannot be NULL") Long numberOfTickets) {
		super();
		this.topExecutives = topExecutives;
		this.numberOfClients = numberOfClients;
		this.numberOfCompanies = numberOfCompanies;
		this.numberOfBranch = numberOfBranch;
		this.numberOfProducts = numberOfProducts;
		this.numberOfExecutives = numberOfExecutives;
		this.numberOfTickets = numberOfTickets;
	}

	public Long getNumberOfClients() {
		return numberOfClients;
	}

	public void setNumberOfClients(Long numberOfClients) {
		this.numberOfClients = numberOfClients;
	}

	public List<TopExecutivesList> getTopExecutives() {
		return topExecutives;
	}

	public void setTopExecutives(List<TopExecutivesList> topExecutives) {
		this.topExecutives = topExecutives;
	}

	public Long getNumberOfCompanies() {
		return numberOfCompanies;
	}

	public void setNumberOfCompanies(Long numberOfCompanies) {
		this.numberOfCompanies = numberOfCompanies;
	}

	public Long getNumberOfBranch() {
		return numberOfBranch;
	}

	public void setNumberOfBranch(Long numberOfBranch) {
		this.numberOfBranch = numberOfBranch;
	}

	public Long getNumberOfProducts() {
		return numberOfProducts;
	}

	public void setNumberOfProducts(Long numberOfProducts) {
		this.numberOfProducts = numberOfProducts;
	}

	public Long getNumberOfExecutives() {
		return numberOfExecutives;
	}

	public void setNumberOfExecutives(Long numberOfExecutives) {
		this.numberOfExecutives = numberOfExecutives;
	}

	public Long getNumberOftickets() {
		return numberOfTickets;
	}

	public void setNumberOftickets(Long numberOfTickets) {
		this.numberOfTickets = numberOfTickets;
	}
}
