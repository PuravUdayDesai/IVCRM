//default
import 'package:flutter/material.dart';

//plugins
import 'package:provider/provider.dart';


//custom
import '../../Models/Company/product_model.dart';
import '../../Widgets/custom_drawer.dart';
import '../../User/current_user.dart';
import "../../Api_Services/ApiCall.dart";
import "../../Api_Services/Uri.dart";
import '../../Bloc/theme.dart';


class Product extends StatefulWidget{
	@override
	_ProductState createState ()=> _ProductState();
}

List<ProductClass> products = [];

class _ProductState extends State<Product>{

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCompanyData = true;

	GlobalKey<FormState> _formKey;
	GlobalKey<ScaffoldState> _scaffoldKey;
	TextEditingController productName;
	TextEditingController productDescription;
	TextEditingController monthlyBilling;

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;


	void showMessage(String message) {
		_scaffoldKey.currentState.showSnackBar(new SnackBar(
		content: new Text(message),
		));
	}


	deleteProduct(int id) async {
		setState((){isLoading = true;});
		var response1 = await ApiCall.deleteRecord(Uri.GET_PRODUCT + "/$id");
		setState((){
			isLoading = false;
			getNewData = true;
		});
		showMessage('Record Successfully Deleted.!');
	}

	

	

	addData() async {

		setState((){
			isLoading = true;
		});
		String createdOn = DateTime.now().toString().substring(0,19);

        ProductClass c1 = new ProductClass.toPost(
		    productName.text,
		    productDescription.text,
		    companyValue,
		    monthlyBilling.text,
		    CurrentUser.id,
		    createdOn
        );
    	var response1 = await ApiCall.createRecord(Uri.GET_PRODUCT, c1.toMap());
    	showMessage("Poduct Added with name ${c1.productName}");
    	setState((){
    		isLoading = false;
    		getNewData = true;
    		companyValue = -1;
    		autoValidate = false;
    	});
	}

	updateData(id) async{
		setState((){isLoading = true;});
	    String lastEditOn = DateTime.now().toString().substring(0,19);
	    ProductClass c1 = new ProductClass.toPut(
			productName.text,
			productDescription.text,
			companyValue,
			monthlyBilling.text,
			CurrentUser.id,
			lastEditOn
		);
		var response1 = await ApiCall.updateRecord(Uri.GET_PRODUCT + "/$id", c1.toMapPut());
		setState((){
			getNewData = true;
			companyValue = -1;
			autoValidate = false;
			isLoading = false;
		});
		showMessage("Poduct updated with name ${c1.productName}");
	}

	Future<String> getCompanyData()async{
		if(getNewCompanyData){
			getNewCompanyData = false;
			var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY+'/owner/${CurrentUser.id}');
			companyMenuItems.clear();
			for(int i=0;i<response1.length;i++){
				companyMenuItems.add(
					DropdownMenuItem<int>(
						value : response1[i]['companyId'],
						child : Text(response1[i]['companyName'])
					),
				);
			}
			return 'done';
		}
		else{
			return 'done';
		}
	}


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

	Future<List<ProductClass>> getData() async {

		if(getNewData){
			getNewData = false;
			var json = await ApiCall.getDataFromApi(Uri.GET_PRODUCT+"/owner/${CurrentUser.id}");

			if(products.length!=0){
			  products.clear();
			}
			if(json=="nothing"){
			  return products;
			}


			for (int i = 0; i < json.length; i++) {
			  int _id = json[i]['id'];
			  String _productName = json[i]['productName'];
			  String _productDescription = json[i]['productDescription'];
			  int _companyId = json[i]['companyId'];
			  String _companyName = json[i]['companyName'];
			  dynamic _cost = json[i]['cost'];
			  int _createdBy = json[i]['createdBy'];
			  String _createdOn = json[i]['createdOn'];
			  int _lastEditBy = json[i]['lastEditBy'];
			  String _lastEditOn = json[i]['lastEditOn'];
			  bool _isActive = json[i]['isActive'];
			  ProductClass obj = new ProductClass.retrieve(
			    _id,
			    _productName,
			    _productDescription,
			    _companyId,
			    _companyName,
			    _cost,
			    _createdBy,
			    _createdOn,
			    _lastEditBy,
			    _lastEditOn,
			    _isActive
			  );
			  products.add(obj);
			}
			return products;
		}
		else{
			return products;
		}	
	}

	Widget makeCard(var obj){
		return Column(
		  children: [
		    Card(
		        elevation: 7,
		        child: ListTile(
		            dense: false,
		            isThreeLine: true,
		            title: Text(obj.productName,style : TextStyle(color : Theme.of(context).primaryColor,fontWeight : FontWeight.bold)),
		            subtitle: Text(obj.cost.toString()+" Rs.\n"+obj.companyName),
		            trailing: Row(
		              mainAxisSize : MainAxisSize.min,
		              children : [
		                IconButton(
		                  icon : Icon(Icons.info_outline,size : 25.0,color : Colors.grey),
		                  onPressed : (){
		                    _bottomSheet(context,obj);
		                  }
		                  ),
		                IconButton(
		                icon: Icon(Icons.delete,size : 25.0,color : Colors.grey),
		                onPressed: () {
		                  showDialog(
		                      context: context,
		                      builder: (BuildContext c) {
		                        return AlertDialog(
		                          title: Text("Sure?",
		                              style: TextStyle(
		                              color: Theme.of(context).accentColor,
		                              )),
		                          content: Text("Are you sure want to delete.?"),
		                          actions: <Widget>[
		                            FlatButton(
			                              color : Theme.of(context).primaryColor,
			                              child: Text("No",
			                                  style: TextStyle(
			                                    fontSize: 15.0,
			                                  )),
			                              onPressed: () {
			                                Navigator.of(c).pop();
			                              },
			                            ),
			                            FlatButton(
			                              child: Text("Yes",
			                                  style: TextStyle(
			                                    fontSize: 15.0,
			                                  )),
			                              onPressed: () {
			                                Navigator.of(c)
			                                    .pop();
			                                deleteProduct(obj.id);
			                              },
			                            ),
		                          ],
		                        );
		                      }
		                      );
		                }),

		                ],
		              ),
		            onTap: () {
		              updateProduct(obj);
		            })),
		    Divider(),
		  ],
		);
	}

	void _bottomSheet(context,obj){

	    showModalBottomSheet(
	    	context : context,
	    	shape : RoundedRectangleBorder(
	    		borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
	    	),
	    	builder : (c){
	    		return Padding(
	    			padding : const EdgeInsets.all(16.0),
	    			child : SingleChildScrollView(
	    				child : Column(
	    					children : <Widget>[	
	    						Center(child : Text('Product Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: Text("Product name : "+obj.productName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Product description : "+obj.productDescription),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Company name: "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Cost : ${obj.cost.toString()} Rs."),
									onTap: () => {},          
								),
								Divider(color : Theme.of(context).accentColor,),
					            ListTile(
					              title : Text('Other Details.',textScaleFactor : 1.5,style : TextStyle(
					                color : Theme.of(context).primaryColor,
					                fontWeight : FontWeight.w600)),
					            ),
								ListTile(
									title: new Text("Created On : "+obj.createdOn),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Last edit on : "+obj.lastEditOn),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("isActive : "+obj.isActive.toString()),
									onTap: () => {},          
								),
								SizedBox(height : 10.0),
	    					]
	    				),
	    			),
	    		);
	    	}
	    );
	}

	addProduct(){

		productName = TextEditingController();
		productDescription  = TextEditingController();
		monthlyBilling = TextEditingController();

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getCompanyData(),
					builder : (c,s){
						if(s.data == null){
							return Center(child : CircularProgressIndicator());
						}
						else{
							return StatefulBuilder(
								builder : (c,st){
									return Dialog(
										shape : RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
										child : Container(
											width : 250.0,
											constraints : BoxConstraints(
												maxHeight : 350.0,
											),
											child : Stack(
												children : <Widget>[
													ListView(
													padding : const EdgeInsets.all(16.0),
														children : <Widget>[
															Center(
											          			child : Text('Add new Product',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(context).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey,
											          			autovalidate : autoValidate,
											          			child : Column(
											          				children : <Widget>[
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v) => v == null ? 'Please select company' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company',
																					hintText : 'Select Company',
																				),
																				autovalidate : autoValidate,
																				items : companyMenuItems,
																				onChanged : (v){
																					st((){
																						companyValue = v;
																					});
																					
																				},
																				value : companyValue == -1 ? null : companyValue,
											          						),
											          					),
											          					TextFormField(
												                  			controller : productName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Product Name',
												                  				labelText : 'Product Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Product Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : productDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Product Description',
												                  				labelText : 'Product Description',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Please Enter Product Description.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : monthlyBilling,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Monthly Billing',
												                  				labelText : 'Monthly Billing',
												                  			),
												                  			//validator  : (v)=> v.isEmpty ? 'Please Enter Monthly Billing.' : null,
												                  			validator : (v){
																			try{
																				double a= double.parse(v.toString());
																				return null;
																			}
																			catch(e){
																				return 'Please enter numeric value';
																			}
																		}

												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					addData();
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate = true;
												                  					});
												                  				}
												                  			},
												                  			child : Container(
												                  				height : 50.0,
												                  				width : 175.0,
												                  				decoration : BoxDecoration(
												                  					borderRadius : BorderRadius.all(Radius.circular(5.0)),
												                  					color : Theme.of(context).accentColor,
												                  				),
												                  				alignment : Alignment.center,
												                  				child : Text('Add',textScaleFactor : 1.5,
												                  					style : TextStyle(
												                  						color : Colors.white,
												                  					),
												                  				),
												                  			),
												                  		),
											          				]
											          			),
											          		),
														]
													),
													Positioned(
											        	right : -5.0,
											        	top : -5.0,
											        	child : IconButton(
											        		icon : Icon(Icons.clear),
											        		onPressed : (){
											        			Navigator.of(c).pop();
											        			setState((){
											        				companyValue = -1;
											        				autoValidate= false;
											        			});
											        		}
											        	),
											        ),
												]
											),
										),
									);
								}
							);
						}
					}
				);
			}
		);
	}

	updateProduct(obj){
		productName = TextEditingController();
		productDescription  = TextEditingController();
		monthlyBilling = TextEditingController();

		productName.text = obj.productName;
		productDescription.text = obj.productDescription;
		monthlyBilling.text = obj.cost.toString();

		companyValue = obj.companyId;		

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getCompanyData(),
					builder : (c,s){
						if(s.data == null){
							return Center(child : CircularProgressIndicator());
						}
						else{
							return StatefulBuilder(
								builder : (c,st){
									return Dialog(
										shape : RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
										child : Container(
											width : 250.0,
											constraints : BoxConstraints(
												maxHeight : 350.0,
											),
											child : Stack(
												children : <Widget>[
													ListView(
													padding : const EdgeInsets.all(16.0),
														children : <Widget>[
															Center(
											          			child : Text('Update Product',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(context).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey,
											          			autovalidate : autoValidate,
											          			child : Column(
											          				children : <Widget>[
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v) => v == null ? 'Please select company' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company',
																					hintText : 'Select Company',
																				),
																				autovalidate : autoValidate,
																				items : companyMenuItems,
																				onChanged : (v){
																					st((){
																						companyValue = v;
																					});
																					
																				},
																				value : companyValue == -1 ? null : companyValue,
											          						),
											          					),
											          					TextFormField(
												                  			controller : productName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Product Name',
												                  				labelText : 'Product Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter Product Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : productDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Product Description',
												                  				labelText : 'Product Description',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter Product Description.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : monthlyBilling,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Monthly Billing',
												                  				labelText : 'Monthly Billing',
												                  			),
												                  			validator : (v){
																			try{
																				double a= double.parse(v.toString());
																				return null;
																			}
																			catch(e){
																				return 'Please enter numeric value';
																			}
																		}
												                  			//validator  : (v)=> v.isEmpty ? 'Enter Monthly Billing.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.id);
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate = true;
												                  					});
												                  				}
												                  			},
												                  			child : Container(
												                  				height : 50.0,
												                  				width : 175.0,
												                  				decoration : BoxDecoration(
												                  					borderRadius : BorderRadius.all(Radius.circular(5.0)),
												                  					color : Theme.of(context).accentColor,
												                  				),
												                  				alignment : Alignment.center,
												                  				child : Text('Update',textScaleFactor : 1.5,
												                  					style : TextStyle(
												                  						color : Colors.white,
												                  					),
												                  				),
												                  			),
												                  		),
											          				]
											          			),
											          		),
														]
													),
													Positioned(
											        	right : -5.0,
											        	top : -5.0,
											        	child : IconButton(
											        		icon : Icon(Icons.clear),
											        		onPressed : (){
											        			Navigator.of(c).pop();
											        			setState((){
											        				companyValue = -1;
											        				autoValidate= false;
											        			});
											        		}
											        	),
											        ),
												]
											),
										),
									);
								}
							);
						}
					}
				);
			}
		);
	}


	@override
	void initState() {
		super.initState();
		_formKey = GlobalKey<FormState>();
		_scaffoldKey = new GlobalKey<ScaffoldState>();
	}

	@override
	Widget build(BuildContext context){
		return Scaffold(
			key: _scaffoldKey,
			appBar : AppBar(
				title : Text('Product Details'),
				actions : <Widget>[
		          IconButton(
		            icon : Icon(Icons.search),
		            onPressed:(){
		              showSearch(context : context , delegate : DataSearch()).then((value){
		                if(value=='delete'){
		                  showMessage('Deleted Successfully.!!');
		                  setState((){
		                  getNewData = true;
		                });
		                }
	                   if(value=='update'){
	                    showMessage('Deleted Successfully.!!');
	                    setState((){
		                  getNewData = true;
		                });
	                  }
		                
		                
		                
		               });
		              },
		          )
		        ],
			),
			drawer : CustomDrawer(productSelected : true),
			body : refresh(context),
			floatingActionButton : FloatingActionButton.extended(
				label : Text('Add'),
				icon : Icon(Icons.add),
				onPressed : (){
					addProduct();
				},
				shape: RoundedRectangleBorder(
            		borderRadius: BorderRadius.all(Radius.circular(16.0))
            	),
			),
		);
	}
}

class DataSearch extends SearchDelegate<String>
{

	bool getNewData = true;
	bool isLoading = false;
	bool autoValidate = false;
	bool getNewCompanyData = true;

	GlobalKey<FormState> _formKey = GlobalKey<FormState>();
	TextEditingController productName= TextEditingController();
	TextEditingController productDescription= TextEditingController();
	TextEditingController monthlyBilling = TextEditingController();

	List<DropdownMenuItem<int>> companyMenuItems = [];

	int companyValue = -1;

	updateData(id,context) async{
	    String lastEditOn = DateTime.now().toString().substring(0,19);
	    ProductClass c1 = new ProductClass.toPut(
			productName.text,
			productDescription.text,
			companyValue,
			monthlyBilling.text,
			2,
			lastEditOn
		);
		var response1 = await ApiCall.updateRecord(Uri.GET_PRODUCT + "/$id", c1.toMapPut());
		close(context,'update');
	}

	Future<String> getCompanyData()async{
		if(getNewCompanyData){
			getNewCompanyData = false;
			var response1 = await ApiCall.getDataFromApi(Uri.GET_COMPANY+'owner/${CurrentUser.id}');
			companyMenuItems.clear();
			for(int i=0;i<response1.length;i++){
				companyMenuItems.add(
					DropdownMenuItem<int>(
						value : response1[i]['companyId'],
						child : Text(response1[i]['companyName'])
					),
				);
			}
			return 'done';
		}
		else{
			return 'done';
		}
	}
		

	updateProduct(obj,context){
		productName = TextEditingController();
		productDescription  = TextEditingController();
		monthlyBilling = TextEditingController();

		productName.text = obj.productName;
		productDescription.text = obj.productDescription;
		monthlyBilling.text = obj.cost.toString();

		companyValue = obj.companyId;		

		return showDialog(
			context : context,
			barrierDismissible : false,
			builder : (c){
				return FutureBuilder(
					future : getCompanyData(),
					builder : (c,s){
						if(s.data == null){
							return Center(child : CircularProgressIndicator());
						}
						else{
							return StatefulBuilder(
								builder : (c,st){
									return Dialog(
										shape : RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
										child : Container(
											width : 250.0,
											constraints : BoxConstraints(
												maxHeight : 350.0,
											),
											child : Stack(
												children : <Widget>[
													ListView(
													padding : const EdgeInsets.all(16.0),
														children : <Widget>[
															Center(
											          			child : Text('Update Product',textScaleFactor : 2.0,
											          				style : TextStyle(
											          					color : Theme.of(context).primaryColor,
											          				),
											          			),
											          		),
											          		Form(
											          			key : _formKey,
											          			autovalidate : autoValidate,
											          			child : Column(
											          				children : <Widget>[
											          					DropdownButtonHideUnderline(
											          						child : DropdownButtonFormField<int>(
											          							validator : (v) => v == null ? 'Please select company' : null,
											          							isDense : true,
																				decoration : InputDecoration(
																					labelText : 'Company',
																					hintText : 'Select Company',
																				),
																				autovalidate : autoValidate,
																				items : companyMenuItems,
																				onChanged : (v){
																					st((){
																						companyValue = v;
																					});
																					
																				},
																				value : companyValue == -1 ? null : companyValue,
											          						),
											          					),
											          					TextFormField(
												                  			controller : productName,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Product Name',
												                  				labelText : 'Product Name',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter Product Name.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : productDescription,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Product Description',
												                  				labelText : 'Product Description',
												                  			),
												                  			validator  : (v)=> v.isEmpty ? 'Enter Product Description.' : null,
												                  		),
												                  		TextFormField(
												                  			controller : monthlyBilling,
												                  			decoration : InputDecoration(
												                  				hintText : 'Enter Monthly Billing',
												                  				labelText : 'Monthly Billing',
												                  			),
												                  			validator : (v){
																			try{
																				double a= double.parse(v.toString());
																				return null;
																			}
																			catch(e){
																				return 'Please enter numeric value';
																			}
																			},	
												                  			//validator  : (v)=> v.isEmpty ? 'Enter Monthly Billing.' : null,
												                  		),
												                  		SizedBox(height : 20.0),
												                  		InkWell(
												                  			onTap : (){
												                  				
												                  				if(_formKey.currentState.validate()){
												                  					updateData(obj.id,context);
												                  					Navigator.of(c).pop();
												                  				}
												                  				else{
												                  					st((){
												                  						autoValidate = true;
												                  					});
												                  				}
												                  			},
												                  			child : Container(
												                  				height : 50.0,
												                  				width : 175.0,
												                  				decoration : BoxDecoration(
												                  					borderRadius : BorderRadius.all(Radius.circular(5.0)),
												                  					color : Theme.of(context).accentColor,
												                  				),
												                  				alignment : Alignment.center,
												                  				child : Text('Update',textScaleFactor : 1.5,
												                  					style : TextStyle(
												                  						color : Colors.white,
												                  					),
												                  				),
												                  			),
												                  		),
											          				]
											          			),
											          		),
														]
													),
													Positioned(
											        	right : -5.0,
											        	top : -5.0,
											        	child : IconButton(
											        		icon : Icon(Icons.clear),
											        		onPressed : (){
											        			Navigator.of(c).pop();
											        				companyValue = -1;
											        				autoValidate= false;
											        		}
											        	),
											        ),
												]
											),
										),
									);
								}
							);
						}
					}
				);
			}
		);
	}

  void _bottomSheet(context,obj){

	    showModalBottomSheet(
	    	context : context,
	    	shape : RoundedRectangleBorder(
	    		borderRadius : BorderRadius.only(topLeft : Radius.circular(16.0),topRight : Radius.circular(16.0)),
	    	),
	    	builder : (c){
	    		return Padding(
	    			padding : const EdgeInsets.all(16.0),
	    			child : SingleChildScrollView(
	    				child : Column(
	    					children : <Widget>[	
	    						Center(child : Text('Product Details',textScaleFactor : 2.0,style : TextStyle(
								color : Theme.of(context).primaryColor,
								fontWeight : FontWeight.bold))),
								SizedBox(height : 10.0),
								ListTile(
									title: Text("Product name : "+obj.productName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Product description : "+obj.productDescription),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Company name: "+obj.companyName),
									onTap: () => {},          
								),
								ListTile(
									title: Text("Cost : ${obj.cost.toString()} Rs."),
									onTap: () => {},          
								),
								Divider(color : Theme.of(context).accentColor,),
					            ListTile(
					              title : Text('Other Details.',textScaleFactor : 1.5,style : TextStyle(
					                color : Theme.of(context).primaryColor,
					                fontWeight : FontWeight.w600)),
					            ),
								ListTile(
									title: new Text("Created On : "+obj.createdOn),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("Last edit on : "+obj.lastEditOn),
									onTap: () => {},          
								),
								ListTile(
									title: new Text("isActive : "+obj.isActive.toString()),
									onTap: () => {},          
								),
								SizedBox(height : 10.0),
	    					]
	    				),
	    			),
	    		);
	    	}
	    );
	}

  @override
   ThemeData appBarTheme(BuildContext context) => Theme.of(context);
  

  List<Widget> buildActions(BuildContext context)
  {
    return [
    IconButton(icon : Icon(Icons.clear),onPressed:(){
      query="";
      })
    ];
  }

  Widget buildLeading(BuildContext context)
  {
    return IconButton(
      icon : AnimatedIcon(
          icon : AnimatedIcons.menu_arrow,
          progress : transitionAnimation,
        ),
      onPressed : (){
        close(context,null);
      }
      );
  }

  Widget buildResults(BuildContext context)
  {
    return Center(
      child : Container(
        height : 100.0,
        width : 100.0,
        child : Card(
          color : Colors.red,
          child : Center(
            child : Text(query),
          ),
        )
      ),
    );
  }

  deleteProduct(id,context) async{
    // setState((){
    //   isLoading = true;
    // });
    var response1 = await ApiCall.deleteRecord(Uri.GET_PRODUCT + "/$id");
    close(context,'delete');
    // setState((){
    //   isLoading = false;
    //   getNewData = true;
    // });
  }

  

  Widget buildSuggestions(BuildContext context)
  { 
    final List<ProductClass> suggestionList = query.isEmpty?products:products.where((p)=>p.productName.startsWith(query)||
      p.productDescription.startsWith(query)||p.companyName.startsWith(query)||p.cost.toString().startsWith(query)
      ).toList();
    return ListView.builder(
      itemCount : suggestionList.length,
      itemBuilder : (context,index){
        return Column(
      children: [
        Card(
            elevation: 7,
            child: ListTile(
                dense: false,
                isThreeLine: true,
                title : Consumer<ThemeNotifier>(
                  builder : (context,data,child){
                    return RichText(
                      text : TextSpan(
                        text : suggestionList[index].productName.substring(0,query.length>=suggestionList[index].productName.length ? suggestionList[index].productName.length : query.length ),
                          style : TextStyle(
                          color : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight : FontWeight.bold,
                        ), 
                          
                        
                        children : [
                          TextSpan(
                            text : suggestionList[index].productName.substring(query.length),
                            style : TextStyle(color : suggestionList[index].productName.startsWith(query) 
                              ? data.getTheme().brightness == Brightness.dark ? Colors.grey[600] : Colors.grey 
                              : data.getTheme().brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ],
                      )
                    );
                  }
                ),
                subtitle: Text(suggestionList[index].cost.toString()+"\n"+suggestionList[index].companyName),
                trailing: Row(
                  mainAxisSize : MainAxisSize.min,
                  children : [
                    IconButton(
                      icon : Icon(Icons.info_outline),
                      iconSize : 30.0,
                      onPressed : (){
                        _bottomSheet(context,suggestionList[index]);
                      }
                      ),
                    IconButton(
                    icon: Icon(Icons.delete),
                    iconSize: 30.0,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext c) {
                            return AlertDialog(
                              title: Text("Sure?",
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  )),
                              content: Text("Are you sure want to delete?"),
                              actions: <Widget>[
                                FlatButton(
                                  color : Theme.of(context).primaryColor,
                                  child: Text("No",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      )),
                                  onPressed: () {
                                    Navigator.of(c).pop();
                                  },
                                ),
                                FlatButton(
                                  child: Text("Yes",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      )),
                                  onPressed: () {
                                    Navigator.of(c)
                                        .pop();
                                    deleteProduct(suggestionList[index].id,context);
                                    
                                  },
                                ),
                                
                              ],
                            );
                          });
                    }),

                    ],
                  ),
                onTap: () {
                  updateProduct(suggestionList[index],context);
                  
                })),
        Divider(),
      ],
    );
      }
    );
  }
}

