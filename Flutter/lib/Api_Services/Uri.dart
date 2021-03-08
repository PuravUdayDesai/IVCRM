class Uri
{
  static String endPoint= 'IP_ADDRESS';
	static String GET_AREA = "http://$endPoint.ngrok.io/area";
  static String GET_CITY = "http://$endPoint.ngrok.io/city";
  static String GET_STATE = "http://$endPoint.ngrok.io/state";
  static String GET_COUNTRY = "http://$endPoint.ngrok.io/country";
  static String GET_ENQUIRY = "http://$endPoint.ngrok.io/enquiry";
  static String GET_COMPANY = "http://$endPoint.ngrok.io/company";
  static String GET_USER = "http://$endPoint.ngrok.io/user";
  static String GET_STATUS = "http://$endPoint.ngrok.io/status";
  static String GET_CLIENT = "http://$endPoint.ngrok.io/client";
  static String GET_STATE_FROM_COUNTRY ="http://$endPoint.ngrok.io/state/country";
  static String GET_CITY_FROM_STATE = "http://$endPoint.ngrok.io/city/state";
  static String GET_GEO = "http://$endPoint.ngrok.io/companyExecutiveGeoLocation";
  static String GET = "http://$endPoint.ngrok.io";
  static String GET_COMPANY_REGION = "http://$endPoint.ngrok.io/companyRegion";
  static String GET_COMPANY_AREA = "http://$endPoint.ngrok.io/companyArea";
  static String GET_COMPANY_EXECUTIVE = "http://$endPoint.ngrok.io/companyExecutive";
  static String GET_COMPANY_BRANCH = "http://$endPoint.ngrok.io/companyBranch";
  static String GET_COMPANY_BRANCH_ADDRESS = "http://$endPoint.ngrok.io/companyBranchAddressDetails";
  static String GET_COMPANY_ADDRESS = "http://$endPoint.ngrok.io/companyAddressDetails";
  static String GET_CALL_TRANSACTION = "http://$endPoint.ngrok.io/callTransaction";
  static String GET_PRODUCT = "http://$endPoint.ngrok.io/product";
  static String GET_POSITION = "http://$endPoint.ngrok.io/position";
  static String GET_PL = 'http://$endPoint.ngrok.io/companyExecutivePL';
  static String GET_ENQUIRY_TYPE = 'http://$endPoint.ngrok.io/enquiryType';
  static String GET_COMPANY_BRANCH_TYPE = 'http://$endPoint.ngrok.io/companyBranchType';
  static String GET_OWNER = "http://$endPoint.ngrok.io/owner";
  static String GET_BUSINESS_AREA = "http://$endPoint.ngrok.io/businessAreaForCompany";
  static String GET_BUSINESS_CITY = "http://$endPoint.ngrok.io/businessCityForCompany";
  static String GET_BUSINESS_CITY_FROM_STATE = "http://$endPoint.ngrok.io/businessCityForCompany/state";
  static String GET_BUSINESS_AREA_FROM_BUSINESS_CITY = 'http://$endPoint.ngrok.io/businessAreaForCompany/city';
  static String GET_NOTIFICATION = 'http://$endPoint.ngrok.io/notification';
  static String GET_TICKET = "http://$endPoint.ngrok.io/ticket";     
  static String PRO_REPORT = 'http://$endPoint.ngrok.io/report/product';
  static String STAT_REPORT = 'http://$endPoint.ngrok.io/report/status';
  static String PRIO_REPORT = 'http://$endPoint.ngrok.io/report/priority';
  static String TIME_REPORT = 'http://$endPoint.ngrok.io/report/time';
  static String EXE_REPORT = 'http://$endPoint.ngrok.io/report/executive';

  static String CompanyExecutiveGeoMapByOwnerId = "http://$endPoint.ngrok.io/companyExecutiveGeoMap/owner?ownerId=";

  static String CompanyExecutiveGeoMapByCompanyId = "http://$endPoint.ngrok.io/companyExecutiveGeoMap/company?companyId=";

  static String CompanyExecutiveGeoMapByCountry = "http://$endPoint.ngrok.io/companyExecutiveGeoMap/country";

  static String CompanyExecutiveGeoMapByState = "http://$endPoint.ngrok.io/companyExecutiveGeoMap/state";

  static String CompanyExecutiveGeoMapByCity = "http://$endPoint.ngrok.io/companyExecutiveGeoMap/city";

  //--------------------------------------------------------------------------

  static String CompanyGeoMapByOwnerId = "http://$endPoint.ngrok.io/companyGeoMap/owner?ownerId=";

  static String CompanyGeoMapByCountry = "http://$endPoint.ngrok.io/companyGeoMap/country";

  static String CompanyGeoMapByState = "http://$endPoint.ngrok.io/companyGeoMap/state";

  static String CompanyGeoMapByCity = "http://$endPoint.ngrok.io/companyGeoMap/city";

  //--------------------------------------------------------------------------

  static String ClientGeoMapByOwnerId = "http://$endPoint.ngrok.io/clientGeoMap/owner?ownerId=";

  static String ClientGeoMapByCompanyId = "http://$endPoint.ngrok.io/clientGeoMap/company?companyId=";

  static String ClientGeoMapByCountry = "http://$endPoint.ngrok.io/clientGeoMap/country";

  static String ClientGeoMapByState = "http://$endPoint.ngrok.io/clientGeoMap/state";

  static String ClientGeoMapByCity = "http://$endPoint.ngrok.io/clientGeoMap/city";

  static String ClientGeoMapByArea = "http://$endPoint.ngrok.io/clientGeoMap/area";

  //--------------------------------------------------------------------------

  static String EnquiryGeoMapByOwnerId = "http://$endPoint.ngrok.io/enquiryGeoMap/owner?ownerId=";   

  static String EnquiryGeoMapByCompanyExecutive = "http://$endPoint.ngrok.io/enquiryGeoMap/companyExecutive?companyExecutiveId=";

  static String EnquiryGeoMapByCompanyId = "http://$endPoint.ngrok.io/enquiryGeoMap/company?companyId="; 

  static String EnquiryGeoMapByCountry = "http://$endPoint.ngrok.io/enquiryGeoMap/country";

  static String EnquiryGeoMapByState = "http://$endPoint.ngrok.io/enquiryGeoMap/state";

  static String EnquiryGeoMapByCity = "http://$endPoint.ngrok.io/enquiryGeoMap/city";

  static String EnquiryGeoMapByArea = "http://$endPoint.ngrok.io/enquiryGeoMap/area";

  //--------------------------------------------------------------------------

  static String CompanyBranchByOwnerId = "http://$endPoint.ngrok.io/companyBranchGeoMap/owner?ownerId=";

  static String CompanyBranchByCompanyId = "http://$endPoint.ngrok.io/companyBranchGeoMap/company?companyId=";

  static String CompanyBranchByCountry = "http://$endPoint.ngrok.io/companyBranchGeoMap/country?ownerId=145&countryId=137";  

  static String CompanyBranchByState = "http://$endPoint.ngrok.io/companyBranchGeoMap/state?ownerId=145&countryId=137&stateId=3";  

  static String CompanyBranchByCity = "http://$endPoint.ngrok.io/companyBranchGeoMap/city?ownerId=145&countryId=137&stateId=3&cityId=7"; 

  //--------------------------------------------------------------------------

  static String GetCountryInfo = "http://$endPoint.ngrok.io/country";

  static String GetCompanyInfo = "http://$endPoint.ngrok.io/company/owner/"; 

  static String GetCompanyExecutiveInfoByCompanyId = "http://$endPoint.ngrok.io/companyExecutive/company/";  

  static String GetStateInfoByCountryId = "http://$endPoint.ngrok.io/state/country/";

  static String GetCityInfoByStateId = "http://$endPoint.ngrok.io/businessCityForCompany/state/";

  static String GetAreaInfoByCityId = "http://$endPoint.ngrok.io/businessAreaForCompany/city/";

  
}
//516965337
//848730403
//230999999
//after clicking low card on home_page.dart then 
//in ticket.dart i have applied pre selected = widget.ticketName
//if user open from there then too our widget.ticketName will contains something and default ticket type will be applied.
//parmaraakash783@gmail.com
//Aakash@777
//my educational record in bhagubhai
//WHEN VERIFICATION TOOK PLCAE in hirals docs
//Would you like to take benefit under blood relation from paternal side, if any?
 
