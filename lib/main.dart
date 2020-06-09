import 'package:deliverymanagementsystem/account/ForgotPassword.dart';
import 'package:deliverymanagementsystem/account/Login.dart';
import 'package:deliverymanagementsystem/account/Register.dart';
import 'package:deliverymanagementsystem/pages/AccountSettings.dart';
import 'package:deliverymanagementsystem/pages/AddSignature.dart';
import 'package:deliverymanagementsystem/pages/Chat.dart';
import 'package:deliverymanagementsystem/pages/MyOrders.dart';
import 'package:deliverymanagementsystem/pages/OrderDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Delivery Management System",
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xfff54d6e),
      canvasColor: Color(0xfff9f9f9),
    ),
    routes: <String, WidgetBuilder>{
      '/orders':   (BuildContext context)=>MyOrders(),
      '/settings': (BuildContext context)=>AccountSettings(),
      '/details':  (BuildContext context)=>OrderDetails(),
      '/chat':     (BuildContext context)=>Chat(),
      '/signature':(BuildContext context)=>AddSignature(),
      '/login':    (BuildContext context)=>Login(),
      '/register': (BuildContext context)=>Register(),
      '/forgot':   (BuildContext context)=>ForgotPassword(),
    },

  ));
}




