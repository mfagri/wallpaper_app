import 'dart:io' as Io;
import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:app1/Favorit.dart';
import 'package:app1/affich.dart';
import 'package:app1/data.dart';
import 'package:app1/splash.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:flutter/services.dart';

class Anypage extends StatelessWidget {
  final List list;
  const Anypage({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: MasonryGridView.builder(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: list.length,
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
                          imageUrl: list[index],
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoA(
                                url: list[index],
                      ),
                      ),
                    );
                  },
                ),);
          },
        ),
      ),
    );
  }
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
