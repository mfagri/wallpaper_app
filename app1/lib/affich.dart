import 'package:app1/Favorit.dart';
import 'package:app1/home.dart';
import 'package:app1/main.dart';
import 'package:app1/splash.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

var rr;
void _addtofa(String St) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('alla', St + "," + s.toString());
  s = prefs.getString('alla');
}

void _addtofa2(String St) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('alla', St);
  s = prefs.getString('alla');
}

var c = Icons.favorite_border;
bool f = false;

class PhotoA extends StatefulWidget {
  final String url;

  const PhotoA({Key? key, required this.url}) : super(key: key);

  @override
  State<PhotoA> createState() => _PhotoAState();
}

class _PhotoAState extends State<PhotoA> {
  //get url => null;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  String _wallpaperAsset = 'Unknown';
  String _platformVersion = 'Unknown';
  Widget build(BuildContext context) {
    widget.url;
    loadBuyedItems();
    var replace;
    List fav = [];
    int j = 0;
    if (s != null) {
      fav = s != null ? s.split(",") : null;
      if (s.contains(widget.url)) {
        c = Icons.favorite;
        f = true;
      } else {
        c = Icons.favorite_border;
        f = false;
      }
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
              // child: Image(
              //   image: AssetImage(widget.items[widget.index]),
              //   fit: BoxFit.fill,
              // ),
              child: CachedNetworkImage(
                imageUrl: widget.url,
                errorWidget: (context, url, error) => CircularProgressIndicator(
                  color: Color.fromARGB(255, 163, 152, 152),
                ),
                fit: BoxFit.fill,
              ),
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
                  MaterialPageRoute(builder: (context) => Faviru()),
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
                    onPressed: () async {
                      ////set  as///
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text('Set As:\n'),
                            // content: Text("Your chois"),
                            actions: [
                              SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: Text('Both screens'),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  _setwallpaper(
                                      WallpaperManagerFlutter.BOTH_SCREENS);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: Text('Home screen'),
                                onPressed: () async {
                                  //     Navigator.pop(context);
                                  _setwallpaper(
                                      WallpaperManagerFlutter.HOME_SCREEN);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: Text('Lock screen'),
                                onPressed: () async {
                                  _setwallpaper(
                                      WallpaperManagerFlutter.LOCK_SCREEN);
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
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
                            _addtofa(widget.url);
                            c = Icons.favorite;
                          } else {
                            fav.remove(widget.url);
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
        ],
      ),
    );

    // else {
    //   return Scaffold(
    //     appBar: AppBar(backgroundColor: dark),
    //   );
  }

  Future<void> _setwallpaper(location) async {
    //  var file = widget.items[widget.index];
    var file = await DefaultCacheManager().getSingleFile(widget.url);
    try {
      WallpaperManagerFlutter().setwallpaperfromFile(file, location);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wallpaper updated'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error Setting Wallpaper'),
        ),
      );
      print(e);
    }
  }
}
