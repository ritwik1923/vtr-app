import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:vtr/networkHandler/NetworkHandler.dart';

class ImagePickerApp extends StatefulWidget {
  @override
  _ImagePickerAppState createState() => _ImagePickerAppState();
}

class Img {
  final v = _ImagePickerAppState();
  Uint8List pic;
  Img({this.pic});
  //  = v.imgString;
  // void getimage(Uint8List imgString) {
  //   pic = imgString;
  //   debugPrint("pic get: $pic");
  // }

  Uint8List sendimage() {
    debugPrint("pic send: ${v.imgString}");
    return v.imgString;
    // return "v.imgString";
  }
}

class _ImagePickerAppState extends State<ImagePickerApp> {
  NetworkHandler nh = NetworkHandler();
  Dio dio = new Dio();
  File record;
  // Uint8List _base64;
  String name = "VTR";
  Uint8List imgString;
  // Uint8List sendimage() {
  //   return imgString;
  // }

  @override
  void initState() {
    super.initState();
  }

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      record = image;
    }
    try {
      String filename = record.path.split('/').last;
      FormData formdata = new FormData.fromMap({
        "picture":
            await MultipartFile.fromFile(record.path, filename: filename),
      });

      final res2 = await nh.post("/users", formdata);
      String p = res2['path'];
      debugPrint("res-2   $p \n $imgString");

      final decodedBytes = base64Decode(res2['image']);

      setState(() {
        name = p;
        imgString = decodedBytes;
        // s.getimage(imgString);
      });
    } catch (e) {
      print(e);
    }
  }

  Future openGallery() async {
    final s = Img();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      record = image;
    }
    try {
      String filename = record.path.split('/').last;
      FormData formdata = new FormData.fromMap({
        "picture":
            await MultipartFile.fromFile(record.path, filename: filename),
      });

      final res2 = await nh.post("/users", formdata);
      String p = res2['path'];
      debugPrint("res-2   $p \n $imgString");

      final decodedBytes = base64Decode(res2['image']);

      setState(() {
        name = p;

        imgString = decodedBytes;
        // s.getimage(imgString);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () => _sendDataBack(context),
          ),
          title: Text(name),
          backgroundColor: Colors.black45,
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  color: Colors.black87,
                  height: 300.0,
                  width: 900.0,
                  child: imgString == null
                      ? Center(
                          child: Padding(
                              padding: new EdgeInsets.all(20.0),
                              child: Text(
                                "Are You Ready for Virtual Trailer Room??..",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 25.0),
                              )))
                      : Image.memory(imgString),
                ),
                FlatButton(
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    "Open Camera",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    openCamera();
                  },
                ),
                FlatButton(
                  color: Colors.limeAccent,
                  child: Text(
                    "Open Gallery",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    openGallery();
                  },
                )
              ],
            ),
          ),
        ));
  }

  void _sendDataBack(BuildContext context) {
    // String textToSendBack = textFieldController.text;
    Uint8List s = imgString;
    debugPrint("sending $s");
    Navigator.pop(context, s);
  }

//Backend Part where we store data to firebase

}
