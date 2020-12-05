//default
import "package:flutter/material.dart";

//plugin
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


//custom
import '../../Models/Company/ticket_model.dart';
import '../../Models/Company/ticket_access_model.dart';
import '../../Models/Company/status_log_model.dart';
import '../../Models/Company/followup_date_model.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Bloc/theme.dart';

class UpdateTicketAdmin extends StatefulWidget{
	final TicketClass obj;
	UpdateTicketAdmin(this.obj);

	_UpdateTicketAdminState createState() => _UpdateTicketAdminState();
}

class _UpdateTicketAdminState extends State<UpdateTicketAdmin>with SingleTickerProviderStateMixin{
	TabController tabController;
	bool showFab = false;
	String startDateString = '';
	String endDateString = '';
	String followupDateString = '';

	List<int> tempCompanyExecutiveId = [];

	List<DropdownMenuItem<int>> priorityMenuItems = [];
	List<DropdownMenuItem<int>> remainStatusItems = [];

	int priorityValue;

	GlobalKey<FormState> _formKey1;
	GlobalKey<FormState> _formKey5;
	GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

	bool _autoValidate1 = false;
	bool _autoValidate5 = false;
	bool isLoadingFollowupDate = false;
	bool isLoadingAccessList = false;
	bool isStatusLogLoading = false;


	TextEditingController enquiryRemarks;
	TextEditingController ticketRemarks;
	TextEditingController companyName;
	TextEditingController productName;
	TextEditingController status;
	TextEditingController enquiryType;
	TextEditingController startDate;
	TextEditingController endDate;
	TextEditingController followupDate;

	bool getNewStatusData = true;
	bool getNewFollowupDateData = true;
	bool getNewAccessListData = true;
	bool anyUpdate = false;

	int remainStatusValue = -1;

	List<StatusLogClass> statusLogs = [];
	
	List<FollowupDateClass> fud =[];
	List<TicketAccessClass> ticketAccessList = [];

	Icon firstIcon = Icon(Icons.filter_1);
	Icon secondIcon = Icon(Icons.filter_2);
	Icon thirdIcon = Icon(Icons.filter_3);
	Icon fourthIcon = Icon(Icons.filter_4);
	Icon fifthIcon = Icon(Icons.filter_5);
	bool firstCompleted=false;
	bool secondCompleted=false;
	bool thirdCompleted=false;
	bool fourthCompleted=false;
	bool fifthCompleted=false;

	var completed=[true,true,true,true];


	@override
	void initState(){
		tabController = TabController(vsync : this,initialIndex : 0,length : 4);
		
		tabController.addListener((){
			if(tabController.index==2||tabController.index==3||tabController.index==1){
				showFab = true;
			}
			else{
				showFab = false;
			}
			setState((){});
		});

		_formKey1 = GlobalKey<FormState>();
		_formKey5 = GlobalKey<FormState>();

		enquiryRemarks = TextEditingController();
		ticketRemarks = TextEditingController();
		companyName = TextEditingController();
		productName= TextEditingController();
 		status= TextEditingController();
		enquiryType= TextEditingController();
		startDate = TextEditingController();
		endDate = TextEditingController();
		



		enquiryRemarks.text = widget.obj.enquiryRemarks;
		ticketRemarks.text = widget.obj.ticketRemarks;
		companyName.text = widget.obj.companyName;
		productName.text = widget.obj.productName;
 		status.text = widget.obj.statusName;
		enquiryType.text = widget.obj.ticketTypeName;
		startDate.text = widget.obj.startDateAndTime.substring(0,10);
		endDate.text = widget.obj.deadlineDateAndTime.substring(0,10);


		priorityValue = widget.obj.ticketPriority;

		priorityMenuItems.add(
			DropdownMenuItem<int>(
				value : 1,
				child : Text('Low'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<int>(
				value : 2,
				child : Text('Normal'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<int>(
				value : 3,
				child : Text('High'),
			),
		);
		priorityMenuItems.add(
			DropdownMenuItem<int>(
				value : 4,
				child : Text('Immediate'),
			),
		);
	}

	Future chooseStartDate(BuildContext context) async {
		var now = new DateTime.now();
		

		var result = await showDatePicker(
		context: context,
		initialDate: now,
		firstDate: now,
		lastDate: new DateTime(2021)
		);

		if (result == null) return;

		setState(() {
		startDateString = result.toString();
		startDate.text = new DateFormat("dd/M/yyyy").format(result);
		});
	}

	Future chooseEndDate(BuildContext context) async {
		var now = new DateTime.now();
		

		var result = await showDatePicker(
		context: context,
		initialDate: now,
		firstDate: now,
		lastDate: new DateTime(2021)
		);

		if (result == null) return;

		setState(() {
		endDateString = result.toString();
		endDate.text = new DateFormat("dd/M/yyyy").format(result);
		});
	}

	Future chooseFollowupDate(BuildContext context) async {
		var now = new DateTime.now();
		

		var result = await showDatePicker(
		context: context,
		initialDate: now,
		firstDate: now,
		lastDate: new DateTime(2021)
		);

		if (result == null) return;

		setState(() {
		followupDateString = result.toString();
		followupDate.text = new DateFormat("dd/M/yyyy").format(result);
		});
	}

	bool isValidStartDate(String d1){
		if (d1.isEmpty) return false;
		var d = convertToDate(d1);
		return d != null ;
	}

	bool isValidEndDate(String d1){
		if (d1.isEmpty) return false;
		var d = convertToDate(d1);
		return d != null ;
	}
	bool isValidFollowupDate(String d1){
		if (d1.isEmpty) return false;
		var d = convertToDate(d1);
		return d != null ;
	}

	DateTime convertToDate(String input) {
		try 
		{

		  var d = new DateFormat.yMd().parse(input);
		  return d;
		} catch (e) {
		  return null;
		}    
	}

	Widget makeCard(var obj){
		return Card(
			elevation : 7.0,
			child : ListTile(
				title : Text(obj.companyExecutiveName),
				subtitle : Text(obj.accessApplicationTime),
				contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
				onTap : (){},
				trailing : obj.ownerFlag ? Padding(padding : const EdgeInsets.all(8.0),child : Text('Owner')) : IconButton(
					icon : Icon(Icons.delete),
					onPressed : (){
						deleteAccess(obj.ticketAccessListId);
					},
				),
			),
		);
	}

	deleteAccess(int id)async{
		setState((){
			isLoadingAccessList = true;
		});
		var r = await ApiCall.deleteRecord(Uri.GET_TICKET+'/ticketAccessList/${id}?ticketId=${widget.obj.ticketId}&companyExecutiveId=${CurrentUser.ownerId}');
		if(r == 'nothing'){
			showMessage('Operation could not be completed due to low position.');
			setState((){
				getNewAccessListData = true;
				isLoadingAccessList = false;
			});
		}
		else{
			setState((){
				getNewAccessListData = true;
				isLoadingAccessList = false;
				anyUpdate = true;
			});
		}
	}

	BoxDecoration myBoxDecoration() {
  		return BoxDecoration(
    		border: Border.all(
    			width : 1.0,
    			color : Theme.of(context).primaryColor,
    		),
    		borderRadius: BorderRadius.all(
        		Radius.circular(5.0) 
    		),
  		);
	}

	Future<List<TicketAccessClass>> getTicketAccessList()async{

		if(getNewAccessListData){
			getNewAccessListData = false;
			ticketAccessList.clear();
			var json = await ApiCall.getDataFromApi(Uri.GET_TICKET+'/ticketAccessList/${widget.obj.ticketId}');
			

			if(json=='nothing'){
				return ticketAccessList;
			}

			for(int i=0;i<json.length;i++){
				int _ticketAccessListId = json[i]['ticketAccessListId'];
			    int _ticketId = json[i]['ticketId'];
			    int _companyExecutiveId = json[i]['companyExecutiveId'];
			    String _companyExecutiveName = json[i]['companyExecutiveName'];
			    bool _ownerFlag = json[i]['ownerFlag'];
			    String _accessApplicationTime = json[i]['accessApplicationTime'];

			    TicketAccessClass obj = TicketAccessClass(
			    	_ticketAccessListId,
				      _ticketId,
				      _companyExecutiveId,
				      _companyExecutiveName,
				      _ownerFlag,
				      _accessApplicationTime
			    );

			    ticketAccessList.add(obj);

			}
			return ticketAccessList;
		}
		else{
			return ticketAccessList;	
		}

		

	}

	Future<List<StatusLogClass>> getStatusLog() async{

		if(getNewStatusData){
			getNewStatusData = false;
			statusLogs.clear();
			var json = await ApiCall.getDataFromApi(Uri.GET_TICKET+'/ticketStatus/${widget.obj.ticketId}');
			if(json == 'nothing'){
				return statusLogs;
			}

			for(int i=0;i<json.length;i++){
				int _ticketStatusId = json[i]['ticketStatusId'];
			    int _ticketId = json[i]['ticketId'];
			    int _statusId = json[i]['statusId'];
			    String _statusName = json[i]['statusName'];
			    dynamic _workProgress = json[i]['workProgress'];
			    String _statusColorCode = json[i]['statusColorCode'];
			    String _lastEditOn = json[i]['lastEditOn'];
			    int _lastEditBy = json[i]['lastEditBy'];

			    StatusLogClass obj = StatusLogClass(
			    	_ticketStatusId,
				      _ticketId,
				      _statusId,
				      _statusName,
				      _workProgress,
				      _statusColorCode,
				      _lastEditOn,
				      _lastEditBy
			    );

			    statusLogs.add(obj);
			}

			return statusLogs;
		}
		else{
			return statusLogs;
		}
		
	}

	

	Widget makeStatusLogCard(var obj){
		return Card(
			elevation : 3.0,
			child : ListTile(
				dense : true,
				title : Text(obj.statusName),
				subtitle : Row(
		        	children : <Widget>[
		        		Container(
		        			width : double.parse(obj.workProgress.toString()),
		        			height : 10.0,
		        			decoration : BoxDecoration(
		        				borderRadius : BorderRadius.circular(8.0),
		        				color : Color(int.parse(obj.statusColorCode)),
		        			),
		        			
		        		),
		        		SizedBox(width : 15.0),
		        		Text(obj.workProgress.toString()+' %'),
		        	]
		        ),
				contentPadding: EdgeInsets.only(left: 10.0, top: 10.0),
				onTap : null,
			),
		);
	}

	Future<List<FollowupDateClass>> getFollowupdates() async{

		if(getNewFollowupDateData){
			getNewFollowupDateData = false;
			fud.clear();
			var json = await ApiCall.getDataFromApi(Uri.GET_TICKET+'/ticketFollowupDate/${widget.obj.ticketId}');
			print(json);
			if(json == 'nothing'){
				return fud;
			}

			for(int i=0;i<json.length;i++){
				int _ticketFollowupDateId = json[i]['ticketFollowupDateId'];
			    int _ticketId = json[i]['ticketId'];
			    String _followupDate = json[i]['followupDate'];

			    FollowupDateClass obj = FollowupDateClass(
			    	_ticketFollowupDateId, _ticketId, _followupDate
			    );

			    fud.add(obj);
			}
			return fud;
		}
		else{
			return fud;
		}

		
	}
	Widget makeFollowupDateCard(var obj){
		return Card(
			elevation : 7.0,
			child : ListTile(
				title : Text(obj.followupDate.substring(0,10)),
				onTap : (){},
				trailing : IconButton(
					icon : Icon(Icons.delete),
					onPressed : (){
						deleteFollowupDate(obj.ticketFollowupDateId);
					},
				),
			),
		);
	}

	deleteFollowupDate(int id) async{
		setState((){
			isLoadingFollowupDate = true;
		});
		var r = await ApiCall.deleteRecord(Uri.GET_TICKET+'/ticketFollowupDate/$id?ticketId=${widget.obj.ticketId}&companyExecutiveId=${CurrentUser.ownerId}');
		setState((){
			isLoadingFollowupDate = false;
			anyUpdate = true;
			getNewFollowupDateData = true;
		});
	}

	void showMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(message, style: TextStyle(color: Colors.white))));
  	}

	updateData() async{
		TicketClass t1 = TicketClass.toPut(
			ticketRemarks.text,
			startDateString,
			endDateString,
			priorityValue,
			CurrentUser.id,
			DateTime.now().toString().replaceAll('T',' ').substring(0,19)
		);

		var r = updateRecord(t1.toMapPut());
	}

	updateRecord(data) async{
		var r = await ApiCall.updateRecord(Uri.GET_TICKET+'/${widget.obj.ticketId}',data);
		showMessage(
			'Record Updated .'
		);
	}

	Future<List<TicketAccessClass>> getNonAccessibleExecutiveList()async{
		//var json = await ApiCall.getDataFromApi(Uri.GET_TICKET+'/ticketNonAccessibleExecutives/companyExecutive/${widget.obj.ticketId}?companyExecutiveId=${CurrentUser.id}');
		//http://085d61676e09.ngrok.io/ticket/ticketNonAccessibleExecutives/companyExecutive/176?companyExecutiveId=151
		var json = await ApiCall.getDataFromApi(Uri.GET_TICKET+'/ticketNonAccessibleExecutives/${widget.obj.ticketId}');
		List<TicketAccessClass> ticketAccessList = [];
		if(json=='nothing'){
			return ticketAccessList;
		}

		for(int i=0;i<json.length;i++){
			int _companyExecutiveId = int.parse(json[i]['companyExecutiveId']);
		    String _companyExecutiveName = json[i]['companyExecutiveName'];
		    String _contactNumber = json[i]['contactNumber'];
		    int _companyID = json[i]['companyID'];

		    TicketAccessClass obj = TicketAccessClass.remaining(
		    	_companyExecutiveId,
				_companyExecutiveName,
				_contactNumber,
				_companyID
		    );

		    ticketAccessList.add(obj);
		}

		return ticketAccessList;
	}

	Future<bool> getNonAccessibleExecutives(){
		return showDialog(
			context : context,
			builder : (c1){
				return StatefulBuilder(
					builder : (c,setState){
						return FutureBuilder(
							future : getNonAccessibleExecutiveList(),
							builder : (c,s){
								if(s.data==null){
									return Center(
										child : CircularProgressIndicator(),
									);
								}
								else{
									if(s.data.length==0){
										return AlertDialog(
										title : Text(
											'ERROR',
											style : TextStyle(
												color : Theme.of(context).primaryColor,
												fontSize : 20.0,
											),
										),
										content : Text('There are no Executives available to add.'),
										actions : <Widget>[
											FlatButton(
												child : Text(
													'OK',
													style : TextStyle(
														color : Theme.of(context).primaryColor,
													),
												),
												onPressed : (){
													Navigator.of(c1).pop();
												}
											),
										],
									);
									}
									else{
										return Dialog(
											child : Padding(
												padding : const EdgeInsets.all(8.0),
												child : Container(
													height : 330.0,
													width : 200.0,
													child : Column(
														children : <Widget>[
															Container(
																width : double.infinity,
																height : MediaQuery.of(c1).size.height * 0.07,
																//color : Colors.grey[200],
																padding : const EdgeInsets.all(8.0),
																child : Text(
																	'Available Executives',
																	style : TextStyle(
																		color : Theme.of(context).primaryColor,
																		fontSize : 25.0,
																		fontWeight : FontWeight.bold,
																	),
																),
																
															),
															Expanded(
																child : ListView.builder(
																	itemCount : s.data.length,
																	itemBuilder : (c,i){
																		return Consumer<ThemeNotifier>(
																			builder : (context,data,child){
																				return CheckboxListTile(
																					checkColor : data.getTheme().brightness == Brightness.dark ? Theme.of(context).accentColor : null,
																					activeColor : data.getTheme().brightness == Brightness.dark ? Colors.grey[800] : null,
																					title : Text(
																						s.data[i].companyExecutiveName,
																						style : TextStyle(
																							fontSize : 20.0,
																							fontWeight : FontWeight.w700,
																						),
																					),
																					value : tempCompanyExecutiveId.contains(s.data[i].companyExecutiveId),
																					onChanged : (v){
																						if(tempCompanyExecutiveId.contains(s.data[i].companyExecutiveId)){
																							setState((){
																								tempCompanyExecutiveId.remove(s.data[i].companyExecutiveId);
																							});
																						}
																						else{
																							setState((){
																								tempCompanyExecutiveId.add(s.data[i].companyExecutiveId);
																							});
																						}
																					}
																				);
																			}
																		);
																		
																		
																	}
																),
															),
															Row(
																mainAxisAlignment : MainAxisAlignment.end,
																//mainAxisSize : MainAxisSize.min,
																children : <Widget>[
																	
																	FlatButton(
																		child : Text(
																			'Cancel',
																			style : TextStyle(
																				color : Theme.of(context).primaryColor,
																				fontWeight : FontWeight.w500,
																			),
																		),
																		onPressed : (){
																			Navigator.of(c1).pop();
																		},
																	),
																	FlatButton(
																		child : Text(
																			'Grant Access',
																			style : TextStyle(
																				color  : tempCompanyExecutiveId.length > 0 ? Theme.of(context).primaryColor : Colors.grey,
																				//color : Theme.of(context).primaryColor,
																				fontWeight : FontWeight.w500,
																			),
																		),
																		onPressed : tempCompanyExecutiveId.length > 0 ? (){
																			addAccessToExecutive();
																			Navigator.of(c1).pop();
																		} : null,
																	),
																]
															),

														]
													),
												),
											),
										);
									}
								}
							}
						);
					}
				);
			}
		);
	}

	addAccessToExecutive() async{
		setState((){
			isLoadingAccessList = true;
		});
		for(int i=0;i<tempCompanyExecutiveId.length;i++){
			var map = Map<String,dynamic>();
			map['ticketId'] = widget.obj.ticketId;
			map['companyExecutiveId'] = tempCompanyExecutiveId[i];
			map['lastEditBy'] = CurrentUser.id;
			map['accessApplicationTime'] = DateTime.now().toString().replaceAll('T',' ').substring(0,19);

			var r = await createAccess(map);
		}
		setState((){
			getNewAccessListData = true;
			isLoadingAccessList = false;
			anyUpdate = true;
			tempCompanyExecutiveId = [];
		});
	}
	createAccess(data) async{
		var r = await ApiCall.createRecord(Uri.GET_TICKET+'/ticketAccessList',data);
	}

	Future<bool> addFollowupDate(){
		followupDate = TextEditingController();
		return showDialog(
			context : context,
			builder : (c){
				return StatefulBuilder(
					builder : (c1,setState){
						return AlertDialog(
							title : Text(
								'Add Followup Date',
								style : TextStyle(
									color : Theme.of(context).primaryColor,
								),
							),
							content : Form(
								key : _formKey5,
								autovalidate : _autoValidate5,
								child : Row(
									children : <Widget>[
										Expanded(
											child : TextFormField(
												controller : followupDate,
												decoration : InputDecoration(
													labelText : 'Followup Date',
													hintText : 'Enter Followup Date',

												),
												keyboardType: TextInputType.datetime,
												validator : (val) => isValidFollowupDate(val) ? null : 'Not a valid date',
											),
										),
										IconButton(
											icon : Icon(Icons.more_vert),
											onPressed : (){
												chooseFollowupDate(context);
											},
										),
									]
									

								),
							),
							actions : <Widget>[
								FlatButton(
									onPressed : (){
										Navigator.of(c).pop();
									},
									child : Text(
										'Cancel',
										style : TextStyle(
											color : Theme.of(context).primaryColor
										),
									),
								),
								FlatButton(
									onPressed : (){
										if(_formKey5.currentState.validate()){
											Navigator.of(c).pop();
											addFollowupDateRecord();
										}
										else{
											setState((){_autoValidate5 = true;});
										}
										
									},
									child : Text(
										'OK',
										style : TextStyle(
											color : Theme.of(context).primaryColor,
										),
									),
								),
								
							]
						);
					}
				);
			}
		);
	}

	addFollowupDateRecord() async{
		setState((){
			isLoadingFollowupDate = true;
		});
		var map = Map<String,dynamic>();
		map['ticketId']= widget.obj.ticketId;
		map['followupDate'] = followupDateString;
		map['lastEditBy'] = CurrentUser.id;
		map['lastEditOn'] = DateTime.now().toString().replaceAll('T',' ').substring(0,19);

		var r = await ApiCall.createRecord(Uri.GET_TICKET+'/ticketFollowupDate',map);
		print(r);
		if(r == 'nothing'){
			showMessage('Opertaion could not be completed due to bad date.');
		}
		setState((){
			getNewFollowupDateData = true;
			anyUpdate = true;
			isLoadingFollowupDate = false;
		});
	}

	Future<String> getRemainStatus()async{
		remainStatusItems.clear();
		var json = await ApiCall.getDataFromApi(Uri.GET_TICKET+'/ticketValidStatus/${widget.obj.ticketId}?companyId=${widget.obj.companyId}');

		if(json == 'nothing'){
			return 'nothing';
		}

		for(int i=0;i<json.length;i++){
			remainStatusItems.add(
				DropdownMenuItem<int>(
					value : json[i]['statusId'],
					//child : Text(json[i]['statusName'])
					child : Row(
						mainAxisAlignment : MainAxisAlignment.spaceBetween,
						children : <Widget>[
							Text(json[i]['statusName']),
							SizedBox(width : 10.0),
							Container(
								width : 20.0,
								height : 20.0,
								decoration : BoxDecoration(
									color : Color(int.parse(json[i]['statusColorCode'])),
									borderRadius : BorderRadius.circular(5.0),
								),
							),
						]
					),
				)
			);
		}

		return 'done';
	}

	updateStatusLog(){
		return showDialog(
			context : context,
			builder : (c){
				return FutureBuilder(
					future : getRemainStatus(),
					builder : (c1,s){
						if(s.data == null){
							return Center(child : CircularProgressIndicator());
						}
						else if(s.data == 'nothing'){
							return AlertDialog(
								title : Text(
									'ERROR',
									style : TextStyle(
										color : Theme.of(context).primaryColor,
										fontSize : 20.0,
									),
								),
								content : Text('There are no Status(es) available to add.'),
								actions : <Widget>[
									FlatButton(
										child : Text(
											'OK',
											style : TextStyle(
												color : Theme.of(context).primaryColor,
											),
										),
										onPressed : (){
											Navigator.of(c1).pop();
										}
									),
								],
							);
						}
						else{
							return StatefulBuilder(
								builder : (c2,st){
									return AlertDialog(
										title : Text(
											'Update Status',
											style : TextStyle(
												color : Theme.of(context).primaryColor,
												fontSize : 20.0,
											),
										),
										content : DropdownButtonHideUnderline(
											child : DropdownButtonFormField(
												decoration : InputDecoration(
													labelText : 'Status',
													hintText : 'Select Any one Status',
												),
												isDense : true,
												items : remainStatusItems,
												onChanged : (v){
													st((){
														remainStatusValue = v;
													});
												},
												value : remainStatusValue == -1 ? null : remainStatusValue,
											),
										),
										actions : <Widget>[
											FlatButton(
												child : Text(
													'OK',
													style : TextStyle(
														color : remainStatusValue == -1 ? Colors.grey : Theme.of(context).primaryColor,
													),
												),
												onPressed : remainStatusValue == -1 ? null : (){
													updateStausOfTicket();
													Navigator.of(c2).pop();
												}
											),
										],
									);
								}
							);
						}
					}
				);
			}
		);
	}

	updateStausOfTicket()async{
		setState((){
			isStatusLogLoading = true;
		});
		var map = Map<String,dynamic>();
		map['createdBy'] = CurrentUser.id;
		map['createdOn'] = DateTime.now().toString().substring(0,19);
		map['statusId'] = remainStatusValue;
		map['ticketId'] = widget.obj.ticketId;
		var r = await ApiCall.createRecord(Uri.GET_TICKET+'/ticketStatus',map);

		showMessage('Ticket Status Updated.!');
		setState((){
			isStatusLogLoading = false;
			getNewStatusData = true;
			remainStatusValue = -1;
		});
		
	}

	Widget build(BuildContext context){
		return Scaffold(
			key : _scaffoldKey,
			appBar : AppBar(
				leading : IconButton(
					icon :Icon(Icons.arrow_back),
					onPressed : (){
						anyUpdate ? Navigator.pop(context,true) : Navigator.pop(context,false);
					},
				),
				title : Text('Update Ticket'),
				bottom : TabBar(
					controller : tabController,
					indicatorColor : Colors.white,
					tabs : <Widget>[
						Tab(icon : Icon(Icons.filter_1)),
						Tab(icon : Icon(Icons.filter_2)),
						Tab(icon : Icon(Icons.filter_3)),
						Tab(icon : Icon(Icons.filter_4)),
					]
				),
			),
			floatingActionButton : showFab ? FloatingActionButton.extended(
				onPressed : (){
					if(tabController.index==3){
						getNonAccessibleExecutives();
					}
					else if(tabController.index==1){
						updateStatusLog();
					}
					else{
						addFollowupDate();
					}
				},
				icon : tabController.index==1 ? Icon(Icons.edit) : Icon(Icons.add),
				label : tabController.index==1 ? Text('UPDATE') : Text('Add'),
				shape : RoundedRectangleBorder(
					borderRadius : BorderRadius.all(Radius.circular(16.0)),
				),
			) : null,
			body : TabBarView(
				controller : tabController,
				children : <Widget>[
					Container(
						margin : const EdgeInsets.all(15.0),
						padding : const EdgeInsets.all(10.0),
						decoration : myBoxDecoration(),
						child : Form(
							autovalidate : _autoValidate1,
							key : _formKey1,
							child : ListView(
								children : <Widget>[
									Center(
										child : Text(
											'Ticket Details',
											textScaleFactor : 2.0,
											style : TextStyle(
                        color : Theme.of(context).primaryColor,
												fontWeight : FontWeight.bold,
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : enquiryRemarks,
											//enabled : false,
											decoration : InputDecoration(
												labelText : 'Enquiry Remarks',
												hintText : 'Enter Enquiry Remarks',
												border : OutlineInputBorder(
													borderSide : BorderSide(color : Colors.black),
												),
												focusedBorder : OutlineInputBorder(
													borderRadius : BorderRadius.all(Radius.circular(5.0)),
													borderSide : BorderSide(color : Color(0xffff2d55)),
												),
											),
											validator : (v) => v.isEmpty ? 'Enquiry Remarks is reuired .' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : ticketRemarks,
											//enabled : false,
											decoration : InputDecoration(
												labelText : 'Ticket Remarks',
												hintText : 'Enter Ticket Remarks',
												border : OutlineInputBorder(
													borderSide : BorderSide(color : Colors.black),
												),
												focusedBorder : OutlineInputBorder(
													borderRadius : BorderRadius.all(Radius.circular(5.0)),
													borderSide : BorderSide(color : Color(0xffff2d55)),
												),
											),
											validator : (v) => v.isEmpty ? 'Ticket Remarks is reuired .' : null,
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : companyName,
											enabled : false,
											decoration : InputDecoration(
												labelText : 'Company Name',
												border : OutlineInputBorder(
													borderSide : BorderSide(color : Colors.black),
												),
												focusedBorder : OutlineInputBorder(
													borderRadius : BorderRadius.all(Radius.circular(5.0)),
													borderSide : BorderSide(color : Color(0xffff2d55)),
												),
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : enquiryType,
											enabled : false,
											decoration : InputDecoration(
												labelText : 'Enquiry Type',
												border : OutlineInputBorder(
													borderSide : BorderSide(color : Colors.black),
												),
												focusedBorder : OutlineInputBorder(
													borderRadius : BorderRadius.all(Radius.circular(5.0)),
													borderSide : BorderSide(color : Color(0xffff2d55)),
												),
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : productName,
											enabled : false,
											decoration : InputDecoration(
												labelText : 'Product Name',
												border : OutlineInputBorder(
													borderSide : BorderSide(color : Colors.black),
												),
												focusedBorder : OutlineInputBorder(
													borderRadius : BorderRadius.all(Radius.circular(5.0)),
													borderSide : BorderSide(color : Color(0xffff2d55)),
												),
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : DropdownButtonHideUnderline(
											child : DropdownButtonFormField<int>(
												validator : (v) => v == null ? 'Please Select Priority' : null,
												decoration : InputDecoration(
													labelText : 'Priority',
													hintText : 'Select Priority',
												),
												isDense : true,
												autovalidate : _autoValidate1,
												items : priorityMenuItems,
												onChanged : (v){
													setState((){
														priorityValue = v;
													});
												},
												value : priorityValue,
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : TextFormField(
											controller : status,
											enabled : false,
											decoration : InputDecoration(
												labelText : 'Status',
												border : OutlineInputBorder(
													borderSide : BorderSide(color : Colors.black),
												),
												focusedBorder : OutlineInputBorder(
													borderRadius : BorderRadius.all(Radius.circular(5.0)),
													borderSide : BorderSide(color : Color(0xffff2d55)),
												),
											),
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : Row(
											children : <Widget>[
												Expanded(
													child : TextFormField(
														controller :startDate,
														decoration : InputDecoration(
															labelText : 'Start Date',
															hintText :'Enter Start Date',
														),
														keyboardType: TextInputType.datetime,
														validator : (val) => isValidStartDate(val) ? null : 'Not a valid date',
													),
												),
												IconButton(
													icon : Icon(Icons.more_vert),
													onPressed : (){
														chooseStartDate(context);
													},
												),
											]
										),
									),
									Padding(
										padding : const EdgeInsets.only(top : 20.0),
										child : Row(
											children : <Widget>[
												Expanded(
													child : TextFormField(
														controller :endDate,
														decoration : InputDecoration(
															labelText : 'End Date',
															hintText :'Enter End Date',
														),
														keyboardType: TextInputType.datetime,
														validator : (val) => isValidEndDate(val) ? null : 'Not a valid date',
													),
												),
												IconButton(
													icon : Icon(Icons.more_vert),
													onPressed : (){
														chooseEndDate(context);
													},
												),
											]
										),
									),
									Container(
										height : 60.0,
									),
									Align(
										alignment : Alignment.bottomRight,
										child : RaisedButton(
											onPressed : (){
												if(_formKey1.currentState.validate()){
													
													updateData();
													setState((){
														firstIcon = Icon(Icons.check_circle);
								    					completed[0]=true;
								    					anyUpdate = true;
													});
													tabController.animateTo(1);
													
												}
												else{
													setState((){
														_autoValidate1 = true;
														completed[0]=false;
														firstIcon = Icon(Icons.error_outline);
													});
												}
											},
											color : Theme.of(context).accentColor,
											child : Padding(
												padding : EdgeInsets.fromLTRB(0.5*5,0,0.5*5,0),
												child : Row(
													mainAxisAlignment : MainAxisAlignment.end,
													mainAxisSize : MainAxisSize.min,
													children : <Widget>[
														Text(
														'Update ',
														style: TextStyle(
															fontSize: 20,
															fontWeight: FontWeight.w700,
															color: Colors.white,
															),
														),
														Container(width : 10.0),
														Icon(
															Icons.arrow_forward,
															color: Colors.white,
														),
													]
												),
											),
										),
									),
								]
							),
						),
					),
					IgnorePointer(
						ignoring : isStatusLogLoading,
						child : Stack(
							children : <Widget>[
								FutureBuilder(
									future : getStatusLog(),
									builder : (c,s){
										if(s.data == null){
											return Center(
												child : CircularProgressIndicator(),
											);
										}
										else{
											if(s.data.length==0){
												return Center(
													child : Text('No Data exists.!'),
												);
											}
											else{
												return ListView.builder(
													itemCount : s.data.length+1,
													itemBuilder : (c,i){
														if(i==0){
															return Padding(
																padding : const EdgeInsets.all(8.0),
																child : Text(
																	'Status Log Details',
																	style : TextStyle(
																		fontSize : 25.0,
																		fontWeight : FontWeight.bold,
																	),
																)
															);
														}
														else{
															return makeStatusLogCard(s.data[i-1]);
														}
													}
												);
											}
										}
									}
								),
								isStatusLogLoading ? Center(child : CircularProgressIndicator()) : Container(),
							]
						),
					),
					
					Column(
						crossAxisAlignment : CrossAxisAlignment.start,
							children : <Widget>[
								
								Padding(
									padding : const EdgeInsets.all(8.0),
									child : Text(
										'Followup Dates',
										style : TextStyle(
											fontSize : 25.0,
											fontWeight : FontWeight.bold,
										),
									),
								),
								Expanded(
									child : IgnorePointer(
										ignoring : isLoadingFollowupDate,
										child : Stack(
											children : <Widget>[
												FutureBuilder(
													future : getFollowupdates(),
													builder : (c,s){
														if(s.data==null){
															return Center(
																child : CircularProgressIndicator(),
															);
														}
														else{
															if(s.data.length==0){
																return Center(
																	child : Padding(
																		padding : const EdgeInsets.only(top : 25.0),
																		child : Text(
																			'No Followup Dates at present',
																		),
																	),
																);
															}
															else{
																return ListView.builder(
																	itemCount : s.data.length,
																	itemBuilder : (c,i){
																		return makeFollowupDateCard(s.data[i]);
																	}
																);
															}
														}
													}
												),
												isLoadingFollowupDate ? Center(child : CircularProgressIndicator()) : Container(),
											]
										),
									),
								),
								
								
							]
						),

					FutureBuilder(
						future : getTicketAccessList(),
						builder : (c,s){
							if(s.data==null){
								return Center(
									child : CircularProgressIndicator(),
								);
							}
							else{
								if(s.data.length==0){
									return Center(
										child : Text('No Executives are assigned yet.')
									);
								}
								else{
									return IgnorePointer(
										ignoring : isLoadingAccessList,
										child : Stack(
											children : <Widget>[
												ListView.builder(
													itemCount : s.data.length+1,
													itemBuilder : (c,i){
														if(i==0){
															return Padding(
																padding : const EdgeInsets.all(8.0),
																child : Text(
																	'Ticket Access List',
																	style : TextStyle(
																		fontSize : 25.0,
																		fontWeight : FontWeight.bold,
																		//color : Theme.of(context).primaryColor,
																	),
																),
															);
														}
														else{
															return makeCard(s.data[i-1]);
														}
													}
												),
												isLoadingAccessList ? Center(child : CircularProgressIndicator()) : Container(),
											]
										),
									);
								}
							}
						}
					),
				]
			),
		);
	}
}