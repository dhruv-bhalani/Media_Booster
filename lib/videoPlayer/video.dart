import 'package:flutter/material.dart';
import 'package:media_player/main.dart';
import 'package:media_player/screens/mediaPlayer/media_provider.dart';
import 'package:provider/provider.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late MediaProvider mediaProviderR;
  late MediaProvider mediaProviderW;
  @override
  Widget build(BuildContext context) {
    mediaProviderR = context.read<MediaProvider>();
    mediaProviderW = context.watch<MediaProvider>();
    return Stack(
      children: [
        Image(
          image: NetworkImage(
            mediaProviderR.musicList[mediaProviderR.currentIndex].b_image!,
          ),
          fit: BoxFit.cover,
          height: MediaQuery.sizeOf(context).height,
        ),
      ],
    );
  }
}
