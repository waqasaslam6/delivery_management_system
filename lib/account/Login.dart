import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deliverymanagementsystem/account/ForgotPassword.dart';
import 'package:deliverymanagementsystem/account/Register.dart';
import 'package:deliverymanagementsystem/pages/MyOrders.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  ProgressDialog pr;
  bool _obscureText = true;
  String _password;
  final String url = "http://bringthings.com/parcel/api/login";
  var code;
  var first_name;
  var last_name;
  var email_address;

  var response;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<Map<String, dynamic>> doLogin(String email, String password) async {
    pr.show();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(email);
      print(password);
      Map data = {
          "email":email,
          "password":password,
          "device_token":"s",
          "role":"rider"
      };
      //encode Map to JSON
      var body = json.encode(data);
      response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: body
      );
      print("${response.body}");

      final Map<String, dynamic> authResponseData = json.decode(response.body);
      code= authResponseData["code"];
      try{
        if(code==200)
        {
          setValues();
          pr.hide();
          print("Login Success");
          Navigator.push(
              context,
              PageTransition(
                  curve: Curves.bounceOut,
                  type: PageTransitionType.leftToRight,
                  alignment: Alignment.topCenter,
                  child: MyOrders()));
        }
        else{
           pr.hide();
          print("Invalid Details");
          AwesomeDialog(
            isDense: true,
            context: context,
            dialogType: DialogType.NO_HEADER,
            animType: AnimType.SCALE,
            title: 'Login Failed',
            desc: 'Invalid Email / Password combination',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )..show();
        }
      }
      catch(e)
    {print("There is an error.");}
    }
  }
  void validate(email,password) {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
          doLogin(email, password);

    } else {
      print('Form is invalid');
    }
  }

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void setValues() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString("firstName", first_name);
    sharedPrefs.setString("lastName", last_name);
    sharedPrefs.setString("email", email_address);
    print("Values Set Done");
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: '  Please Wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 1.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w600)
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor,),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Log in",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 5,),
                TextFormField(
                  controller: email,
              validator: (val) => RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val) ? null : "Please input valid email",
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    //  color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: password,
                  obscureText: _obscureText,
                  validator: (val) => val.length < 6 ? 'Password too short.' : null,
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: (){
                        _toggle();
                      },
                      icon: Image.asset("assets/icons/ic_hide.png",
                        scale: 3,color: Theme.of(context).primaryColor,),
                    ),
                      hintText: "Password",
                    labelText:  "Password",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                  //    color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 45,
                  onPressed: (){
                    setState(() {
                      validate(email.text,password.text);
                    });
                  },
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Text("Log in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            PageTransition(
                              duration: Duration(milliseconds: 700),
                                curve: Curves.bounceOut,
                                type: PageTransitionType.upToDown,
                                alignment: Alignment.topCenter,
                                child: ForgotPassword()));
                      },
                      child: Text("Forgot password ?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            PageTransition(
                                curve: Curves.bounceOut,
                                duration: Duration(milliseconds: 700),
                                type: PageTransitionType.downToUp,
                                alignment: Alignment.topCenter,
                                child: Register()));
                      },
                      child: Text("Register ?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
