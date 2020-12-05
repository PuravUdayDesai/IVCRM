//defualt
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:core';
//plugins
import 'package:fluttertoast/fluttertoast.dart';

//custom
import '../Api_Services/ApiCallForDashboard.dart';
import '../User/current_user.dart';
import 'display_google_map.dart';


//--------------------------------------------------------------------------
//			This class displays the PopUp i.e DialogBox that 
//			contains dropdown menus which are dynamically
//			selected according to the selection of options in
//			BottomModalSheet. Once,the options are selected
//			here, the user is redirected to DisplayGoogleMap.dart 
//--------------------------------------------------------------------------

class PopUp {

	static void showFancyCustomDialog(int geoMapId, BuildContext context, bool isCompany, bool isCompanyExecutive, bool isCountry, bool isState, bool isCity, bool isArea) async{    

		List<Widget> kids = [];

		List<DropdownMenuItem<int>> countryMenuItems = [];
		List<DropdownMenuItem<int>> stateMenuItems = [];
		List<DropdownMenuItem<int>> cityMenuItems = [];
		List<DropdownMenuItem<int>> areaMenuItems = [];

		int countryValue = -1;
		int stateValue = -1;
		int cityValue = -1;
		int areaValue = -1;

		bool stateDropDownAvail = false;
		bool cityDropDownAvail = false;	
		bool areaDropDownAvail = false;	
			
		List<DropdownMenuItem<int>> companyMenuItems = [];
		List<DropdownMenuItem<int>> companyExecutiveMenuItems = [];			

		int companyValue = -1;		
		int companyExecutiveValue = -1;

		bool companyExecutiveDropDownAvail = false;

		kids.add(SizedBox(height: 60));

		void showNoContentMsg(){
			Fluttertoast.showToast(
		        msg: "No GeoMap available for the selected fields",
		        toastLength: Toast.LENGTH_SHORT,
		        gravity: ToastGravity.BOTTOM,
		        timeInSecForIosWeb: 1,
		        backgroundColor: Colors.black,
		        textColor: Colors.white,
		        fontSize: 16.0
		    );
		}

		String generateInfoData(int geoMapId){
			String infoData;
			if(geoMapId == 1){
				infoData = 'companyExecutiveName';
			} else if(geoMapId == 5){
				infoData = 'companyBranchName';
			} else if(geoMapId == 3){
				infoData = 'contactName';
			} else{
				infoData = 'companyName';
			}
			return infoData;
		}

		void routeDecisionMaker(BuildContext context, var res, int geoMapId){
			if(res != null){
          		String inD = generateInfoData(geoMapId);
          		Navigator.of(context).push(
					MaterialPageRoute(
					  builder: (_) => StateForGoogleMap(res,inD),
					),
				);
          	} else{
          		showNoContentMsg();
          	}
		}

		if(isCompany){
			companyMenuItems = await getCompanyData(CurrentUser.id);
		} else{
			countryMenuItems = await getCountryData();
		}
		
		if(isCompany){
			if(isCompanyExecutive){
					kids.add(
					StatefulBuilder(
						builder: (BuildContext context, StateSetter setState) {
							return Column(
								children: <Widget>[
									DropdownButton<int>(
							            items: companyMenuItems,
							            value : companyValue == -1 ? null : companyValue,
							            onChanged: (int companyId) async{
							            	setState((){
							            		companyExecutiveDropDownAvail = false;
							            		companyExecutiveValue = -1;	
							            	});
							            	var res_back = await getCompanyExecutiveByCompanyId(companyId);
							            	setState((){					            		
							            		companyExecutiveDropDownAvail = true;							            		
							            		companyExecutiveMenuItems = res_back;							            		
							            		companyValue = companyId;
							            	});
							            },
							            hint: Text('Select Company')
				            		),
				            		DropdownButton<int>(
							            items: companyExecutiveMenuItems,
							            value : companyExecutiveValue == -1 ? null : companyExecutiveValue,
							            onChanged: companyExecutiveDropDownAvail ? (int companyExecutiveId) {
							              setState((){								              				              
							              	companyExecutiveValue = companyExecutiveId;
							              });	
							              var IdArr =[companyExecutiveId];
							              constructUrl(geoMapId,7,IdArr).then((res){
							              	routeDecisionMaker(context,res,geoMapId);					              	
							              });						              
							            } : null,
							            hint: Text('Select Executive')
						            ),								
								],
							); 
				        },
				    ),				
				);	
			} else{
				kids.add(
					StatefulBuilder(
						builder: (BuildContext context, StateSetter setState) {
							return DropdownButton<int>(
					            items: companyMenuItems,
					            value : companyValue == -1 ? null : companyValue,
					            onChanged: (int companyId) async{
					              setState((){
					              	companyValue = companyId;
					              });
					              var IdArr =[companyId];
					              constructUrl(geoMapId,6,IdArr).then((res){
				      				routeDecisionMaker(context,res,geoMapId);				              	
					              });
					            },
					            hint: Text('Select Company')
				            );
				        },
				    ),				
				);
			}			
		}
        
		if(isCountry){	
			if(isState){
				if(isCity){
					if(isArea){
						kids.add(
							StatefulBuilder(
								builder: (BuildContext context, StateSetter setState) {
									return Column(
										children: <Widget>[
											DropdownButton<int>(
									            items: countryMenuItems,
									            value : countryValue == -1 ? null : countryValue,
									            onChanged: (int countryId) async{
									            	setState((){
									            		stateDropDownAvail = false;
									            		stateValue = -1;
									            		cityDropDownAvail = false;
									            		cityValue = -1;
									            		areaDropDownAvail = false;
									            		areaValue = -1;
									            	});					            	
								            		var res_back = await getStateFromCountryId(countryId);	
								            		setState((){						            			
								            			stateDropDownAvail = true;
								            			stateMenuItems = res_back;
								            			countryValue = countryId;
								            		});			            					       
									            },
									            hint: Text('Select Country')
								            ),
								            SizedBox(height: 7),
								            DropdownButton<int>(
									            items: stateMenuItems,
									            value : stateValue == -1 ? null : stateValue,
									            onChanged: stateDropDownAvail ? (int stateId) async{
									            	setState((){
									            		cityDropDownAvail = false;
									            		cityValue = -1;
									            		areaDropDownAvail = false;
									            		areaValue = -1;
									            	});	
									            	var res_back = await getCityFromStateId(stateId);	
									              	setState((){						            			
								            			cityDropDownAvail = true;
								            			cityMenuItems = res_back;
								            			stateValue = stateId;
								            		});	
									            } : null,
									            hint: Text('Select State')
									        ),
									        SizedBox(height: 7),
									        DropdownButton<int>(
									            items: cityMenuItems,
									            value : cityValue == -1 ? null : cityValue,
									            onChanged: cityDropDownAvail ? (int cityId) async{
									            	setState((){
									            		areaDropDownAvail = false;
									            		areaValue = -1;
									            	});	
									            	var res_back = await getAreaFromCityId(cityId);	
									              	setState((){						            			
								            			areaDropDownAvail = true;
								            			areaMenuItems = res_back;
								            			cityValue = cityId;
								            		});	
									            } : null,
									            hint: Text('Select City')
								            ),
								            SizedBox(height: 7),
								            DropdownButton<int>(
									            items: areaMenuItems,
									            value : areaValue == -1 ? null : areaValue,
									            onChanged: areaDropDownAvail ? (int areaId) {
									            	setState((){
									            		areaValue = areaId;
									            	});	
									            	var IdArr =[CurrentUser.id,countryValue,stateValue,cityValue,areaValue];
													constructUrl(geoMapId,5,IdArr).then((res){
									     				routeDecisionMaker(context,res,geoMapId);
													});								            	
									            } : null,
									            hint: Text('Select Area')
								            ),
										],
									);							
								},
							),				
						);
					} else{
						kids.add(
							StatefulBuilder(
								builder: (BuildContext context, StateSetter setState) {
									return Column(
										children: <Widget>[
											DropdownButton<int>(
									            items: countryMenuItems,
									            value : countryValue == -1 ? null : countryValue,
									            onChanged: (int countryId) async{
									            	setState((){
									            		stateDropDownAvail = false;
									            		stateValue = -1;
									            		cityDropDownAvail = false;
									            		cityValue = -1;
									            	});					            	
								            		var res_back = await getStateFromCountryId(countryId);	
								            		setState((){						            			
								            			stateDropDownAvail = true;
								            			stateMenuItems = res_back;
								            			countryValue = countryId;
								            		});			            					       
									            },
									            hint: Text('Select Country')
								            ),
								            SizedBox(height: 7),
								            DropdownButton<int>(
									            items: stateMenuItems,
									            value : stateValue == -1 ? null : stateValue,
									            onChanged: stateDropDownAvail ? (int stateId) async{
									            	setState((){
									            		cityDropDownAvail = false;
									            		cityValue = -1;
									            	});	
									            	var res_back = await getCityFromStateId(stateId);	
									              	setState((){						            			
								            			cityDropDownAvail = true;
								            			cityMenuItems = res_back;
								            			stateValue = stateId;
								            		});	
									            } : null,
									            hint: Text('Select State')
									        ),
									        SizedBox(height: 7),
									        DropdownButton<int>(
									            items: cityMenuItems,
									            value : cityValue == -1 ? null : cityValue,
									            onChanged: cityDropDownAvail ? (int cityId) {
									            	setState((){
									            		cityValue = cityId;
									            	});
									            	var IdArr =[CurrentUser.id,countryValue,stateValue,cityValue];
													constructUrl(geoMapId,4,IdArr).then((res){
									     				routeDecisionMaker(context,res,geoMapId);
													});	
									            } : null,
									            hint: Text('Select City')
								            ),
										],
									);							
								},
							),				
						);
					}					
				} else{
					kids.add(
						StatefulBuilder(
							builder: (BuildContext context, StateSetter setState) {
								return Column(
									children: <Widget>[
										DropdownButton<int>(
								            items: countryMenuItems,
								            value : countryValue == -1 ? null : countryValue,
								            onChanged: (int countryId) async{
								            	setState((){
								            		stateDropDownAvail = false;
								            		stateValue = -1;
								            	});					            	
							            		var res_back = await getStateFromCountryId(countryId);	
							            		setState((){						            			
							            			stateDropDownAvail = true;
							            			stateMenuItems = res_back;
							            			countryValue = countryId;
							            		});			            					       
								            },
								            hint: Text('Select Country')
							            ),
							            SizedBox(height: 7),
							            DropdownButton<int>(
								            items: stateMenuItems,
								            value : stateValue == -1 ? null : stateValue,
								            onChanged: stateDropDownAvail ? (int stateId) {
								              setState((){
								              	stateValue = stateId;
								              });
								              var IdArr =[CurrentUser.id,countryValue,stateValue];
												constructUrl(geoMapId,3,IdArr).then((res){
								     				routeDecisionMaker(context,res,geoMapId);
												});	

								            } : null,
								            hint: Text('Select State')
								        ),
									],
								);							
							},
						),				
					);
				}				
			} else{
				kids.add(
					StatefulBuilder(
						builder: (BuildContext context, StateSetter setState) {
							return DropdownButton<int>(
					            items: countryMenuItems,
					            value : countryValue == -1 ? null : countryValue,
					            onChanged: (int countryId) async{
									setState((){
										countryValue = countryId;
									});										
									var IdArr =[CurrentUser.id,countryId];
									constructUrl(geoMapId,2,IdArr).then((res){
					     				routeDecisionMaker(context,res,geoMapId);
									});			            					            					            					       
					            },
					            hint: Text('Select Country')
				            );
						},
					),				
				);
			}					
		}

	    Dialog fancyDialog = Dialog(
	      shape: RoundedRectangleBorder(
	        borderRadius: BorderRadius.circular(12.0),
	      ),
	      child: Container(
	        decoration: BoxDecoration(
	          borderRadius: BorderRadius.circular(20.0),
	        ),
	        height: 300.0,
	        width: 300.0,
	        child: Stack(
	          children: <Widget>[
	            Container(
	              width: double.infinity,
	              height: 300.0,
	              decoration: BoxDecoration(
	                color: Colors.grey[100],
	                borderRadius: BorderRadius.circular(12.0),
	              ),
	            ),
	            Container(
	              width: double.infinity,
	              height: 50,
	              alignment: Alignment.bottomCenter,
	              decoration: BoxDecoration(
	                color: Colors.blue[700],
	                borderRadius: BorderRadius.only(
	                  topLeft: Radius.circular(12),
	                  topRight: Radius.circular(12),
	                ),
	              ),
	              child: Align(
	                alignment: Alignment.center,
	                child: Text(
	                  "Select the fields",
	                  style: TextStyle(
	                      color: Colors.white,
	                      fontSize: 19,
	                      fontWeight: FontWeight.w600),
	                ),
	              ),
	            ),	            
	            Align(
	              child: Container(
	                child : Column(
	                	children : kids,
	                ),
	              ),
	            ),
	            Align(
	              // These values are based on trial & error method
	              alignment: Alignment(0.95, -0.90),
	              child: InkWell(
	                onTap: () {
	                  Navigator.pop(context);
	                },
	                child: Container(
	                  decoration: BoxDecoration(),
	                  child: Icon(
	                    Icons.close,
	                    color: Colors.black,
	                  ),
	                ),
	              ),
	            ),
	          ],
	        ),
	      ),
	    );
	    showDialog(
	        context: context, builder: (BuildContext context) => fancyDialog);
  }

}
