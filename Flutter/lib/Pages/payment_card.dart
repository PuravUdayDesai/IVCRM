import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import '../Utils/profile_tile.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../Models/Company/owner_model.dart';
import '../Api_Services/ApiCall.dart';
import '../Api_Services/Uri.dart';
class CreditCardPage extends StatefulWidget{
  _CreditCardPageState createState ()=> _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage>{

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];
  TextEditingController ownerName;
  TextEditingController contactNumber;
  TextEditingController email;
  TextEditingController username;
  TextEditingController password;
  bool autoValidate = false;
  bool isLoading = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

   Widget floatingBar(context) => Ink(
        decoration: ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(colors: kitGradients)),
        child: FloatingActionButton.extended(
          onPressed: () {
            //addCountry(context);
            int cnl = cardNumber.length;
            int ed = expiryDate.length;
            int cvv = cvvCode.length;
            if(cnl == 19 && ed == 5 && cvv == 3 && cardHolderName.length != 0){
              addOwner();
            }
            else {
              return showDialog(
                context : context,
                child : AlertDialog(
                  title : Text('Er...',style : TextStyle(color : Colors.red)),
                  content : Text('Please provide all details..'),
                  actions : [
                    FlatButton(
                      child : Text('OK',style : TextStyle(color : Theme.of(context).primaryColor)),
                      onPressed : (){
                        Navigator.of(context).pop();
                      }
                    ),
                  ],
                ),
              );
            }
            },
          backgroundColor: Colors.transparent,
          icon: Icon(
            FontAwesomeIcons.amazonPay,
            color: Colors.white,
          ),
          label: Text(
            "Continue",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

   createRecord(data) async{
    var res = await ApiCall.createRecord(Uri.GET_OWNER,data,authorization : false);
  }


  addData() async
  {
    FocusScope.of(context).unfocus();
    setState((){
      isLoading = true;
    });
    String createdOn = DateTime.now().toString();
    OwnerClass c1 = new OwnerClass.toPost(
      ownerName.text,
      contactNumber.text,
      email.text,
      username.text,
      password.text,
      createdOn
      );
    //print("Object created !!");
    print(c1.toMap());
    var c2 = await createRecord(c1.toMap());
    setState((){
      isLoading = false;
    });
    Navigator.pop(context,true);
  }

   addOwner(){

    ownerName = TextEditingController();
    contactNumber  = TextEditingController();
    email = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();

    return showDialog(
      context : context,
      barrierDismissible : false,
      builder : (c){
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
                                      child : Text('Add new Owner',textScaleFactor : 2.0,
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
                                          TextFormField(
                                                controller : ownerName,
                                                decoration : InputDecoration(
                                                  hintText : 'Enter Owner Name',
                                                  labelText : 'Owner Name',
                                                ),
                                                validator  : (v)=> v.isEmpty ? 'Please Enter Owner Name.' : null,
                                              ),
                                              TextFormField(
                                                controller : contactNumber,
                                                decoration : InputDecoration(
                                                  hintText : 'Enter Contact Number',
                                                  labelText : 'Contact Number',
                                                ),
                                                validator  : (v)=> v.isEmpty ? 'Please Enter Contact Number.' : null,
                                              ),
                                              TextFormField(
                                                controller : email,
                                                decoration : InputDecoration(
                                                  hintText : 'Enter Email ID',
                                                  labelText : 'Email ID',
                                                ),
                                                validator  : (v)=> v.isEmpty ? 'Please Enter Email ID.' : null,
                                              ),
                                              TextFormField(
                                                controller : username,
                                                decoration : InputDecoration(
                                                  hintText : 'Enter Username',
                                                  labelText : 'Username',
                                                ),
                                                validator  : (v)=> v.isEmpty ? 'Please Enter Username.' : null,
                                              ),
                                              TextFormField(
                                                controller : password,
                                                decoration : InputDecoration(
                                                  hintText : 'Enter Password',
                                                  labelText : 'Password',
                                                ),
                                                validator  : (v)=> v.isEmpty ? 'Please Enter Password.' : null,
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
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : Text('Card Payment'),
      ),
      body : IgnorePointer(
        ignoring : isLoading,
        child : Stack(
          children : <Widget>[ 
            ListView(
              children : <Widget>[
                CreditCardWidget(

                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  cardBgColor : Theme.of(context).accentColor,
                ),
                CreditCardForm(
                  onCreditCardModelChange: onCreditCardModelChange,
                ),

              ]
            ),
            isLoading ? Center(child : CircularProgressIndicator()) : Container(),
          ]
        ),
      ),
      floatingActionButton: floatingBar(context),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );  
  }
  
}