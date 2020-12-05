import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'dart:convert';
import 'Uri.dart';
import '../User/current_user.dart';
 
List<String> individual_list = [];
List<List<String>> complete_list = [];

getStatusReport(int companyID, String loc) async{
	complete_list = [];
	print(Uri.STAT_REPORT+"?location="+loc+"&companyID="+companyID.toString());
	var response = await http.get(Uri.STAT_REPORT+"?location="+loc+"&companyID="+companyID.toString(), headers : {
		          "Accept" : "application/json",
		          "Authorization" : CurrentUser.ACCESS_TOKEN
		        });
	print(response.statusCode);	
	var res = jsonDecode(response.body);
	complete_list.add(headerName(1,loc));
	for(int i=0;i<res.length;i++){
		individual_list = [];
		individual_list.add(res[i]["locationName"]);
		individual_list.add(res[i]["numOfTickets"].toString());
		individual_list.add(res[i]["demoPending"].toString());
		individual_list.add(res[i]["prospects"].toString());		
		individual_list.add(res[i]["callBack"].toString());
		individual_list.add(res[i]["quotation"].toString());	
		individual_list.add(res[i]["paymentPending"].toString());		
		individual_list.add(res[i]["closure"].toString());
		individual_list.add(res[i]["dead"].toString());
		complete_list.add(individual_list);
	}
	return complete_list;
}

getPriorityReport(int companyID, String loc) async{
	complete_list = [];
	print(Uri.PRIO_REPORT+"?location="+loc+"&companyID="+companyID.toString());
	var response = await http.get(Uri.PRIO_REPORT+"?location="+loc+"&companyID="+companyID.toString(), headers : {
		          "Accept" : "application/json",
		          "Authorization" : CurrentUser.ACCESS_TOKEN
		        });
	print(response.statusCode);	
	var res = jsonDecode(response.body);
	complete_list.add(headerName(2,loc));
	for(int i=0;i<res.length;i++){
		individual_list = [];
		individual_list.add(res[i]["locationName"]);
		individual_list.add(res[i]["numOfTickets"].toString());
		individual_list.add(res[i]["immediate"].toString());
		individual_list.add(res[i]["high"].toString());		
		individual_list.add(res[i]["normal"].toString());
		individual_list.add(res[i]["low"].toString());	
		complete_list.add(individual_list);
	}
	return complete_list;
}

getTimeReport(int companyID, String loc) async{
	complete_list = [];
	print(Uri.TIME_REPORT+"?location="+loc+"&companyID="+companyID.toString());
	var response = await http.get(Uri.TIME_REPORT+"?location="+loc+"&companyID="+companyID.toString(), headers : {
		          "Accept" : "application/json",
		          "Authorization" : CurrentUser.ACCESS_TOKEN
		        });
	print(response.statusCode);	
	var res = jsonDecode(response.body);
	complete_list.add(headerName(3,loc));
	for(int i=0;i<res.length;i++){
		individual_list = [];
		individual_list.add(res[i]["locationName"]);
		individual_list.add(res[i]["numOfTickets"].toString());
		individual_list.add(res[i]["today"].toString());
		individual_list.add(res[i]["tommorow"].toString());		
		individual_list.add(res[i]["nextWeek"].toString());
		individual_list.add(res[i]["nextMonth"].toString());
		individual_list.add(res[i]["nextQuarter"].toString());		
		complete_list.add(individual_list);
	}
	return complete_list;
}

getExecutiveReport(int companyID) async{
	complete_list = [];
	print(Uri.EXE_REPORT+"?companyID="+companyID.toString());
	var response = await http.get(Uri.EXE_REPORT+"?companyID="+companyID.toString(), headers : {
		          "Accept" : "application/json",
		          "Authorization" : CurrentUser.ACCESS_TOKEN
		        });
	print(response.statusCode);	
	var res = jsonDecode(response.body);
	complete_list.add(headerName(4,"executive"));
	for(int i=0;i<res.length;i++){
		individual_list = [];
		individual_list.add(res[i]["executiveName"]);
		individual_list.add(res[i]["totalTickets"].toString());
		individual_list.add(res[i]["ticketCompleted"].toString());
		individual_list.add(res[i]["ticketDelayed"].toString());		
		individual_list.add(res[i]["ticketPending"].toString());
		individual_list.add(res[i]["plRate"].toString());		
		complete_list.add(individual_list);
	}
	return complete_list;
}

getProductReport() async{	
	complete_list = [];
	print(Uri.PRO_REPORT);
	var response = await http.get(Uri.PRO_REPORT+'/${CurrentUser.id}', headers : {
		          "Accept" : "application/json",
		          "Authorization" : CurrentUser.ACCESS_TOKEN
		        });
	print(response.statusCode);	
	var res = jsonDecode(response.body);
	complete_list.add(headerName(5,"product"));
	for(int i=0;i<res.length;i++){
		individual_list = [];
		individual_list.add(res[i]["productName"]);
		individual_list.add(res[i]["numOfTickets"].toString());
		individual_list.add(res[i]["numOfClients"].toString());
		individual_list.add(res[i]["completedTickets"].toString());		
		individual_list.add(res[i]["totalRevenue"].toString());		
		complete_list.add(individual_list);
	}	 
	return complete_list;
}

List<String> headerName(int id, String loc){
	List<String> li_str = [];
	if(id == 1){
		if(loc == "area")
			li_str.addAll(["Area Name","Number of Tickets","Call Back","Prospects","Demo Pending","Quotation","Payment Pending","Closure","Dead"]);			
		else if(loc == "city")
			li_str.addAll(["City Name","Number of Tickets","Call Back","Prospects","Demo Pending","Quotation","Payment Pending","Closure","Dead"]);	
		else if(loc == "state")
			li_str.addAll(["State Name","Number of Tickets","Call Back","Prospects","Demo Pending","Quotation","Payment Pending","Closure","Dead"]);	
	}
	else if(id == 2){
		if(loc == "area")
			li_str.addAll(["Area Name","Number of Tickets","Immediate","High","Normal","Low"]);
		else if(loc == "city")
			li_str.addAll(["City Name","Number of Tickets","Immediate","High","Normal","Low"]);
		else if(loc == "state")
			li_str.addAll(["State Name","Number of Tickets","Immediate","High","Normal","Low"]);
	}
	else if(id == 3){
		if(loc == "area")
			li_str.addAll(["Area Name","Number of Tickets","Today","Tomorrow","Next Week","Next Month","Next Quarter"]);
		else if(loc == "city")
			li_str.addAll(["City Name","Number of Tickets","Today","Tomorrow","Next Week","Next Month","Next Quarter"]);
		else if(loc == "state")
			li_str.addAll(["State Name","Number of Tickets","Today","Tomorrow","Next Week","Next Month","Next Quarter"]);
	}
	else if(id == 4 && loc == "executive"){
		li_str.addAll(["Executive Name","Ticket Assigned","Ticket Completed","Ticket Delayed","Ticket Pending","PLRate"]);
	}
	else if(id == 5 && loc == "product")
		li_str.addAll(["Product Name","Number of Tickets","Number of Clients","Number of Tickets Completed","Total Revenue Generated"]);
	else 
		return null;
	return li_str;
}	
