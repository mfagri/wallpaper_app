import 'dart:collection';
import 'dart:io' as Io;
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:app1/Favorit.dart';
import 'package:app1/data.dart';
import 'package:app1/affich.dart';
import 'package:app1/main.dart';
import 'package:app1/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:floor/floor.dart';
import 'package:image/image.dart' as IM;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

var n = Color.fromARGB(0, 58, 56, 56);

final List<Color> cl = [
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
];
double getRandom() {
  final double y = Random().nextInt(250) / 100;
  if (y < 1.2)
    return getRandom();
  else
    return y;
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

/////////////////////////////////////////

// ignore: non_constant_identifier_names
Color Isinlist(String find, List l, int ind) {
  int k;
  for (k = 0; k < l.length - 1; k++) {
    if (l[k] == find) {
      cl[ind] = Colors.red;
      return (cl[ind]);
    }

    // else
  }
  cl[ind] = Colors.transparent;
  return (cl[ind]);
}

class _HomeState extends State<Home> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    loadBuyedItems();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: masonryLayout(context),
    );
  }
}

Widget masonryLayout(BuildContext context) {
  return MasonryGridView.builder(
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: 1000,
    itemBuilder: (context, index) {
      // var o;
      // if (safe == false && s != null) {
      //   o = s.split(',');
      //   n= Isinlist(listitem[index], o, index);
      // }
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
                  // child: Image(
                  //   image: AssetImage(listitem[index]),
                  //   fit: BoxFit.fill,
                  // ),
                  child: CachedNetworkImage(
                    imageUrl: "https://source.unsplash.com/random?sig=$index",
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
                              color: n,
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
                           url: "https://source.unsplash.com/random?sig=$index",
                        )),
              );
            },
            ////////////////////////////////
          ));
    },
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
