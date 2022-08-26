import 'dart:io' as Io;
import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:app1/Download.dart';
import 'package:app1/Favorit.dart';
import 'package:app1/data.dart';
import 'package:app1/home.dart';
import 'package:app1/splash.dart';
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
// import 'package:wallpaper_manager/wallpaper_manager.dart';

// import 'package:simple_permissions/simple_permissions.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:vertical_card_pager/vertical_card_pager.dart';

List<String> random1 = [
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/on.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/th.jpeg',
  'lib/imges/on.jpeg',
];

var c = Color.fromARGB(0, 215, 215, 216);

void _addtofa(String St) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('h', s + St);
}

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splash()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  final screens = [
    Home(),
    Naruto(),
    One_piece(),
    Attackontitan(),
    Spyxfamily(),
  ];
  late TabController mycontroller;
  @override
  void initState() {
    mycontroller = new TabController(length: screens.length, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: dark,
        appBar: AppBar(
          backgroundColor: dark,
          title: Text(
            'Wallpapers',
            style: TextStyle(
              color: dark2,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: dark2,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Faviru()));
              },
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: dark,
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dark2,
                  ),
                  child: Center(
                      child: Text(
                    "L O G O",
                    style: TextStyle(
                      color: dark,
                    ),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: dark2,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: dark2),
                  ),
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar()));
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: dark2,
                  ),
                  title: Text(
                    "My Favorite",
                    style: TextStyle(color: dark2),
                  ),
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Faviru()));
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.file_download_outlined,
                    color: dark2,
                  ),
                  title: Text(
                    "My Download",
                    style: TextStyle(color: dark2),
                  ),
                  onTap: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Download()));
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Icon(
                    Icons.dark_mode,
                    color: dark2,
                  ),
                  title: Text(
                    "Theme",
                    style: TextStyle(color: dark2),
                  ),
                  onTap: (() {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(title: Text('Switch to:\n'),
                            // content: Text("Your chois"),
                            actions: [
                              MaterialButton(
                                child: Text('Dark Mode'),
                                onPressed: () async {
                                  setState(() {
                                    dark = Color.fromARGB(255, 0, 0, 0);
                                    dark2 = Colors.white;
                                  });
                                  final aprefs =
                                      await SharedPreferences.getInstance();
                                  aprefs.setBool('dark', true);
                                  // dl = prefs.getBool('all');
                                  Navigator.pop(context);
                                },
                              ),
                              MaterialButton(
                                child: Text('Light Mode'),
                                onPressed: () async {
                                  setState(() {
                                    dark = Color.fromARGB(255, 177, 172, 172);
                                    dark2 = Colors.black;
                                  });
                                  final aprefs =
                                      await SharedPreferences.getInstance();
                                  aprefs.setBool('dark', false);
                                  // dl = prefs.getBool('all');
                                  Navigator.pop(context);
                                },
                              ),
                            ]);
                      },
                    );
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(4),
              height: 45,
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                controller: mycontroller,
                indicator: BoxDecoration(
                  color: dark2,
                  borderRadius: BorderRadius.circular(25),
                ),
                labelColor: dark,
                unselectedLabelColor: dark2,
                tabs: [
                  Expanded(
                    child: FittedBox(
                        child: Text(
                      "Home",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  Expanded(
                    child: FittedBox(
                        child: Text(
                      "Travel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  Expanded(
                    child: FittedBox(
                        child: Text(
                      "Nature",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  Expanded(
                    child: FittedBox(
                        child: Text(
                      "People",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  Expanded(
                    child: FittedBox(
                        child: Text(
                      "Animals",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: mycontroller,
                children: [
                  for (int i = 0; i < screens.length; i++) screens[i],
                ],
              ),
            ),
          ]),
        ));
  }
}
