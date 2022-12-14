import 'dart:typed_data';
import 'package:app1/Favorit.dart';
import 'package:dio/dio.dart';
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
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: non_constant_identifier_names
void _addtofa(String St) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('alla', "$St,$s");
  s = prefs.getString('alla');
}

// ignore: non_constant_identifier_names
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
  @override
  void setState(VoidCallback fn) {
    _requestPermission();
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    widget.url;
    loadBuyedItems();
    StringBuffer replace;
    List fav = [];
    if (s != null) {
      fav = s.split(",");
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
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: widget.url,
                errorWidget: (context, url, error) => const CircularProgressIndicator(
                  color: Color.fromARGB(255, 163, 152, 152),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 4,
            child: IconButton(
              disabledColor: Colors.black,
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                size: 40,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const Faviru()),
                );
              },
            ),
          ),
          Positioned(
              bottom: 40,
              right: MediaQuery.of(context).size.width * .2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.download_for_offline_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {
                      ////download///
                      _getHttp();
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    icon: const Icon(
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
                            title: const Text('Set As:\n'),
                            // content: Text("Your chois"),
                            actions: [
                              const SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: const Text('Both screens'),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  _setwallpaper(
                                      WallpaperManagerFlutter.BOTH_SCREENS);
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: const Text('Home screen'),
                                onPressed: () async {
                                   Navigator.pop(context);
                                  _setwallpaper(
                                      WallpaperManagerFlutter.HOME_SCREEN);
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: const Text('Lock screen'),
                                onPressed: () async {
                                  _setwallpaper(
                                      WallpaperManagerFlutter.LOCK_SCREEN);
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                child: const Text('Cancel'),
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
                  const SizedBox(
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
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Add to favorite'),
                              ),
                            );
                          } else {
                            fav.remove(widget.url);
                            replace = StringBuffer();
                            replace.writeAll(fav, ',');
                            _addtofa2(replace.toString());
                             ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                dismissDirection : DismissDirection.up,
                                content: Text('Remove from favorite'),
                              ),
                            );
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
  }

  Future<void> _setwallpaper(location) async {
    var file = await DefaultCacheManager().getSingleFile(widget.url);
    try {
      WallpaperManagerFlutter().setwallpaperfromFile(file, location);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wallpaper updated'),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error Setting Wallpaper'),
        ),
      );
      // ignore: avoid_print
      print(e);
    }
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    // ignore: avoid_print
    print(info);
    // _toastInfo(info);
  }

  _getHttp() async {

     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading'),
        ),
      );
    var response = await Dio()
        .get(widget.url, options: Options(responseType: ResponseType.bytes));
    // ignore: unused_local_variable
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 80,
        name: "hello");
       // ignore: use_build_context_synchronously
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Download is done'),
        ),
      );
    //_toastInfo("$result");
  }
}
