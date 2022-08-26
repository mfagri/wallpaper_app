// import 'dart:html';
import 'dart:io' as Io;
import 'dart:async';
import 'dart:io';
import 'package:app1/affich.dart';
import 'package:app1/data.dart';
import 'package:app1/home.dart';
import 'package:app1/main.dart';
import 'package:app1/splash.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:floor/floor.dart';
import 'package:image/image.dart' as IM;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// void _addtofa2(String St) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setString('all', St);
//   s = prefs.getString('all');
// }
List fav = [];

class Faviru extends StatefulWidget {
  const Faviru({Key? key}) : super(key: key);

  @override
  _FaviruState createState() => _FaviruState();
}

class _FaviruState extends State<Faviru> {
  @override
  Widget build(BuildContext context) {
    loadBuyedItems();
    int j = 0;
    var size = MediaQuery.of(context).size;
    setState(() {
    if (s != null) fav = s.split(",");
      
    });
    // print(fav);
    // print("s");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        title: Text(
          "Favorites",
          style: TextStyle(color: dark2),
        ),
        centerTitle: true,
      ),
      backgroundColor: dark,
      body: (s == '')
          ? Container(
              child: Center(
                child: Text(
                  'No Favorites',
                  style: TextStyle(color: dark2),
                ),
              ),
            )
          : masonryLayout(context),
    );
  }
}

class Favor extends StatefulWidget {
  const Favor({Key? key}) : super(key: key);

  @override
  State<Favor> createState() => _FavorState();
}

// var replace;

class _FavorState extends State<Favor> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  Widget build(BuildContext context) {
    setState() {

    loadBuyedItems();
    }
    int j = 0;
    if (s != null) fav = s.split(",");
    var size = MediaQuery.of(context).size;
    print(fav);
    print("s");
    if (s != null) {
      return Container(
        child: masonryLayout(context),
      );
    }
    if (s == null) print('lol');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: dark,
          title: Text(
            "Favorites",
            style: TextStyle(color: dark2),
          ),
          centerTitle: true,
        ),
        backgroundColor: dark,
        body: Container(
          child: Center(
              child: Text(
            'No Favorites',
            style: TextStyle(color: dark2),
          )),
        ));
  }
}

Widget masonryLayout(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 5, right: 5),
    color: dark,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Expanded(
      child: MasonryGridView.builder(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: fav.length - 1,
        itemBuilder: (context, index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                child: Stack(
                  children: [
                    Positioned(
                      child: cards(),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: CachedNetworkImage(
                    imageUrl: fav[index],
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                )
                              ]),
                        ],
                      ),
                    ),
                  ],
                  ///////////////////////////one tap
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhotoA(
                              url: fav[index],
                            )),
                  );
                },
                ////////////////////////////////
              ));
        },
      ),
    ),
  );
}

class cards extends StatelessWidget {
  const cards({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var x = getRandom();
    return AspectRatio(
      aspectRatio: 1 / x,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.deepPurple.shade200),
      ),
    );
  }
}
