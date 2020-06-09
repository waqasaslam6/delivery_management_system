import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.camera_alt,color: Colors.grey,),
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25.0),
                ),
               width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.insert_emoticon),
                        Icon(Icons.gif),
                      ],
                    ),
                    hintText: "write a message",
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              IconButton(
                icon: Icon(Icons.send,color: Colors.grey,),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: ()
          {
            Navigator.pushNamed(context, '/orders');
          },
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircularProfileAvatar(
              '',
              child: Image.network("https://www.imaginetricks.com/wp-content/uploads/2017/08/beautiful-girl-profile.jpg"),
              // borderColor: Colors.purpleAccent,
              borderWidth: 1,
              elevation: 5,
              radius: 25,
            ),
            SizedBox(width: 15,),
            Column(
              children: <Widget>[
                Text("Jack Dorsey",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),),
                Text("Lorem Ipsum dolor",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                _buildSender(context),
                _buildReceiver(context),
                _buildSender(context),
                _buildReceiver(context),
                _buildSender(context),
                _buildReceiver(context),
                _buildSender(context),
                _buildReceiver(context),
                _buildSender(context),
                _buildReceiver(context),
                _buildSender(context),
                _buildReceiver(context),
                _buildSender(context),
                _buildReceiver(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget _buildReceiver(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Row(
      children: <Widget>[
        CircularProfileAvatar(
          '',
          child: Image.network("https://www.imaginetricks.com/wp-content/uploads/2017/08/beautiful-girl-profile.jpg"),
          // borderColor: Colors.purpleAccent,
          borderWidth: 1,
          elevation: 0,
          radius: 25,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              child: Wrap(direction: Axis.horizontal, children: <Widget>[
                Text(
                  """Yes. Offer is currently available""",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
              ]),
            ),

          ],
        ),
      ],
    ),
  );
}

Widget _buildSender(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              height: 40,
              child: Text(
                "Yes. Offer is currently available, what do you want?",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),

          ],
        ),
      ],
    ),
  );
}
