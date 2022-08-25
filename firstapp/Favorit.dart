// import 'dart:html';
import 'dart:io' as Io;
import 'dart:async';
import 'dart:io';
import 'package:app1/affich.dart';
import 'package:app1/home.dart';
import 'package:app1/main.dart';
import 'package:app1/splash.dart';
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
    loadBuyedItems();
    int j = 0;
    fav = s != null ? s.split(",") : null;
    var size = MediaQuery.of(context).size;
    if (fav[0] == "null")
    {
      return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      title: Text("Favorites"),
      centerTitle: true,
    ),
    backgroundColor: Color.fromARGB(255, 2, 2, 2),
    body: Container(
      child: Center(child: Text('No Favorites',style: TextStyle(color: Colors.white),)),
    )
      );
    }
    return Container(
      child: masonryLayout(context),
    );
  }
}

Widget masonryLayout(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      title: Text("Favorites"),
      centerTitle: true,
    ),
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    body:  Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      color: Color.fromARGB(255, 0, 0, 0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:
          Expanded(
            child:MasonryGridView.builder(
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
                          child: Image(
                            image: AssetImage(fav[index]),
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
                                  index: index,
                                  items: fav,
                                )),
                      );
                    },
                    ////////////////////////////////
                  ));
            },
          ),
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
