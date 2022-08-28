
import 'package:app1/data.dart';
import 'package:app1/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var s;
var dl;
var safe = false;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _Splash createState() => _Splash();
}

void loadBuyedItems() async {
  final prefs = await SharedPreferences.getInstance();
  final aprefs = await SharedPreferences.getInstance();
  s = prefs.getString('alla');
  dl = aprefs.getBool('dark');
  if (dl == true) {
    dark = Colors.black;
    dark2 = Colors.white;
  } else {
    dark = const Color.fromARGB(255, 255, 255, 255);
    dark2 = const Color.fromARGB(255, 0, 0, 0);
  } 
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
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'welcome',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: const CircularProgressIndicator(
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
