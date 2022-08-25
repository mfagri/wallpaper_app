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

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _Splash createState() => _Splash();
}

void loadBuyedItems() async {
  final prefs = await SharedPreferences.getInstance();
  s = prefs.getString('all');
  //Favorit[i].image = prefs.getString(random1[i])!;
}

// void LoadData() async {
//   int o = 0, n = 0, a = 0, sp = 0;
//   final prefs = await SharedPreferences.getInstance();
//   s = prefs.getString('all');
//   for (int i = 0; i < Categorydata.length; i++) {
//     if (Categorydata[i].name == "One piece") Categorydata[i].Onepiece = true;
//     if (Categorydata[i].name == "Attack") Categorydata[i].Attack = true;
//     if (Categorydata[i].name == "Naruto") Categorydata[i].Attack = true;
//     if (Categorydata[i].name == "Spy x family") Categorydata[i].Attack = true;
//   }
//   for (int l = 0; l < Categorydata.length; l++) {
//     if (Categorydata[l].Naruto == true) {
//       Categorydata[l].url == naruto[n];
//       n++;
//       print("$n");
//     }
//     if (Categorydata[l].Onepiece == true) {
//       Categorydata[l].url == onepiece[o];
//       o++;
//     }
//   }
//   for (int k = 0; k < Categorydata.length; k++) {
//     print(Categorydata[k].url);
//   }
//}

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
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome',
                style: TextStyle(
                  color: Colors.black,
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
                  color: Colors.deepPurple,
                ),
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
