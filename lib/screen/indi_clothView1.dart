import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:vtr/networkHandler/NetworkHandler.dart';
import 'dart:convert';
import 'package:vtr/screen/vtr.dart';
import 'package:intl/intl.dart'; // currency converter

void print(Map<String, dynamic> items) => debugPrint('$items');

class Index_Cloth extends StatefulWidget {
  Map<String, dynamic> item;
  // In the constructor, require a Todo.
  Index_Cloth({Key key, @required this.item}) : super(key: key);
  @override
  _Index_ClothState createState() => _Index_ClothState(item);
}

class _Index_ClothState extends State<Index_Cloth> {
  NetworkHandler nh = NetworkHandler();
  // final v = Img();
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  Map<String, dynamic> items;
  _Index_ClothState(this.items);
  Uint8List img;
  Uint8List stock;
  List<String> images = [];
  int p = 0;
  @override
  void initState() {
    images.add("http://127.0.0.1:5000/getcloths?id=${items['_id']}");
    super.initState();
  }

  // List<Uint8List> images;
  Future vtr(BuildContext context, String clothid) async {
    final pic = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new ImagePickerApp(
                  clothid: clothid,
                )));
    setState(() {
      images.add(nh.get(pic));
      ++p;
      for (int i = 0; i < 2; i++) {
        debugPrint("$i: ${images[i]}");
      }
      //   // images[0] = img;
      //   // images[1] = pic;
      //   img = (pic);
      //   stock = pic;
      //   // ignore: await_only_futures
      //   debugPrint("stock $stock");
    });
  }

  // Uint8List imageAdd(Uint8List s) {
  //   images.add(s);
  //   debugPrint(" ${images[0]}");
  //   return s;
  // }

  // In the constructor, require a Todo.
  @override
  Widget build(BuildContext context) {
    // Uint8List img = base64Decode(items['image']);
    double uiHeight = MediaQuery.of(context).size.height;
    double uiWidth = MediaQuery.of(context).size.width;
    double cardHeight = 174;
    double cardWidth = uiWidth;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("${items["path"]}")),
        body: ListView(
          children: [
            Center(
              child: Container(
                margin: new EdgeInsets.fromLTRB(5, 5, 5, 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(3),
                  topRight: const Radius.circular(3),
                )),
                width: (209 / 226) *
                    uiWidth, //MediaQuery.of(context).size.width - 99,
                height: (240 / 425) * uiHeight,
                child: img != null
                    ? Image.memory(img)
                    :
                    // Text("No data")
                    Image.network(
                        images[p],
                        fit: BoxFit.fill,
                        height: 145,
                      ),
              ),
            ),
            SizedBox(
              height: 20,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Center(
              child: Container(
                margin: new EdgeInsets.fromLTRB(5, 5, 5, 5),
                width: (209 / 226) * uiWidth,
                height: (60 / 425) * uiHeight,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Colors.teal,
                            child: Center(
                                child: Text(
                              "Price: ${oCcy.format(items['price'])}",
                              style: TextStyle(
                                fontSize: 35,
                                // color: Colors.white,
                              ),
                            )),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            debugPrint("Intiating Virtual Trial Room");
                            VTR();
                          },
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                                child: Text(
                              "VTR",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: new EdgeInsets.fromLTRB(5, 5, 5, 5),

                width: (209 / 226) *
                    uiWidth, //MediaQuery.of(context).size.width - 99,
                height: (60 / 425) * uiHeight,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          color: Colors.redAccent,
                          child: Center(
                              child: Text(
                            "BUY NOW",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            color: Colors.amber,
                            child: Center(
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  void VTR() {
    setState(() {
      var res = vtr(context, items['_id']);
      debugPrint("res vtr: $res");

      // images.add(nh.get(res));
      // ++p;
      // for (int i = 0; i < 2; i++) {
      //   debugPrint("$i: ${images[i]}");
      // }
    });
  }
}
