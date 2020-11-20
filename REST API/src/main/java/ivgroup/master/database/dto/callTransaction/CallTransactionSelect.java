package ivgroup.master.database.dto.callTransaction;

import java.sql.Timestamp;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CallTransactionSelect {
	
	@NotNull(message="CallTransactionId cannot be NULL")
	private Long callTransactionId;
	@NotNull(message="ClientId cannot be NULL")
	private Long clientId;
	@NotNull(message="CompanyExecutiveId cannot be NULL")
	private Long companyExecutiveId;
	@NotNull(message="ClientNameOnCompanyExecutiveList cannot be NULL")
	private String clientNameOnCompanyExecutiveList;
	@NotNull(message="ClientContactNumber cannot be NULL")
	private String clientContactNumber;
	@NotNull(message="CallType cannot be NULL")
	private Integer callType;
	@NotNull(message="TalkDuration cannot be NULL")
	private Double talkDuration;
	@NotNull(message="CallTime cannot be NULL")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "IST")
	private Timestamp callTime;
	@NotNull(message="FileURL cannot be NULL")
	private String fileURL;
	@NotNull(message="FilePath cannot be NULL")
	private String filePath;
	
	public CallTransactionSelect() {
		
	}

	public CallTransactionSelect(
			@NotNull(message = "CallTransactionId cannot be NULL") Long callTransactionId,
			@NotNull(message = "ClientId cannot be NULL") Long clientId,
			@NotNull(message = "CompanyExecutiveId cannot be NULL") Long companyExecutiveId,
			@NotNull(message = "ClientNameOnCompanyExecutiveList cannot be NULL") String clientNameOnCompanyExecutiveList,
			@NotNull(message = "ClientContactNumber cannot be NULL") String clientContactNumber,
			@NotNull(message = "CallType cannot be NULL") Integer callType,
			@NotNull(message = "TalkDuration cannot be NULL") Double talkDuration,
			@NotNull(message = "CallTime cannot be NULL") Timestamp callTime,
			@NotNull(message = "FileURL cannot be NULL") String fileURL,
			@NotNull(message = "FilePath cannot be NULL") String filePath) {
		super();
		this.callTransactionId = callTransactionId;
		this.clientId = clientId;
		this.companyExecutiveId = companyExecutiveId;
		this.clientNameOnCompanyExecutiveList = clientNameOnCompanyExecutiveList;
		this.clientContactNumber = clientContactNumber;
		this.callType = callType;
		this.talkDuration = talkDuration;
		this.callTime = callTime;
		this.fileURL = fileURL;
		this.filePath = filePath;
	}

	public Long getCallTransactionId() {
		return callTransactionId;
	}

	public void setCallTransactionId(Long callTransactionId) {
		this.callTransactionId = callTransactionId;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public Long getCompanyExecutiveId() {
		return companyExecutiveId;
	}

	public void setCompanyExecutiveId(Long companyExecutiveId) {
		this.companyExecutiveId = companyExecutiveId;
	}

	public String getClientNameOnCompanyExecutiveList() {
		return clientNameOnCompanyExecutiveList;
	}

	public void setClientNameOnCompanyExecutiveList(String clientNameOnCompanyExecutiveList) {
		this.clientNameOnCompanyExecutiveList = clientNameOnCompanyExecutiveList;
	}

	public String getClientContactNumber() {
		return clientContactNumber;
	}

	public void setClientContactNumber(String clientContactNumber) {
		this.clientContactNumber = clientContactNumber;
	}

	public Integer getCallType() {
		return callType;
	}

	public void setCallType(Integer callType) {
		this.callType = callType;
	}

	public Double getTalkDuration() {
		return talkDuration;
	}

	public void setTalkDuration(Double talkDuration) {
		this.talkDuration = talkDuration;
	}

	public Timestamp getCallTime() {
		return callTime;
	}

	public void setCallTime(Timestamp callTime) {
		this.callTime = callTime;
	}

	public String getFileURL() {
		return fileURL;
	}

	public void setFileURL(String fileURL) {
		this.fileURL = fileURL;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
