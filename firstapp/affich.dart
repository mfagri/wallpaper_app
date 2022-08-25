import 'package:app1/home.dart';
import 'package:app1/main.dart';
import 'package:app1/splash.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

void _addtofa(String St) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('all', St + "," + s.toString());
  s = prefs.getString('all');
}

void _addtofa2(String St) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('all', St);
  s = prefs.getString('all');
}

var c = Icons.favorite_border;
bool f = false;

class PhotoA extends StatefulWidget {
  final int index;
  final List items;
  const PhotoA({Key? key, required this.index, required this.items})
      : super(key: key);

  @override
  State<PhotoA> createState() => _PhotoAState();
}

class _PhotoAState extends State<PhotoA> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  Widget build(BuildContext context) {
    loadBuyedItems();
    var replace;
    List fav = [];
    int j = 0;
    fav = s != null ? s.split(",") : null;
    if (s.contains(widget.items[widget.index])) {
      c = Icons.favorite;
      f = true;
    } else {
      c = Icons.favorite_border;
      f = false;
    }
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage(widget.items[widget.index]),
                fit: BoxFit.fill,
              ),
              // child: CachedNetworkImage(
              // imageUrl: 'https://source.unsplash.com/random?sig=$index',
              // errorWidget: (context, url, error) => CircularProgressIndicator(
              //   color: Color.fromARGB(255, 163, 152, 152),
              // ),
              // fit: BoxFit.fill,
              // ),
            ),
          ),
          Positioned(
            top: 4,
            left: 4,
            child: IconButton(
              disabledColor: Colors.black,
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                size: 40,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavBar()),
                );
              },
            ),
          ),
          Positioned(
              bottom: 40,
              right: MediaQuery.of(context).size.width * .3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.download_for_offline_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      ////download///
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.format_paint_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      ////set  as///
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    icon: Icon(
                      c,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      ////////add to favorite///
                      setState(
                        () {
                          if (f == false) {
                            _addtofa(widget.items[widget.index]);
                            c = Icons.favorite;
                          } else {
                            fav.remove(widget.items[widget.index]);
                            replace = StringBuffer();
                            replace.writeAll(fav, ',');
                            _addtofa2(replace.toString());
                          }
                        },
                      );
                    },
                  ),
                ],
              )),
          // if(f == false)
          //   Positioned(
          //     bottom: 15,
          //     right: 60,
          //     child: Text('Add',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),),
        ],
      ),
    );
  }
}
