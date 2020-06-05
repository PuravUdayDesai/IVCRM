package ivgroup.master.database.dto.report;

import javax.validation.constraints.NotNull;

public class LocationNStatusReport {

	@NotNull
	String LocationName;

	@NotNull
	Long NumOfTickets;

	@NotNull
	Long Prospects;

	@NotNull
	Long CallBack;

	@NotNull
	Long DemoPending;

	@NotNull
	Long Quotation;

	@NotNull
	Long PaymentPending;

	@NotNull
	Long Closure;

	@NotNull
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

	public LocationNStatusReport(@NotNull String locationName, @NotNull Long numOfTickets, @NotNull Long prospects,
			@NotNull Long callBack, @NotNull Long demoPending, @NotNull Long quotation, @NotNull Long paymentPending,
			@NotNull Long closure, @NotNull Long dead) {
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
