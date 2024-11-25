import 'package:flutter/material.dart';

class MusicModel {
  String? title, path, b_image, f_image, singer;
  MusicModel(
      {required this.title,
      required this.path,
      this.b_image,
      this.f_image,
      this.singer});
}

class VideoModel {
  String? title, path, video;
  VideoModel({required this.title, required this.path, this.video});
}
