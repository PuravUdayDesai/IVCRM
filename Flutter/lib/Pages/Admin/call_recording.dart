//default
import 'package:flutter/material.dart';


//custom
import '../../Models/Company/call_recording_model.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Widgets/custom_drawer.dart';
import 'audio_provider.dart';


class CallRecording extends StatefulWidget{

	final int id;
	CallRecording(this.id);

	@override
	_CallRecordingState createState ()=> _CallRecordingState();
}

class _CallRecordingState extends State<CallRecording>{

	bool isLoading = false;

	refresh(context){
		return FutureBuilder(
			future : getData(),
			builder : (c,s){
				if(s.data == null){
					return Center(child : CircularProgressIndicator());
				}
				else{
					if(s.data.length == 0){
						return Center(child : Text('No Data Exists.!!'));
					}
					else{
						return IgnorePointer(
							ignoring : isLoading,
							child : Stack(
								children : <Widget>[
									ListView.builder(
										itemCount : s.data.length,
										itemBuilder : (c,i){
											return makeCard(s.data[i]);
										}
									),
									isLoading ? Center(child : CircularProgressIndicator()) : Container(),
								]
							),
						);
					}
				}
			}
		);
	}

	Future<List<CallRecordingClass>> getData() async {
		var json = await ApiCall.getDataFromApi(Uri.GET_CALL_TRANSACTION+'/${widget.id}');
		List<CallRecordingClass> callRecordings = [];
		if(json=="nothing")
		{
		  return callRecordings;
		}
		for (int i = 0; i < json.length; i++) {

		  
		int _callTransactionId = json[i]['callTransactionId'];
		int _clientId = json[i]['clientId'];
		int _companyExecutiveId = json[i]['companyExecutiveId'];
		String _clientNameOnCompanyExecutiveList = json[i]['clientNameOnCompanyExecutiveList'];
		String _clientContactNumber = json[i]['clientContactNumber'];
		int _callType = json[i]['callType'];
		dynamic _talkDuration = json[i]['talkDuration'];
		String _callTime = json[i]['callTime'];
		String _fileURL = json[i]['fileURL'];
		print(_fileURL);  
		String _filePath = json[i]['filePath'];

		  CallRecordingClass obj = new CallRecordingClass.retrieve(
		    _callTransactionId,
		    _clientId,
		    _companyExecutiveId,
		    _clientNameOnCompanyExecutiveList,
		    _clientContactNumber,
		    _callType,
		    _talkDuration,
		    _callTime,
		    _fileURL,
		    _filePath
		  );
		  
		  callRecordings.add(obj);
		}
		return callRecordings;
	}

	Widget makeCard(var obj) {
	String callTimeFormatted = obj.callTime;
	List<String> data= callTimeFormatted.split(" ");
	print(data);
	List<String> data1 = data[0].split("-");
	callTimeFormatted = data1[2]+"/"+data1[1]+"/"+data1[0]+" "+data[1];
	print('defefwefwf  ${obj.talkDuration}');	
	      return Column(
			  children: [
			    Card(
			        elevation: 7,
			        child: ListTile(
			            dense: false,
			            isThreeLine: true,
			            title: Text(obj.clientNameOnCompanyExecutiveList),
			            subtitle : Column(
			              mainAxisSize : MainAxisSize.min,
			              children : <Widget>[
			                // /*Expanded(
			                //   child : Text(obj.clientContactNumber+"\n"+callTimeFormatted),
			                // ),*/
			                // /*Expanded(
			                //   child : AudioProvider(),
			                // ),*/
			                // Flexible(
			                //   fit: FlexFit.loose,
			                //   child : Text(obj.clientContactNumber+"\n"+callTimeFormatted),
			                // ),
			                
			                Flexible(
			                  fit: FlexFit.loose,
			                  child : AudioProvider(obj.fileURL,obj.talkDuration.toString()),
			                  //child : AudioProvider('https://codingwithjoe.com/wp-content/uploads/2018/03/applause.mp3'),
			                  //child: AudioProvider('http://mirrors.standaloneinstaller.com/audio-sample/aac/in.aac'),
			                  //child : AudioProvider('http://192.168.43.32:8082/callTransaction/fileDownload?filePath=callTransaction/25/27/2020-04-14 10.10.11.0&fileName=disco.mp3'),
			                )
			              ],
			            ),
			            /*trailing: Row(
			              mainAxisSize : MainAxisSize.min,
			              children : [
			                IconButton(
			                  icon : Icon(Icons.info_outline),
			                  iconSize : 30.0,
			                  onPressed : (){
			                    //_bottomSheet(context,obj);
			                  }
			                  ),
			                IconButton(
			                icon: Icon(Icons.delete),
			                iconSize: 30.0,
			                onPressed: () {
			                  showDialog(
			                      context: context,
			                      builder: (BuildContext context) {
			                        return AlertDialog(
			                          title: Text("Sure?",
			                              style: TextStyle(
			                                color: Colors.red,
			                              )),
			                          content: Text("Are you sure want to delete.?"),
			                          actions: <Widget>[
			                            FlatButton(
			                              color: Color(0xffff2d55),
			                              child: Text("Yes",
			                                  style: TextStyle(
			                                    fontSize: 15.0,
			                                  )),
			                              onPressed: () {
			                                Navigator.of(context, rootNavigator: true)
			                                    .pop();
			                                //deleteRecord(obj.callTransactionId);
			                                setState(() {
			                                });
			                              },
			                            ),
			                            FlatButton(
			                              child: Text("No",
			                                  style: TextStyle(
			                                    fontSize: 15.0,
			                                  )),
			                              onPressed: () {
			                                Navigator.of(context).pop();
			                              },
			                            ),
			                          ],
			                        );
			                      });
			                }),

			                ],
			              ),*/
			            onTap: null,
			            )),
			    Divider(),
			  ],
			);
	    


	}


	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			appBar : AppBar(
				title : Text('Call Recordings'),
			),
			body : refresh(context),			
		);
	}
}