import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  PickedFile _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController _controller;
  String _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _playVideo(PickedFile file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      if (kIsWeb) {
        _controller = VideoPlayerController.network(file.path);
      } else {
        _controller = VideoPlayerController.file(File(file.path));
      }
      await _controller.setVolume(1.0);
      await _controller.initialize();
      await _controller.setLooping(true);
      await _controller.play();
      setState(() {});
    }
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    if (_controller != null) {
      await _controller.setVolume(0.0);
    }
    if (isVideo) {
      final PickedFile file = await _picker.getVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);
    } else {
      await _displayPickImageDialog(context,
              (double maxWidth, double maxHeight, int quality) async {
            try {
              final pickedFile = await _picker.getImage(
                source: source,
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                imageQuality: quality,
              );
              setState(() {
                _imageFile = pickedFile;
              });
            } catch (e) {
              setState(() {
                _pickImageError = e;
              });
            }
          });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller.setVolume(0.0);
      _controller.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_controller != null) {
      await _controller.dispose();
      _controller = null;
    }
  }

  Widget _previewVideo() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'You have not yet picked a video',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (kIsWeb) {
        // Why network?
        // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
        return Image.network(_imageFile.path);
      } else {
        return Image.file(File(_imageFile.path));
      }
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception.code;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: ()=> Navigator.pushNamed(context, '/orders'),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,top: 2,right: 15),
        child: Column(
          children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                      child: Image.network("https://www.imaginetricks.com/wp-content/uploads/2017/08/beautiful-girl-profile.jpg")),
                ),
                SizedBox(width: 20,),
                Text("Sarah Joseph",
                style: TextStyle(
                    color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
            Row(
              children: <Widget>[
                Icon(Icons.phone),
                SizedBox(width: 5,),
                Text("+1 321-412-0144",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: 14),),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: <Widget>[
                Icon(Icons.email),
                SizedBox(width: 10,),
                Text("emma@gmail.com",
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: 14),),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               Container(
                 height: 40,
                 width: 40,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   shape: BoxShape.circle,
                     border: Border.all(color: Colors.grey[500]),
                 ),
                 child: IconButton(
                   icon: Icon(Icons.phone,color: Theme.of(context).primaryColor,),
                   onPressed: (){},
                 ),
               ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.message,color: Theme.of(context).primaryColor,),
                    onPressed: (){
                      Navigator.pushNamed(context, '/chat');
                    },
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.location_on,color: Theme.of(context).primaryColor,),
                    onPressed: (){},
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[500]),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt,color: Theme.of(context).primaryColor,),
                    onPressed: (){
                      setState(() {
         showDialog(
                        context: context,
                        builder: (context) {

                          return AlertDialog(
                            content: new SingleChildScrollView(
                              child: new ListBody(
                                children: <Widget>[
                                  GestureDetector(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.camera_alt),
                                          SizedBox(width: 10),
                                          Text('Take Picture'),
                                        ],
                                      ),
                                      onTap: () async {
                                        _onImageButtonPressed(ImageSource.camera, context: context);
                                        setState(() {
                                        });
                                      }),
                                  SizedBox(height: 10,),
                                  GestureDetector(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.attach_file),
                                          SizedBox(width: 10),
                                          Text('Upload Picture'),
                                        ],
                                      ),
                                      onTap: () async {
                                        _onImageButtonPressed(ImageSource.gallery, context: context);
                                        setState(() {
                                        });
                                      }),

                                ],
                              ),
                            ),
                          );

                        }        );
                      });

                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              minWidth: MediaQuery.of(context).size.width,
              onPressed: (){
                Navigator.pushNamed(context, '/signature');
              },
              color: Theme.of(context).primaryColor,
              child: Text("Collect Payment",
              style: TextStyle(
                color: Colors.white,
              ),),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    title: Text("Pickup information",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: 16),),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("John Doe",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),),
                          Text("+1 347-272-0544",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text("john@gmail.com",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text("50 Bayard St, New York NY 10013, United States",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.more_vert),
                    ),
                    isThreeLine: true,
                    dense: true,
                    contentPadding: EdgeInsets.all(5),
                  ),
                  ListTile(
                    title: Text("Delivery information",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: 16),),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("John Doe",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text("+1 347-272-0544",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text("john@gmail.com",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text("50 Bayard St, New York NY 10013, United States",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.more_vert),
                    ),
                    isThreeLine: true,
                    dense: true,
                    contentPadding: EdgeInsets.all(5),
                  ),
                  ListTile(
                    title: Text("Item Name",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: 16),),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("15 Inch Chicken Cheese Pizza",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),),
                    ),
                    dense: true,
                    contentPadding: EdgeInsets.all(5),
                  ),
                  ListTile(
                    title: Text("Item Details",
                      style: TextStyle(
                          color: Colors.grey[500], fontSize: 16),),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text("Lorem ipsum dolor sit omet, sdlfjsdl lsjfafaasld as,Lorem ipsum dolor sit omet, sdlfjsdl lsjfafaasld as",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),),
                    ),
                    dense: true,
                    contentPadding: EdgeInsets.all(5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return onPick(100,100,100);
  }

}
typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller.value.initialized) {
      initialized = controller.value.initialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller.value?.aspectRatio,
          child: VideoPlayer(controller),
        ),
      );
    } else {
      return Container();
    }
  }
}



