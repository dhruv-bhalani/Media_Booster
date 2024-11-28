import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screens/videoPlayer/video_Povider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController videoController;
  late ChewieController? chewieController;

  // List videoList = [
  //   "C:\Users\asus\Downloads\Dakla.mp4",
  //   "C:\Users\asus\Downloads\GHOOMARIYU.mp4",
  //   "C:\Users\asus\Downloads\Gori Radha Ne Kalo Kaan.mp4",
  //   "C:\Users\asus\Downloads\Gori Tame Manda Lidha Mohi Raj.mp4",
  //   "C:\Users\asus\Downloads\Gujarati Mashup.mp4",
  // ];
  @override
  void initState() {
    // videoController = VideoPlayerController.
    // videoController = VideoPlayerController.file(
    //   File(
    //     videoList[0],
    //   ),
    // )..initialize().then((_) {
    //     setState(() {});
    //   });
    videoController = VideoPlayerController.asset(
      'lib/assets/media/13.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
    chewieController = ChewieController(
      videoPlayerController: videoController,
      autoPlay: true,
      looping: true,
    );
    super.initState();
  }

  void playVideo() {
    videoController.play();
  }

  late VideoProvider videoProviderW;
  late VideoProvider videoProviderR;
  @override
  Widget build(BuildContext context) {
    videoProviderW = context.watch<VideoProvider>();
    videoProviderR = context.read<VideoProvider>();
    return Scaffold(
      body: videoController.value.isInitialized
          ? Center(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: videoController.value.aspectRatio,
                    child: Chewie(
                      controller: chewieController!,
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void dispose() {
    videoProviderW.controller.dispose();
    super.dispose();
  }
}
