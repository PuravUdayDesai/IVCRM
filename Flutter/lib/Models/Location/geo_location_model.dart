class GeoClass{
	int companyExecutiveGeoLocationId;
  String latitude;
  String longitude;
  int companyExecutiveId;
  String companyExecutiveName;
  int companyId;
  String companyName;
  String entryDateAndTime;

  GeoClass.retrive(
  	this.companyExecutiveGeoLocationId,
      this.latitude,
      this.longitude,
      this.companyExecutiveId,
      this.companyExecutiveName,
      this.companyId,
      this.companyName,
      this.entryDateAndTime
  );
}