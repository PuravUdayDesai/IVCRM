package ivgroup.master.database.dto.notification;

public class NotificationUpdate {

	private Boolean ReadIndex;
	private Boolean JustArrived;

	public Boolean getReadIndex() {
		return ReadIndex;
	}

	public void setReadIndex(Boolean readIndex) {
		ReadIndex = readIndex;
	}

	public Boolean getJustArrived() {
		return JustArrived;
	}

	public void setJustArrived(Boolean justArrived) {
		JustArrived = justArrived;
	}

	public NotificationUpdate(Boolean readIndex, Boolean justArrived) {
		super();
		ReadIndex = readIndex;
		JustArrived = justArrived;
	}
	
	public NotificationUpdate() {}
}
