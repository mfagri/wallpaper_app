import 'dart:io';
import 'package:app1/Download.dart';
import 'package:app1/Favorit.dart';
import 'package:app1/data.dart';
import 'package:app1/home.dart';
import 'package:app1/main.dart';
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

var s;
var dl;
var safe = false;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _Splash createState() => _Splash();
}

void loadBuyedItems() async {
  final prefs = await SharedPreferences.getInstance();
  final aprefs = await SharedPreferences.getInstance();
  s = prefs.getString('alla');
  if (s == null)
    safe = true;
  else
    safe = false;
  dl = aprefs.getBool('dark');
  if (dl == true) {
    print('ddd');
    dark = Colors.black;
    dark2 = Colors.white;
  } else {
    print('lll');
    dark = Color.fromARGB(255, 177, 172, 172);
    dark2 = Color.fromARGB(255, 0, 0, 0);
  } //Favorit[i].image = prefs.getString(random1[i])!;
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    super.initState();
    loadBuyedItems();
    // LoadData();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
