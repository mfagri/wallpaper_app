
import 'package:app1/Favorit.dart';
import 'package:app1/data.dart';
import 'package:app1/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class ddarawer extends StatefulWidget {
  const ddarawer({Key? key}) : super(key: key);

  @override
  State<ddarawer> createState() => _ddarawerState();
}

// ignore: camel_case_types
class _ddarawerState extends State<ddarawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: dark,
      child: Container(
        padding: const EdgeInsets.all(10),
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
            const SizedBox(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()));
              }),
            ),
            const SizedBox(
              height: 10,
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
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Faviru()));
              }),
            ),
            const SizedBox(
              height: 10,
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
                    return CupertinoAlertDialog(title: const Text('Switch to:\n'),
                        actions: [
                          MaterialButton(
                            child: const Text('Dark Mode'),
                            onPressed: () async {
                              setState(() {
                                dark = const Color.fromARGB(255, 0, 0, 0);
                                dark2 = Colors.white;
                              });
                              final aprefs =
                                  await SharedPreferences.getInstance();
                              aprefs.setBool('dark', true);
                              // ignore: use_build_context_synchronously
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BottomNavBar()));
                            },
                          ),
                          MaterialButton(
                            child: const Text('Light Mode'),
                            onPressed: () async {
                              setState(() {
                                dark = const Color.fromARGB(255, 255, 255, 255);
                                dark2 = Colors.black;
                              });
                              final aprefs =
                                  await SharedPreferences.getInstance();
                              aprefs.setBool('dark', false);
                              // dl = prefs.getBool('all');
                              // ignore: use_build_context_synchronously
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BottomNavBar()));
                            },
                          ),
                        ]);
                  },
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: dark2,
              ),
              title: Text(
                "Share",
                style: TextStyle(color: dark2),
              ),
              onTap: (() {
                //Share
              }),
            ),  const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: dark2,
              ),
              title: Text(
                "Rate app",
                style: TextStyle(color: dark2),
              ),
              onTap: (() {
                //rate app
              }),
            ),  const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: dark2,
              ),
              title: Text(
                "Privacy",
                style: TextStyle(color: dark2),
              ),
              onTap: (() {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => const Faviru()));
              }),
            ),  const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
