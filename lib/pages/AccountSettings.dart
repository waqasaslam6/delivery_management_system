import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: ()
          {
            Navigator.pushNamed(context, '/orders');
          },

        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Text("Settings",
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(
           padding: const EdgeInsets.all(20),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               CircleAvatar(
                 radius: 35,
                 child: ClipOval(child: Image.network("https://cdn5.vectorstock.com/i/1000x1000/17/79/faces-avatar-in-circle-male-portrait-business-man-vector-12511779.jpg")),
               ),
               SizedBox(width: 20,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("Name",
                     style: TextStyle(
                         color: Colors.grey[500], fontSize: 16),
                   ),
                   SizedBox(height: 8,),
                   Text("Jack Dorsey",
                   style: TextStyle(
                       color: Colors.black, fontSize: 16),),
                 ],
               ),

             ],
           ),
         ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                ListTile(
                  title: Text("Phone Number",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: 18),),
                  subtitle:  Text("+1 321-412-0144",
                    style: TextStyle(
                        color: Colors.black, fontSize: 18),),
                ),
                ListTile(
                  title: Text("Email",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: 18),),
                  subtitle:  Text("jack@gmail.com",
                    style: TextStyle(
                        color: Colors.black, fontSize: 18),),
                ),

                ListTile(
                  title: Text("City",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: 18),),
                  subtitle:  Text("Brooklyn",
                    style: TextStyle(
                        color: Colors.black, fontSize: 18),),
                  trailing: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.edit),
                  ),
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }
}

