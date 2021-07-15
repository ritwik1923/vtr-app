import 'package:flutter/material.dart';
import 'package:vtr/screen/listGoods.dart';
import 'package:vtr/screen/test.dart';
import 'dart:math' as math;

import '../constrant.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('VTR'),
        // ),
        body: HomeScreen()
        // ListView(children: [
        //   Center(
        //     child: FlatButton(
        //       child: Image.asset("images/men.jpg"),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => ImageShopingListWidget()),
        //         );
        //       },
        //     ),
        //   ),
        //   Center(
        //     child: FlatButton(
        //       child: Image.asset("images/female.jpg"),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => ImageShopingListWidget()),
        //         );
        //       },
        //     ),
        //   ),
        //   Center(
        //     child: FlatButton(
        //       child: Image.asset("images/men.jpg"),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        // builder: (context) => ImageShopingListWidget()),
        //         );
        //       },
        //     ),
        //   ),
        //   Center(
        //     child: FlatButton(
        //       child: Image.asset("images/female.jpg"),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //               builder: (context) => ImageShopingListWidget()),
        //         );
        //       },
        //     ),
        //   ),
        // ]),

        );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  double hh = 10;

  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
    @required this.appbar,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  final Widget appbar;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var currheight = MediaQuery.of(context).size.height;
    print("currheight: $shrinkOffset");
    if (shrinkOffset >= 50 && shrinkOffset <= maxHeight) {
      return appbar;
      // SliverAppBar(
      //   // pinned: true,
      //   floating: false,
      //   backgroundColor: Colors.blue[600],
      //   actions: [
      //     Icon(Icons.menu),
      //   ],
      //   // expandedHeight: 200,
      //   // bottom: PreferredSize(
      //   //   preferredSize: Size.fromHeight(0),
      //   //   child: Container(
      //   //       color: Colors.blue[600], child: Center(child: headerText)),
      //   // )
      // );
    } else {
      var child2 = child;
      return Column(
        children: [
          appbar,
          // new SizedBox.expand(
          //   child:
          // )
          Expanded(child: child),
        ],
      );
    }
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class HomeScreen extends StatelessWidget {
  // var random = new Random();

  SliverPersistentHeader makeHeader(Widget headerText, Widget appbar) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 80.0,
        maxHeight: 250.0,
        appbar: appbar,
        child: Container(
            color: Colors.blue[600], child: Center(child: headerText)),
      ),
    );
  }

  SliverAppBar makeHeader1(Widget headerText) {
    return SliverAppBar(
        // pinned: true,
        floating: false,
        backgroundColor: Colors.blue[600],
        actions: [
          Icon(Icons.menu),
        ],
        expandedHeight: 200,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
              color: Colors.blue[600], child: Center(child: headerText)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    double graphHeight = size * 0.21;

    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            // Hero(tag: "Todotag", child: makeHeader('Todo')),
            //  TODO: add hero animation
            // makeHeader('Todo'),
            makeHeader(
                Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'NEW \nARRIVALS',
                                style: kTodoStyle,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                '2000+ New items',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: size * 0.25 * 0.25 * 0.25,
                      // ),
                      Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Shop now ->',
                                style: kSubTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppBar(
                  titleSpacing: 10,
                  backgroundColor: Colors.blue[600],
                  leading: Icon(Icons.menu),
                  title: Text('HOME'),
                  actions: [
                    // https://stackoverflow.com/questions/61108513/how-can-i-make-bell-notification-icon-animated-in-flutter
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.alarm)),

                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.shopping_bag)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.more_vert_outlined)),
                  ],
                )),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Stack(children: [
                    Container(
                      height: 100,
                      child: Column(
                        children: [
                          Expanded(
                            // flex: 4,
                            child: Container(
                              // height: size * 0.3,
                              // color: Color(0xFFFFA012),
                              color: Colors.blue[600],
                            ),
                          ),
                          Expanded(
                            // flex: 6,
                            child: Container(
                                // height: size * 0.6,
                                // color: Color(0xFF141438),
                                ),
                          ),
                        ],
                      ),
                      // color: Colors.pink,
                    ),
                    Center(
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RowMenu(
                              txt: 'MEN',
                              image: "images/men.jpg",
                            ),
                            RowMenu(
                              txt: 'WOMEN',
                              image: "images/female.jpg",
                            ),
                            RowMenu(
                              txt: 'KIDS',
                              image: "images/kids.jpg",
                            ),
                            RowMenu(
                              txt: 'OFFERS',
                              image: "images/offer.jpg",
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),

                  Container(
                    color: Colors.white,
                    height: size / 5,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      "images/discount.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),

                  // SizedBox(
                  //   height: size * 2.5,
                  // ),
                ],
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  // color: Colors.red,
                  height: 150.0,
                  child: Column(
                    children: [
                      Container(
                        height: 145.0,
                        child: Image.asset(
                          "images/discount.jpg",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'levis\'s',
                                style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              // mainAxisAlignment: MainAxisAlignment.b,
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '₹2000',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      // color: Colors.white70,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '₹3000',
                                    style: TextStyle(
                                      textBaseline: TextBaseline.ideographic,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '(30% off)',
                                    style: TextStyle(
                                      textBaseline: TextBaseline.ideographic,
                                      fontSize: 12,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                MenuWindow(
                  price: 1000,
                  discount: 32,
                  brand: "levi's",
                ),
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.orange, height: 150.0),
                Container(color: Colors.yellow, height: 150.0),
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuWindow extends StatelessWidget {
  final price;
  final discount;
  final brand;
  // final image;
  const MenuWindow({this.price, this.brand, this.discount});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ImageShopingListWidget()),
          );
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
          // color: Colors.red,
          height: 150.0,
          child: Column(
            children: [
              Container(
                height: 145.0,
                child: Image.asset(
                  "images/discount.jpg",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        brand,
                        // 'levis\'s',
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      // mainAxisAlignment: MainAxisAlignment.b,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '₹$price',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // color: Colors.white70,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '₹${price * (100 + discount) / 100}',
                            style: TextStyle(
                              textBaseline: TextBaseline.ideographic,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            '($discount% off)',
                            style: TextStyle(
                              textBaseline: TextBaseline.ideographic,
                              fontSize: 12,
                              // fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class RowMenu extends StatelessWidget {
  final image;
  final txt;

  const RowMenu({this.image, this.txt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          // backgroundColor: Colors.pink,
          // backgroundImage: image,
          child: ClipRRect(
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),

          radius: 30,
          // maxRadius: 40,
          // minRadius: 30,
        ),
        Text(txt),
      ],
    );
  }
}
