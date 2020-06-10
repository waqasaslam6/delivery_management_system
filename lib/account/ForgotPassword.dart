import 'package:deliverymanagementsystem/account/Register.dart';
import 'package:deliverymanagementsystem/pages/MyOrders.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

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
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor),
        onPressed: ()=>Navigator.pop(context),),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Forgot Password",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(height: 10,),
                Text("Enter the email address you signed up with"),
                SizedBox(height: 10,),
                Text("We will send you an email that will let you choose another password"),
                SizedBox(height: 20,),
                TextFormField(
                  controller: email,
                  validator: (val) => val.isEmpty ? 'Email is required' : null,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                  //    color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                              SizedBox(height: 30,),
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
                  child: Text("Reset Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),),
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
