import 'package:deliverymanagementsystem/pages/MyOrders.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  Country _selected;
  bool _obscureText = true;

  String _password;

  void validate()
  {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      Navigator.push(
          context,
          PageTransition(
              curve: Curves.bounceOut,
              type: PageTransitionType.rotate,
              alignment: Alignment.topCenter,
              child: MyOrders()));

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
  TextEditingController password = new TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 45,
          onPressed: (){
            setState(() {
              validate();

            });
          },
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Text("Register",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            ),),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.close,color: Theme.of(context).primaryColor),
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
                Text("Join the revolution",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Name is required' : null,
                        decoration: InputDecoration(
                          hintText: "First Name",
                          labelText: "First Name",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            //    color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextFormField(
                        validator: (val) => val.isEmpty ? 'Name is required' : null,
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          labelText: "Last Name",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            //    color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Email is required' : null,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Your Email",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                  //    color: Theme.of(context).primaryColor,
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
                    labelText:  "Choose a password",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                //      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
            Text("Country of residence",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),),
                SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
              ),
              child: CountryPicker(
                dense: false,
                showDialingCode: false,
                showName: true,
                onChanged: (Country country) {
                  setState(() {
                    _selected = country;
                  });
                },
                selectedCountry: _selected,
                nameTextStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(20),
                  child: RichText(
                    text: TextSpan(
                        text: 'By signing up you agree to our ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(text: 'Terms of Use',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              },
                          ),
                          TextSpan(text: ' and ',
                            style: TextStyle(
                                color: Colors.black, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              },
                          ),
                          TextSpan(text: 'privacy policy',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              },
                          ),

                        ]
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
