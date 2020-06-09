import 'package:deliverymanagementsystem/Widgets/MyDrawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Container(
          width: MediaQuery.of(context).size.width*0.6,
          child: MyDrawer(),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Image.asset("assets/icons/ic_menu.png",scale: 2,),
            onPressed: ()
            {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          elevation: 0,
          title: Row(
            children: <Widget>[
              Text("My Orders",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),),
            ],
          ),
          backgroundColor: Theme.of(context).canvasColor,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Delivered",
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Processing",
                  style: TextStyle(
                    color: Colors.black,
                  ),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("Cancelled",
                  style: TextStyle(
                    color: Colors.black,
                  ),),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context,index)
                          {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[400],
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 10, //(x,y)
                                        )
                                      ],
                                      // border: Border.all(color: Colors.grey[100]),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Order No1947034",
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),),
                                            Text("05-12-2019",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          text: TextSpan(
                                              text: 'Name:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' John Doe',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          text: TextSpan(
                                              text: 'Delivery time:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' 10 June 3 Pm',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                              text: 'Pickup location:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' 781 Eastern Pkwy, Brooklyn, NY',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            MaterialButton(
                                              elevation: 0,
                                              onPressed: (){
                                                Navigator.pushNamed(context, '/details');
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1
                                                ),
                                              ),
                                              color: Colors.white,
                                              child: Text("Details",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16
                                                ),),
                                            ),
                                            Text("Delivered",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                              ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            );
                          }
                      )),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context,index)
                          {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[400],
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 10, //(x,y)
                                        )
                                      ],
                                      // border: Border.all(color: Colors.grey[100]),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Order No1947034",
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),),
                                            Text("05-12-2019",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          text: TextSpan(
                                              text: 'Name:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' John Doe',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          text: TextSpan(
                                              text: 'Delivery time:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' 10 June 3 Pm',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                              text: 'Pickup location:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' 781 Eastern Pkwy, Brooklyn, NY',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            MaterialButton(
                                              elevation: 0,
                                              onPressed: (){},
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1
                                                ),
                                              ),
                                              color: Colors.white,
                                              child: Text("Details",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16
                                                ),),
                                            ),
                                            Text("Processing",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                              ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            );
                          }
                      )),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context,index)
                          {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[400],
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 10, //(x,y)
                                        )
                                      ],
                                      // border: Border.all(color: Colors.grey[100]),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text("Order No1947034",
                                              style: TextStyle(
                                                  fontSize: 16
                                              ),),
                                            Text("05-12-2019",
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          text: TextSpan(
                                              text: 'Name:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' John Doe',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          text: TextSpan(
                                              text: 'Delivery time:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' 10 June 3 Pm',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                              text: 'Pickup location:',
                                              style: TextStyle(
                                                  color: Colors.grey[500], fontSize: 16),
                                              children: <TextSpan>[
                                                TextSpan(text: ' 781 Eastern Pkwy, Brooklyn, NY',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: 16),
                                                    recognizer: TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }
                                                )
                                              ]
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            MaterialButton(
                                              elevation: 0,
                                              onPressed: (){},
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 1
                                                ),
                                              ),
                                              color: Colors.white,
                                              child: Text("Details",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16
                                                ),),
                                            ),
                                            Text("Cancelled",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                              ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            );
                          }
                      )),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
