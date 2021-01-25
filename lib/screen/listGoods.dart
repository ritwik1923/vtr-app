import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vtr/networkHandler/NetworkHandler.dart';
import 'package:vtr/screen/indi_clothView1.dart';
import 'package:intl/intl.dart';

class ImageShopingListWidget extends StatefulWidget {
  @override
  @override
  _ImageShopingListWidgettState createState() =>
      _ImageShopingListWidgettState();
}

class _ImageShopingListWidgettState extends State<ImageShopingListWidget> {
  NetworkHandler nh = NetworkHandler();
  List items;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  _ImageShopingListWidgettState();

  @override
  void initState() {
    super.initState();
    this.getAlldata();
  }

  Future getAlldata() async {
    final res = await nh.allData("/allData");

    this.setState(() {
      items = res;
      debugPrint("responded  ${res.length}");
      // debugPrint("responded  $items");
    });
    // print(items[0].data);
  }

  @override
  Widget build(BuildContext context) {
    double uiHeight = MediaQuery.of(context).size.height;
    double uiWidth = MediaQuery.of(context).size.width;
    double cardHeight = 174;
    double cardWidth = uiWidth;
    String stock = "";
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: ListView.builder(
          itemCount: items == null ? 0 : items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                debugPrint("$index : ${items[index]["path"]} ");
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                            new Index_Cloth(item: items[index])));
              },
              child: Card(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: ((120 / 394) * uiWidth),
                          height: 134,
                          child:
                              Image.memory(base64Decode(items[index]['image'])),
                        ),
                        Container(
                          margin: new EdgeInsets.fromLTRB(5, 2, 0, 0),
                          color: (items[index]['status'] == 1
                              ? Colors.yellowAccent
                              : Color(0xFFBDBDBD)),
                          width: ((120 / 394) * uiWidth),
                          height: 18,
                          child: Center(
                              child: (items[index]['status'] == 1
                                  ? Text(
                                      "In Stock",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    )
                                  : Text(
                                      "Out Of Stock",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFF5252)),
                                    ))),
                        ),
                      ],
                    ),
                    Column(
                        // mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                width: (250 / 394) *
                                    cardWidth, //MediaQuery.of(context).size.width - 99,
                                height: cardHeight / 3,
                                color: (items[index]['status'] == 1
                                    ? Colors.amber
                                    : Color(0xFF666666)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Cotton T-Shirt",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              width: (250 / 394) *
                                  cardWidth, //MediaQuery.of(context).size.width - 99,
                              height: cardHeight / 3,
                              color: (items[index]['status'] == 1
                                  ? Colors.teal
                                  : Colors.grey),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "${items[index]["path"]}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            child: Container(
                                margin: EdgeInsets.only(left: 5, right: 5),
                                width: (250 / 394) *
                                    cardWidth, //MediaQuery.of(context).size.width - 99,
                                height: cardHeight / 3,
                                color: (items[index]['status'] == 1
                                    ? Colors.blueAccent
                                    : Color(0xFFaaaaaa)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "${oCcy.format(items[index]["price"])}",
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: (Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ])
                  ],
                ),
              ),
            );
          }),
    );
    // );
  }
}
