import 'dart:io' as Io;
import 'dart:async';
import 'dart:io';
import 'package:app1/affich.dart';
import 'package:app1/home.dart';
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

import 'data.dart';

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      title: Text("Download"),
      centerTitle: true,
    ),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(child: Text('Download')),
    );
  }
}

class One_piece extends StatefulWidget {
  const One_piece({Key? key}) : super(key: key);

  @override
  State<One_piece> createState() => _One_pieceState();
}

class _One_pieceState extends State<One_piece> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child:  MasonryGridView.builder(
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: onepiece.length,
    itemBuilder: (context, index) {
      
      var o;
      o = s.split(',');
      Isinlist(onepiece[index], o, index);
      
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
                    image: AssetImage(onepiece[index]),
                    fit: BoxFit.fill,
                  ),
                ),
                
                // Positioned(
                //   bottom: 10,
                //   left: 10,
                //   child: Column(
                //     children: [
                //       Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                            
                //             Icon(
                //               Icons.favorite,
                //               color: Isinlist(onepiece[index], o, index),
                //               size: 20,
                //             )
                //           ]),
                //     ],
                //   ),
                // ),
              ],
              ///////////////////////////one tap
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoA(
                          index: index,
                          items: onepiece,
                        )),
              );
            },
            ////////////////////////////////
            
          ));
    },
    
  )
      ),
    );
  }
}

class Naruto extends StatefulWidget {
  const Naruto({Key? key}) : super(key: key);

  @override
  State<Naruto> createState() => _NarutoState();
}

class _NarutoState extends State<Naruto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
       padding: EdgeInsets.only(left: 10,right: 10),
        child:  MasonryGridView.builder(
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: naruto.length,
    itemBuilder: (context, index) {
      
      var o;
      o = s.split(',');
      Isinlist(naruto[index], o, index);
      
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
                    image: AssetImage(naruto[index]),
                    fit: BoxFit.fill,
                  ),
                ),
                
                // Positioned(
                //   bottom: 10,
                //   left: 10,
                //   child: Column(
                //     children: [
                //       Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                            
                //             Icon(
                //               Icons.favorite,
                //               color: Isinlist(naruto[index], o, index),
                //               size: 20,
                //             )
                //           ]),
                //     ],
                //   ),
                // ),
              ],
              ///////////////////////////one tap
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoA(
                          index: index,
                          items: naruto,
                        )),
              );
            },
            ////////////////////////////////
            
          ));
    },
    
        ),
      ),
    );
  }
}

class Spyxfamily extends StatefulWidget {
  const Spyxfamily({Key? key}) : super(key: key);

  @override
  State<Spyxfamily> createState() => _SpyxfamilyState();
}

class _SpyxfamilyState extends State<Spyxfamily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
         padding: EdgeInsets.only(left: 10,right: 10),
        child: MasonryGridView.builder(
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: spyx.length,
    itemBuilder: (context, index) {
      
      var o;
      o = s.split(',');
      Isinlist(spyx[index], o, index);
      
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
                    image: AssetImage(spyx[index]),
                    fit: BoxFit.fill,
                  ),
                ),
                
                // Positioned(
                //   bottom: 10,
                //   left: 10,
                //   child: Column(
                //     children: [
                //       Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                            
                //             Icon(
                //               Icons.favorite,
                //               color: Isinlist(spyx[index], o, index),
                //               size: 20,
                //             )
                //           ]),
                //     ],
                //   ),
                // ),
              ],
              ///////////////////////////one tap
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoA(
                          index: index,
                          items: spyx,
                        )),
              );
            },
            ////////////////////////////////
            
          ));
    },
    
  ), 
        ),
    );
  }
}


class Attackontitan extends StatefulWidget {
  const Attackontitan({Key? key}) : super(key: key);

  @override
  State<Attackontitan> createState() => _AttackontitanState();
}

class _AttackontitanState extends State<Attackontitan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Container(
         padding: EdgeInsets.only(left: 10,right: 10),
        child: MasonryGridView.builder(
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: attack.length,
    itemBuilder: (context, index) {
      
      var o;
      o = s.split(',');
      Isinlist(attack[index], o, index);
      
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
                    image: AssetImage(attack[index]),
                    fit: BoxFit.fill,
                  ),
                ),
                
                // Positioned(
                //   bottom: 10,
                //   left: 10,
                //   child: Column(
                //     children: [
                //       Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children: [
                            
                //             Icon(
                //               Icons.favorite,
                //               color: Isinlist(attack[index], o, index),
                //               size: 20,
                //             )
                //           ]),
                //     ],
                //   ),
                // ),
              ],
              ///////////////////////////one tap
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PhotoA(
                          index: index,
                          items: attack,
                        )),
              );
            },
            ////////////////////////////////
            
          ));
    },
    
  ),
      ),
    );
  }
}



  