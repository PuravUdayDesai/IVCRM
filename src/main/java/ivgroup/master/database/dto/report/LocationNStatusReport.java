package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotEmpty;

public class LocationNStatusReport {

	@NotEmpty
	String LocationName;

	@NotEmpty
	Long NumOfTickets;

	@NotEmpty
	Long Prospects;

	@NotEmpty
	Long CallBack;

	@NotEmpty
	Long DemoPending;

	@NotEmpty
	Long Quotation;

	@NotEmpty
	Long PaymentPending;

	@NotEmpty
	Long Closure;

	@NotEmpty
	Long Dead;

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

	public Long getProspects() {
		return Prospects;
	}

	public void setProspects(Long prospects) {
		Prospects = prospects;
	}

	public Long getCallBack() {
		return CallBack;
	}

	public void setCallBack(Long callBack) {
		CallBack = callBack;
	}

	public Long getDemoPending() {
		return DemoPending;
	}

	public void setDemoPending(Long demoPending) {
		DemoPending = demoPending;
	}

	public Long getQuotation() {
		return Quotation;
	}

	public void setQuotation(Long quotation) {
		Quotation = quotation;
	}

	public Long getPaymentPending() {
		return PaymentPending;
	}

	public void setPaymentPending(Long paymentPending) {
		PaymentPending = paymentPending;
	}

	public Long getClosure() {
		return Closure;
	}

	public void setClosure(Long closure) {
		Closure = closure;
	}

	public Long getDead() {
		return Dead;
	}

	public void setDead(Long dead) {
		Dead = dead;
	}

	public LocationNStatusReport(@NotEmpty String locationName, @NotEmpty Long numOfTickets, @NotEmpty Long prospects,
			@NotEmpty Long callBack, @NotEmpty Long demoPending, @NotEmpty Long quotation, @NotEmpty Long paymentPending,
			@NotEmpty Long closure, @NotEmpty Long dead) {
		super();
		LocationName = locationName;
		NumOfTickets = numOfTickets;
		Prospects = prospects;
		CallBack = callBack;
		DemoPending = demoPending;
		Quotation = quotation;
		PaymentPending = paymentPending;
		Closure = closure;
		Dead = dead;
	}

	public LocationNStatusReport() {
	}

}
