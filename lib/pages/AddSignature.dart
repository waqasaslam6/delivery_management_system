import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';


HandSignatureControl control = new HandSignatureControl(
  threshold: 5.0,
  smoothRatio: 0.65,
  velocityRange: 2.0,
);

ValueNotifier<String> svg = ValueNotifier<String>(null);

ValueNotifier<ByteData> rawImage = ValueNotifier<ByteData>(null);
class AddSignature extends StatefulWidget {
  @override
  _AddSignatureState createState() => _AddSignatureState();
}

class _AddSignatureState extends State<AddSignature> {

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
        title: Text("Add Signature",
          style: TextStyle(
            color: Colors.black,
          ),),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints.expand(),
                        color: Colors.white,
                        child: HandSignaturePainterView(
                          control: control,
                          width: 5,
                          type: SignatureDrawType.shape,
                        ),
                      ),
                      CustomPaint(
                        painter: DebugSignaturePainterCP(
                          control: control,
                          cp: false,
                          cpStart: false,
                          cpEnd: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            TextFormField(
              decoration: InputDecoration(
                hintText: "Who signed for the delivery?"
              ),
            ),
            SizedBox(height: 50,),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    child: OutlineButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {control.clear();},
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          //   fontSize: 20.0,
                          //   fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 40,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        svg.value = control.toSvg(
                          color: Colors.blueGrey,
                          size: 2.0,
                          maxSize: 15.0,
                          type: SignatureDrawType.arc,
                        );
                        rawImage.value = await control.toImage(
                          color: Colors.blueAccent,
                        );
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.w600,
                          // fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

Widget _buildImageView() => Container(
  width: 192.0,
  height: 96.0,
  decoration: BoxDecoration(
    border: Border.all(),
    color: Colors.white30,
  ),
  child: ValueListenableBuilder<ByteData>(
    valueListenable: rawImage,
    builder: (context, data, child) {
      if (data == null) {
        return Container(
          color: Colors.red,
          child: Center(
            child: Text('not signed yet (png)'),
          ),
        );
      } else {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.memory(data.buffer.asUint8List()),
        );
      }
    },
  ),
);

Widget _buildSvgView() => Container(
  width: 192.0,
  height: 96.0,
  decoration: BoxDecoration(
    border: Border.all(),
    color: Colors.white30,
  ),
  child: ValueListenableBuilder<String>(
    valueListenable: svg,
    builder: (context, data, child) {
      return HandSignatureView.svg(
        data: data,
        padding: EdgeInsets.all(8.0),
        placeholder: Container(
          color: Colors.red,
          child: Center(
            child: Text('not signed yet (svg)'),
          ),
        ),
      );
    },
  ),
);
