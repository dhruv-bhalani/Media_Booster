import 'package:flutter/material.dart';
import 'package:media_player/screens/home/home.dart';
import 'package:media_player/screens/mediaPlayer/mediaPlayer.dart';
import 'package:media_player/screens/splashscreen/splashscreen.dart';
import 'package:media_player/videoPlayer/video.dart';

class Routes {
  Map<String, WidgetBuilder> allroutes = {
    // '/': (context) => const Splashscreen(),
    '/': (context) => const Home(),
    '/music': (context) => const Mediaplayer(),
    '/video': (context) => const Video(),
  };
}
