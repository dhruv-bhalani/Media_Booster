import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_player/routes/routes.dart';
import 'package:media_player/screens/home/home_provider.dart';
import 'package:media_player/screens/mediaPlayer/media_provider.dart';
import 'package:media_player/screens/videoPlayer/video_Povider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MediaProvider()),
        ChangeNotifierProvider.value(
          value: Homeprovider()..isdarkmode,
        ),
        ChangeNotifierProvider.value(value: VideoProvider()),
      ],
      child: Consumer<Homeprovider>(
        builder: (context, value, child) {
          return MaterialApp(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
              ),
              textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.green.shade600,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.green.shade600,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                ),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black.withAlpha(200)),
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              // scaffoldBackgroundColor: Colors.blue,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blue,
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                    fontFamily: 'poppins'),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.blue,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
            themeMode: (value.isdarkmode)
                ? ThemeMode.dark
                : value.isdarkmode
                    ? ThemeMode.dark
                    : ThemeMode.light,
            routes: Routes().allroutes,
          );
        },
      ),
    );
  }
}
