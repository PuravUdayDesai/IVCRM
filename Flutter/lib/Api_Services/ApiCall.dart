import "dart:convert";
import "dart:async";
import "package:http/http.dart" as http;
//import "URI.dart";
import "dart:core";
//import 'package:dio/dio.dart';
import '../User/current_user.dart';


class ApiCall
{
	static getDataFromApiWithData(baseURI,data) async
	{
		try
		{
			// print(baseURI);	
			// Uri uri = Uri.parse(baseURI);
			// final newURI = uri.replace(queryParameters: data);
			// print(newURI);
			// var response = await http.get(
			// 	newURI,
			// 	headers : {
			// 		"Accept" : "application/json"
			// 	}
			// );
			// print(response.statusCode);
			// if(response.statusCode != 200){
			// 	return "nothing";
			// }
			// else{
			// 	var jsondata = jsonDecode(response.body);
			// 	return jsondata;
			// }
			// final request = Request('GET', baseURI);

			// request.body = data;

			// final response = await  request.send().stream.first;
			// print(response);
		}
		catch(e)
		{
			print(e);
		}
	}
	static getDataFromApi(baseURI) async
	{
		//print('in fn access token = ${CurrentUser.ACCESS_TOKEN}');
		try
		{
			print(baseURI);	
			var response = await http.get(
		        baseURI,
		        headers : {
		          "Accept" : "application/json",
		          "Authorization" : CurrentUser.ACCESS_TOKEN
		        }
		        );
			print(response.statusCode.toString());
			if(response.statusCode!=200)
			{
				return "nothing";
			}
			else
			{
				//print("data without decoding  = ${response.body}");
				//print("statuc code = ${response.statusCode}");
				var jsonData = jsonDecode(response.body);

				return jsonData;
			}
			
		}
		catch(e)
		{
			print("Here");
			print(e);
		}
	}
	static getDataFromApiUsingToken(baseURI,token) async
	{
		try
		{
			print(baseURI);	
			print('token = $token');
			var response = await http.get(
		        baseURI,
		        headers : {
		          "Accept" : "application/json",
		          "Authorization" : token
		        }
		        );
			print(response.statusCode.toString());
			if(response.statusCode!=200)
			{
				return "nothing";
			}
			else
			{
				//print("data without decoding  = ${response.body}");
				//print("statuc code = ${response.statusCode}");
				var jsonData = jsonDecode(response.body);

				return jsonData;
			}
			
		}
		catch(e)
		{
			print("Here");
			print(e);
		}
	}
	static getData(baseURI) async
	{
		try
		{
			print(baseURI);	
			var response = await http.get(
		        'http://565a2543e1d5.ngrok.io/callTransaction/fileDownload?filePath=callTransaction/184/49/2020-08-31 07.07.07.0&fileName=10247sound.aac',
		        headers : {
		          "Accept" : "application/aac",
		          "Authorization" : CurrentUser.ACCESS_TOKEN
		        }
		        );
			print(response.statusCode);
			if(response.statusCode!=200)
			{
				return "nothing";
			}
			else
			{
				//print("data without decoding  = ${response.body}");
				//print("statuc code = ${response.statusCode}");
				//var jsonData = jsonDecode(response.body);
				//print(jsonData);
				return response.body;
			}
			
		}
		catch(e)
		{
			print("Here");
			print(e);
		}
	}
	static createRecord(baseURI,dataa,{authorization = true}) async
	{
		// print(dataa.toString());
		String str = jsonEncode(dataa);
		print("str = ${str}");
		if(authorization){
			try
			{
				http.Response response = await http.post(baseURI,body : jsonEncode(dataa),headers : {
	              "Accept" : "application/json",
	              "Content-Type" : "application/json",
	              "Authorization" : CurrentUser.ACCESS_TOKEN
				            });
				      final int statusCode = response.statusCode;
				      print(statusCode);
				    if(response.statusCode!=201 && response.statusCode!=200){
						return "nothing";
					}
					else{
						var jsonData = jsonDecode(response.body);
						return jsonData;
					}

			}
			catch(e)
			{
				print(e);
			}
		}
		else{
			try
			{
				print('authorization = $authorization');
				http.Response response = await http.post(baseURI,body : jsonEncode(dataa),headers : {
	              "Accept" : "application/json",
	              "Content-Type" : "application/json",
				            });
				      final int statusCode = response.statusCode;
				      print(statusCode);
				    if(response.statusCode!=200){
						return "nothing";
					}
					else{
						var jsonData = jsonDecode(response.body);
						return jsonData;
					}

			}
			catch(e)
			{
				print(e);
			}
		}
	}
	// /*static createRecordWIthFormData(baseURI,dataa) async
	// {
	// 	try
	// 	{
	// 		FormData formData = new FormData.fromMap({
			    
	// 		        "file": await MultipartFile.fromFile(dataa['qualifiedFilePath'],filename: "my.ogg"),
	// 		  });

	// 		var response = await Dio().post(baseURI, data: formData);
	// 		final int statusCode = response.statusCode;
	// 		      print(statusCode);
	// 		/*var uri = Uri.parse(baseURI);
	// 		var request = await http.MultipartRequest("POST",uri);
	// 		//request.fields['qualifiedFilePath'] = dataa['qualifiedFilePath'];
	// 		//print(request.fields.toString());
	// 		request.files.add(new http.MultipartFile.fromPath(
	// 		    'qualifiedFilePath',
	// 		    dataa['qualifiedFilePath'],
	// 		    //contentType: new MediaType('application', 'text')
	// 		    ));
	// 		request.send().then((response){
	// 			final int statusCode = response.statusCode;
	// 		      print(statusCode);
	// 		      //return (json.decode(response.body));
	// 			});*/
	// //	}
	// 		/*
	// 		http.Response response = await http.MultipartRequest("POST",baseURI)
	// 		(baseURI,body : jsonEncode(dataa),headers : {
 //              "Accept" : "application/form-data"
	// 		            });
	// 		      final int statusCode = response.statusCode;
	// 		      print(statusCode);
	// 		      if (statusCode < 200 || statusCode > 400 || json == null) 
	// 	      	{
	// 	      		print("Error while fetching data");
	// 	    	}
	// 	      return (json.decode(response.body));
	// 	}*/
	// 	/*try
	// 	{
	// 		http.Response response = await http.post(baseURI,body : jsonEncode(dataa),headers : {
 //              "Accept" : "application/json",
 //              "Content-Type" : "application/form-data"
	// 		            });
	// 		      final int statusCode = response.statusCode;
	// 		      print(statusCode);
	// 		      if (statusCode < 200 || statusCode > 400 || json == null) 
	// 	      	{
	// 	      		print("Error while fetching data");
	// 	    	}
	// 	      return (json.decode(response.body));
	// 	}*/
	// /*	catch(e)
	// 	{
	// 		print(e);
	// 	}
	// }*/
	static updateRecord(baseURI,dataa) async
	{
		print(baseURI);
		String str = jsonEncode(dataa);
		print("str = ${str}");
		try
		{
			http.Response response = await http
		    .put(baseURI, body: jsonEncode(dataa),headers : {
              "Accept" : "application/json",
              "Content-Type" : "application/json",
              "Authorization" : CurrentUser.ACCESS_TOKEN
			            });
		    final int statusCode = response.statusCode;
		    print(statusCode);
		    if (statusCode < 200 || statusCode > 400 || json == null) {
		      print("Error while fetching data");
		    }
		    //print("sdfeg = ${response.body}");
		    return (json.decode(response.body));
		}
		catch(e)
		{
			print(e);
		}
	}
	static deleteRecord(baseURI) async
	{
		print(baseURI);
		try
		{
			http.Response response =
		        await http.delete(baseURI,headers : {
		        	"Authorization" : CurrentUser.ACCESS_TOKEN
		        });
		    final int statusCode = response.statusCode;
		    print(statusCode);
		    if (statusCode!=200) {
		      return 'nothing';
		    }
		    print(response.body);
		    return (json.decode(response.body));
		}
		catch(e)
		{
			print(e);
		}
	}
}