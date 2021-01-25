import 'package:flutter/material.dart';
import 'package:vtr/screen/listGoods.dart';
import 'package:vtr/screen/test.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VTR'),
      ),
      body: ListView(children: [
        Center(
          child: FlatButton(
            child: Image.asset("images/men.jpg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageShopingListWidget()),
              );
            },
          ),
        ),
        Center(
          child: FlatButton(
            child: Image.asset("images/female.jpg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageShopingListWidget()),
              );
            },
          ),
        ),
        Center(
          child: FlatButton(
            child: Image.asset("images/men.jpg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageShopingListWidget()),
              );
            },
          ),
        ),
        Center(
          child: FlatButton(
            child: Image.asset("images/female.jpg"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageShopingListWidget()),
              );
            },
          ),
        ),
      ]),
    );
  }
}
