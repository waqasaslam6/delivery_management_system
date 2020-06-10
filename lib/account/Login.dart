import 'package:deliverymanagementsystem/account/ForgotPassword.dart';
import 'package:deliverymanagementsystem/account/Register.dart';
import 'package:deliverymanagementsystem/pages/MyOrders.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // Initially password is obscure

  bool _obscureText = true;

  String _password;

  void validate(email)
  {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      var emailid = email;
      bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(emailid);
      print (emailValid);
      print('Form is valid');
      if(emailValid)
        {
          Navigator.push(
              context,
              PageTransition(
                  curve: Curves.bounceOut,
                  type: PageTransitionType.rotate,
                  alignment: Alignment.topCenter,
                  child: MyOrders()));
        }


    } else {
      print('Form is invalid');
    }
  }
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  validator: (val) => val.isEmpty ? 'Email is required' : null,
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
                      validate(email.text);

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
