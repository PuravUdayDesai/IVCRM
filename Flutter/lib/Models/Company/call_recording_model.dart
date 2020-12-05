class CallRecordingClass
{
  int callTransactionId;
  int clientId;
  int companyExecutiveId;
  String clientNameOnCompanyExecutiveList;
  String clientContactNumber;
  int callType;
  dynamic talkDuration;
  String callTime;
  String fileURL;
  String filePath;

  CallRecordingClass(){

  }

  CallRecordingClass.retrieve(
    this.callTransactionId,
      this.clientId,
      this.companyExecutiveId,
      this.clientNameOnCompanyExecutiveList,
      this.clientContactNumber,
      this.callType,
      this.talkDuration,
      this.callTime,
      this.fileURL,
      this.filePath
  );
}