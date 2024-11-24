import 'package:flutter/material.dart';
import 'package:media_player/model/model.dart';

class VideoProvider with ChangeNotifier {
  int currentIndex = 0;

  List<VideoModel> videoList = [
    VideoModel(
        title: 'Dhruv',
        path: 'https://www.youtube.com/watch?v=3X-KIObXxpA',
        video: 'https://youtu.be/G4tjolMIR80'),
    VideoModel(
        title: 'Dhruv',
        path: 'https://www.youtube.com/watch?v=3X-KIObXxpA',
        video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
    VideoModel(
        title: 'Dhruv',
        path: 'https://www.youtube.com/watch?v=3X-KIObXxpA',
        video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
    VideoModel(
        title: 'Dhruv',
        path: 'https://www.youtube.com/watch?v=3X-KIObXxpA',
        video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
    VideoModel(
        title: 'Dhruv',
        path: 'https://www.youtube.com/watch?v=3X-KIObXxpA',
        video: 'https://www.youtube.com/watch?v=3X-KIObXxpA'),
  ];

  void nextSong() {
    if (currentIndex < videoList.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    notifyListeners();
  }

  void previousSong() {
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = videoList.length - 1;
    }
    notifyListeners();
  }
}
