import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            accountName: Text("Waqas Aslam",
                style: TextStyle(
                  color: Colors.black,
                )),
            accountEmail: Text("smslegends@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                )),
            currentAccountPicture: Image.network("https://cdn5.vectorstock.com/i/1000x1000/53/24/profile-icon-male-emotion-avatar-man-cartoon-vector-15175324.jpg"),
          ),
          ListTile(
            leading: Icon(Icons.settings_applications),
            title: Text("Manage Orders"),
            onTap: ()
            {
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: ()
            {
                Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Image.asset("assets/icons/ic_logout.png",scale: 2.5,),
            title: Text("Logout"),
            onTap: ()
            {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
