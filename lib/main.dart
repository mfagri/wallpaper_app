
import 'package:app1/Favorit.dart';
import 'package:app1/data.dart';
import 'package:app1/drawer.dart';
import 'package:app1/pages.dart';
import 'package:app1/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  // ignore: prefer_const_constructors
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Splash()));
}

// ignore: use_key_in_widget_constructors
class BottomNavBar extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  
  late TabController mycontroller;
  @override
  void initState() {
    mycontroller = TabController(length: 4, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: dark,
        drawer: const ddarawer(),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: dark2,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Faviru()));
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(4),
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
                isScrollable: true,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  const tab(
                    name: "Newest",
                  ),
                  const tab(
                    name: "Trending",
                  ),
                  const tab(
                    name: "Popular",
                  ),
                  const tab(
                    name: "Random",
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: mycontroller,
                children: [
                  Anypage(list: attack_newset,),
                  Anypage(list: attack,),
                  Anypage(list: anime,),
                  Anypage(list: spyx,),
                ],
              ),
            ),
          ]),
        ));
  }
}

class tab extends StatelessWidget {
  final String name;
  const tab({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
          child: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}

// class AnimeCaty extends StatefulWidget {

//   const AnimeCaty({Key? key}) : super(key: key);

//   @override
//   State<AnimeCaty> createState() => _AnimeCatyState();
// }

// class _AnimeCatyState extends State<AnimeCaty> with SingleTickerProviderStateMixin{
//   @override
//   late TabController mycontroller;
//   @override
//   void initState() {
//     mycontroller = TabController(length: screens.length, vsync: this);
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(0.0),
//       child: Column(children: [
//         Container(
//           padding: const EdgeInsets.all(4),
//           height: 45,
//           decoration: BoxDecoration(
//             color: dark,
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: TabBar(
//             controller: mycontroller,
//             indicator: BoxDecoration(
//               color: dark2,
//               borderRadius: BorderRadius.circular(25),
//             ),
//             labelColor: dark,
//             unselectedLabelColor: dark2,
//             isScrollable: true,
//             // ignore: prefer_const_literals_to_create_immutables
//             tabs: [
//               const tab(
//                 name: "Random",
//               ),
//               const tab(
//                 name: "Naruto",
//               ),
//               const tab(
//                 name: "One piece",
//               ),
//               const tab(
//                 name: "Demon slayer",
//               ),
//               const tab(
//                 name: "Attack on titan",
//               ),
//               const tab(
//                 name: "Spy x family",
//               ),
//               const tab(
//                 name: "Boku no hero",
//               ),
//               const tab(
//                 name: "Jutso no kaisen",
//               ),
//             ],
//           ),
//         ),
//         // ignore: prefer_const_constructors
//         SizedBox(
//           height: 10,
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: mycontroller,
//             children: [
//               for (int i = 0; i < screens.length; i++) screens[i],
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }
