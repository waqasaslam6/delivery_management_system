import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void _showModalSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            decoration: BoxDecoration(
              // color: Theme.of(context).primaryColor,
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "It will be added soon",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          // fontWeight: FontWeight.w600,
                          // fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            padding: EdgeInsets.all(0.0),
          );
        });
  }

  // Initially password is obscure

  bool _obscureText = true;

  String _password;

  void validate()
  {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      Navigator.pushNamed(context, '/orders');
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
                  validator: (val) => val.isEmpty ? 'Email is required' : null,
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                MaterialButton(
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
                    Text("Forgot password ?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                    ),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                         _showModalSheet(context);
                        });

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
