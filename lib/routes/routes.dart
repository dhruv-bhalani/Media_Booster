import 'package:flutter/material.dart';
import 'package:media_player/screens/home/home.dart';
import 'package:media_player/screens/mediaPlayer/mediaPlayer.dart';
import 'package:media_player/screens/splashscreen/splashscreen.dart';

class Routes {
  Map<String, WidgetBuilder> allroutes = {
    '/': (context) => const Splashscreen(),
    '/home': (context) => const Home(),
    '/madia': (context) => const Mediaplayer(),
  };
}
