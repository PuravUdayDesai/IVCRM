import 'dart:async';
import 'dart:core';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Uri.dart';
import 'package:flutter/material.dart';
import '../User/current_user.dart';


getCompanyData(int ownerID) async{
    List<DropdownMenuItem<int>> tempMenuItems = [];
    // var response = await http.get(Uri.GetCompanyInfo + ownerID.toString());
    // print(response.statusCode);
    // var data = jsonDecode(response.body);

    var data = await getData(Uri.GetCompanyInfo + ownerID.toString());

    for(int i=0; i < data.length; i++){      
      tempMenuItems.add(
        DropdownMenuItem<int>(
          value : data[i]['companyId'],
          child : Text(data[i]['companyName'].toString()),
        ),
      );
    }   
    return tempMenuItems;
}

getCompanyExecutiveByCompanyId(int companyID) async{
	List<DropdownMenuItem<int>> tempMenuItems = [];
    // var response = await http.get(Uri.GetCompanyExecutiveInfoByCompanyId + companyID.toString());
    // print(response.statusCode);
    // var data = jsonDecode(response.body);

    var data = await getData(Uri.GetCompanyExecutiveInfoByCompanyId + companyID.toString());

    for(int i=0; i < data.length; i++){      
      tempMenuItems.add(
        DropdownMenuItem<int>(
          value : int.parse(data[i]['executiveId']),
          child : Text(data[i]['executiveName'].toString()),
        ),
      );
    }   
    return tempMenuItems;
}

Future<List<DropdownMenuItem<int>>> getCountryData() async{
    List<DropdownMenuItem<int>> tempMenuItems = [];
    // var response = await http.get(Uri.GetCountryInfo);
    // print(response.statusCode);
    // print(response.body);
    // var data = jsonDecode(response.body);

    var data = await getData(Uri.GetCountryInfo);

    for(int i=0; i < data.length; i++){      
      tempMenuItems.add(
        DropdownMenuItem<int>(
          value : data[i]['countryID'],
          child : Text(data[i]['countryName'].toString()),
        ),
      );
    }   
    return tempMenuItems;
}

Future<List<DropdownMenuItem<int>>> getStateFromCountryId(int countryId) async{	
	print("Executing but..");
    List<DropdownMenuItem<int>> tempMenuItems = [];
    // var response = await http.get(Uri.GetStateInfoByCountryId + "$countryId");   
    // print(response.statusCode);    
    // print(response.body);
    // var data = jsonDecode(response.body);    

    var data = await getData(Uri.GetStateInfoByCountryId + "$countryId");

    for(int i=0; i < data.length; i++){
      tempMenuItems.add(
        DropdownMenuItem<int>(
          value : data[i]['stateID'],
          child : Text(data[i]['stateName']),
        ),
      );
    }
    return tempMenuItems;
}

Future<List<DropdownMenuItem<int>>> getCityFromStateId(int stateId) async{
	List<DropdownMenuItem<int>> tempMenuItems = [];
    // var response = await http.get(Uri.GetCityInfoByStateId + "$stateId?ownerID=156");   
    // print(response.statusCode);    
    // var data = jsonDecode(response.body);    

    var data = await getData(Uri.GetCityInfoByStateId + "$stateId?ownerID=${CurrentUser.id}");

    for(int i=0; i < data.length; i++){
      tempMenuItems.add(
        DropdownMenuItem<int>(
          value : data[i]['businessCityForCompanyID'],
          child : Text(data[i]['businessCityForCompanyName']),
        ),
      );
    }
    return tempMenuItems;
}

Future<List<DropdownMenuItem<int>>> getAreaFromCityId(int cityId) async{
	List<DropdownMenuItem<int>> tempMenuItems = [];
    // var response = await http.get(Uri.GetAreaInfoByCityId + "$cityId?ownerID=156");   
    // print(response.statusCode);    
    // var data = jsonDecode(response.body);    

    var data = await getData(Uri.GetAreaInfoByCityId + "$cityId?ownerID=${CurrentUser.id}");    

    for(int i=0; i < data.length; i++){
      tempMenuItems.add(
        DropdownMenuItem<int>(
          value : data[i]['businessAreaForCompanyID'],
          child : Text(data[i]['businessAreaForCompanyName']),
        ),
      );
    }
    return tempMenuItems;
}

//--------------------------------------------------------------------------
//					XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//--------------------------------------------------------------------------

//	ownerID : 1
// 	countryID : 2
//	stateID : 3
//	cityID : 4
//	areaID : 5
//	companyID : 6
//	companyExecutiveID : 7

//	GeoMap
//	1	-	{1,2,3,4,6}
//	2	-	{1,2,3,4}
//	3	-	{1,2,3,4,5,6}
//	4	-	{1,2,3,4,5,6,7}
//	5	-	{1,2,3,4,6}

constructUrl(int geoMapId, int filterID, var Ids) async{
	if(geoMapId ==1){
		if(filterID == 1){			
			String url = Uri.CompanyExecutiveGeoMapByOwnerId + Ids[0].toString();
			return await getData(url);
		}
		else if(filterID == 2){			
			String url = Uri.CompanyExecutiveGeoMapByCountry + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString();				
			return await getData(url);
		}
		else if(filterID == 3){	
			String url = Uri.CompanyExecutiveGeoMapByState + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString();
			return await getData(url);
		}
		else if(filterID == 4){											
			String url = Uri.CompanyExecutiveGeoMapByCity + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString() + "&cityId=" + Ids[3].toString();
			return await getData(url);
		}
		else if(filterID == 6){			
			String url = Uri.CompanyExecutiveGeoMapByCompanyId + Ids[0].toString();
			return await getData(url);
		}
		else{
			print("Invalid FilterID");
		}
	}
	else if(geoMapId ==2){
		if(filterID == 1){
			String url = Uri.CompanyGeoMapByOwnerId + Ids[0].toString();		
			return await getData(url);	
		}
		else if(filterID == 2){
			String url = Uri.CompanyGeoMapByCountry + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString();			
			return await getData(url);
		}
		else if(filterID == 3){
			String url = Uri.CompanyGeoMapByState + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString();
			return await getData(url);
		}
		else if(filterID == 4){
			String url = Uri.CompanyGeoMapByCity + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString() + "&cityId=" + Ids[3].toString();			
			return await getData(url);
		}
		else{
			print("Invalid FilterID");
		}
	}
	else if(geoMapId ==3){
		if(filterID == 1){			
			String url = Uri.ClientGeoMapByOwnerId + Ids[0].toString();
			return await getData(url);
		}
		else if(filterID == 2){			
			String url = Uri.ClientGeoMapByCountry + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString();
			return await getData(url);
		}
		else if(filterID == 3){
			String url = Uri.ClientGeoMapByState + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString();
			return await getData(url);
		}
		else if(filterID == 4){
			String url = Uri.ClientGeoMapByCity + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString() + "&cityId=" + Ids[3].toString();
			return await getData(url);
		}
		else if(filterID == 5){
			String url = Uri.ClientGeoMapByArea + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString() + "&cityId=" + Ids[3].toString() + "&areaId=" + Ids[4].toString();
			return await getData(url);
		}
		else if(filterID == 6){
			String url = Uri.ClientGeoMapByCompanyId + Ids[0].toString();			
			return await getData(url);
		}
		else{
			print("Invalid FilterID");
		}
	}
	else if(geoMapId ==4){
		if(filterID == 1){
			String url = Uri.EnquiryGeoMapByOwnerId + Ids[0].toString();
			return await getData(url);
		}
		else if(filterID == 2){
			String url = Uri.EnquiryGeoMapByCountry + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString();
			return await getData(url);
		}
		else if(filterID == 3){
			String url = Uri.EnquiryGeoMapByState + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString();
			return await getData(url);
		}
		else if(filterID == 4){			
			String url = Uri.EnquiryGeoMapByCity + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString() + "&cityId=" + Ids[3].toString();
			return await getData(url);
		}
		else if(filterID == 5){
			String url = Uri.EnquiryGeoMapByArea + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString() + "&cityId=" + Ids[3].toString() + "&areaId=" + Ids[4].toString();
			return await getData(url);
		}
		else if(filterID == 6){			
			String url = Uri.EnquiryGeoMapByCompanyId + Ids[0].toString();
			return await getData(url);
		}
		else if(filterID == 7){			
			String url = Uri.EnquiryGeoMapByCompanyExecutive + Ids[0].toString();
			return await getData(url);
		}
		else{
			print("Invalid FilterID");
		}
	}
	else if(geoMapId ==5){
		if(filterID == 1){		
			String url = Uri.CompanyBranchByOwnerId + Ids[0].toString();
			return await getData(url);
		}
		else if(filterID == 2){	
			String url = Uri.CompanyBranchByCountry + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString();
			return await getData(url);
		}
		else if(filterID == 3){
			String url = Uri.CompanyBranchByState + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString();
			return await getData(url);
		}
		else if(filterID == 4){
			String url = Uri.CompanyBranchByCity + "?ownerId="+ Ids[0].toString() +"&countryId=" + Ids[1].toString() + "&stateId=" + Ids[2].toString() + "&cityId=" + Ids[3].toString();
			return await getData(url);
		}
		else if(filterID == 6){
			String url = Uri.CompanyBranchByCompanyId + Ids[0].toString();
			return await getData(url);
		}
		else{
			print("Invalid FilterID");
		}
	}
	else{
		print("Invalid GeoMap ID");
	}
}

getData(String url) async{
	var headers = {
		'Authorization': CurrentUser.ACCESS_TOKEN
	};
	var response = await http.get(url,headers: headers);
  	print("-----------------------------------");
  	print(url);
	print(response.statusCode);
	print(response.body);
  	print("-----------------------------------");  	
	return response.body == "" ? null : jsonDecode(response.body);
}


/*
//--------------------------------------------------------------------------
//				1.	GeoMap API call for ComapnyExecutive
//--------------------------------------------------------------------------	
getCompanyExecutiveGeoMapByOwnerId(int ownerID) async{
	String url = Uri.CompanyExecutiveGeoMapByOwnerId + ownerID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyExecutiveGeoMapByCompanyId(int companyID) async{
	String url = Uri.CompanyExecutiveGeoMapByCompanyId + companyID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyExecutiveGeoMapByCountry(int ownerID, int countryID) async{
	String url = Uri.CompanyExecutiveGeoMapByCountry + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyExecutiveGeoMapByState(int ownerID, int countryID, int stateID) async{
	String url = Uri.CompanyExecutiveGeoMapByState + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyExecutiveGeoMapByCity(int ownerID, int countryID, int stateID, int cityID) async{
	String url = Uri.CompanyExecutiveGeoMapByCity + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString() + "&cityId=" + cityID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}
//--------------------------------------------------------------------------
//				2.	GeoMap API call for Comapny
//--------------------------------------------------------------------------	

getCompanyGeoMapByOwnerId(int ownerID) async{
	String url = Uri.CompanyGeoMapByOwnerId + ownerID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyGeoMapByCountry(int ownerID, int countryID) async{
	String url = Uri.CompanyGeoMapByCountry + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() ;
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyGeoMapByState(int ownerID, int countryID, int stateID) async{
	String url = Uri.CompanyGeoMapByState + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyGeoMapByCity(int ownerID, int countryID, int stateID, int cityID) async{
	String url = Uri.CompanyGeoMapByCity + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString() + "&cityId=" + cityID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

//--------------------------------------------------------------------------
//				3.	GeoMap API call for Client
//--------------------------------------------------------------------------	

getClientGeoMapByOwnerId(int ownerID) async{
	String url = Uri.ClientGeoMapByOwnerId + ownerID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getClientGeoMapByCompanyId(int companyID) async{
	String url = Uri.ClientGeoMapByCompanyId + companyID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getClientGeoMapByCountry(int ownerID, int countryID) async{
	String url = Uri.ClientGeoMapByCountry + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getClientGeoMapByState(int ownerID, int countryID, int stateID) async{
	String url = Uri.ClientGeoMapByState + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getClientGeoMapByCity(int ownerID, int countryID, int stateID, int cityID) async{
	String url = Uri.ClientGeoMapByCity + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString() + "&cityId=" + cityID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getClientGeoMapByArea(int ownerID, int countryID, int stateID, int cityID, int areaID) async{
	String url = Uri.ClientGeoMapByArea + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString() + "&cityId=" + cityID.toString() + "&areaId=" + areaID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}
//--------------------------------------------------------------------------
//				4.	GeoMap API call for Enquiry
//--------------------------------------------------------------------------	

//	ID : 1
getEnquiryGeoMapByOwnerId(int ownerID) async{
	String url = Uri.EnquiryGeoMapByOwnerId + ownerID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

//	ID : 2
getEnquiryGeoMapByCountry(int ownerID, int countryID) async{
	String url = Uri.EnquiryGeoMapByCountry + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

//	ID : 3
getEnquiryGeoMapByState(int ownerID, int countryID, int stateID) async{
	String url = Uri.EnquiryGeoMapByState + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

//	ID : 4
getEnquiryGeoMapByCity(int ownerID, int countryID, int stateID, int cityID) async{
	String url = Uri.EnquiryGeoMapByCity + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString() + "&cityId=" + cityID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

//	ID : 5
getEnquiryGeoMapByArea(int ownerID, int countryID, int stateID, int cityID, int areaID) async{
	String url = Uri.EnquiryGeoMapByArea + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString() + "&cityId=" + cityID.toString() + "&areaId=" + areaID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

//	ID : 6
getEnquiryGeoMapByCompanyId(int companyID) async{
	String url = Uri.EnquiryGeoMapByCompanyId + companyID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

//	ID : 7
getEnquiryGeoMapByCompanyExecutive(int companyExecutiveID) async{
	String url = Uri.EnquiryGeoMapByCompanyExecutive + companyExecutiveID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}
//--------------------------------------------------------------------------
//				5.	GeoMap API call for CompanyBranch
//--------------------------------------------------------------------------
getCompanyBranchByOwnerId(int ownerID) async{
	String url = Uri.CompanyBranchByOwnerId + ownerID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyBranchByCompanyId(int companyID) async{
	String url = Uri.CompanyBranchByCompanyId + companyID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyBranchByCountry(int ownerID, int countryID) async{
	String url = Uri.CompanyBranchByCountry + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyBranchByState(int ownerID, int countryID, int stateID) async{
	String url = Uri.CompanyBranchByState + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}

getCompanyBranchByCity(int ownerID, int countryID, int stateID, int cityID) async{
	String url = Uri.CompanyBranchByCity + "?ownerId="+ ownerID.toString() +"&countryId=" + countryID.toString() + "&stateId=" + stateID.toString() + "&cityId=" + cityID.toString();
	var response = await http.get(url);
	print(response.statusCode);
	return jsonDecode(response.body);
}
*/
//--------------------------------------------------------------------------
//					API call for populating dropdowns
//--------------------------------------------------------------------------
