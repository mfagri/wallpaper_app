// import 'dart:html';
import 'dart:io' as Io;
import 'dart:async';
import 'dart:io';
import 'package:app1/affich.dart';
import 'package:app1/data.dart';
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


class Faviru extends StatefulWidget {
  const Faviru({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FaviruState createState() => _FaviruState();
}

class _FaviruState extends State<Faviru> {
  @override
  Widget build(BuildContext context) {
    loadBuyedItems();
    setState(() {
    if (s != null) fav = s.split(",");  
    }
    );
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
      body: (s == '' || s == null)
          // ignore: avoid_unnecessary_containers
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

Widget masonryLayout(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 5, right: 5),
    color: dark,
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Expanded(
      child: MasonryGridView.builder(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: fav.length - 1,
        itemBuilder: (context, index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                child: Stack(
                  children: [
                    const Positioned(
                      child: cards(),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: CachedNetworkImage(
                    imageUrl: fav[index],
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20,
                                )
                              ]),
                        ],
                      ),
                    ),
                  ],
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
              ));
        },
      ),
    ),
  );
}

// ignore: camel_case_types
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
