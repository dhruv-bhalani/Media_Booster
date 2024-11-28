import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_player/model/model.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  int currentIndex = 0;
  late VideoPlayerController controller;
  late ChewieController chewieController;

  // List<VideoModel> videoList = [
  //   VideoModel(
  //       title: 'Dhruv',
  //       path: 'lib/assets/media/1.mp4',
  //       video: 'https://youtu.be/G4tjolMIR80'),
  //   VideoModel(
  //       title: 'Dhruv',
  //       path: 'lib/assets/media/2.mp4',
  //       video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
  //   VideoModel(
  //       title: 'Dhruv',
  //       path: 'lib/assets/media/3.mp4',
  //       video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
  //   VideoModel(
  //       title: 'Dhruv',
  //       path: 'lib/assets/media/4.mp4',
  //       video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
  //   VideoModel(
  //       title: 'Dhruv',
  //       path: 'lib/assets/media/5.mp4',
  //       video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
  // ];
  videoControllerInit() {
    controller = VideoPlayerController.networkUrl(
      (Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')),
    )..initialize().then((_) {
        notifyListeners();
      });
  }
}
