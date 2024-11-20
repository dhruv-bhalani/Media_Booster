import 'package:flutter/material.dart';

import 'package:media_player/screens/mediaPlayer/media_provider.dart';
import 'package:media_player/utils/extension.dart';
import 'package:provider/provider.dart';

class Mediaplayer extends StatefulWidget {
  const Mediaplayer({super.key});

  @override
  State<Mediaplayer> createState() => _MediaplayerState();
}

class _MediaplayerState extends State<Mediaplayer> {
  late MediaProvider mediaProviderR;
  late MediaProvider mediaProviderW;
  @override
  Widget build(BuildContext context) {
    mediaProviderR = context.read<MediaProvider>();
    mediaProviderW = context.watch<MediaProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Player'),
      ),
      body: Stack(
        children: [
          Image(
            image: const NetworkImage(
              'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR4Wi7I5w0cH6OzxSQ0vPNACrCiEXJeRcSX_RsteIZRF9wVPg6Z',
            ),
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: NetworkImage(
                        'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR4Wi7I5w0cH6OzxSQ0vPNACrCiEXJeRcSX_RsteIZRF9wVPg6Z',
                        scale: 2.5),
                  ),
                  30.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '0${mediaProviderW.liveDuration.inMinutes}:${mediaProviderW.liveDuration.inSeconds.bitLength}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Slider(
                        value: mediaProviderW.liveDuration.inSeconds.toDouble(),
                        onChanged: (value) {
                          mediaProviderR.seekMusic(
                            Duration(
                              seconds: value.toInt(),
                            ),
                          );
                        },
                        max: mediaProviderW.totalDuration.inSeconds.toDouble(),
                      ),
                      Text(
                        '0${mediaProviderW.totalDuration.inMinutes}:${mediaProviderW.totalDuration.inSeconds.bitLength}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          mediaProviderR.previousSong();
                        },
                        icon: const Icon(Icons.skip_previous),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          mediaProviderR.chengePlayorPause();
                        },
                        icon: mediaProviderW.isPlaying
                            ? const Icon(Icons.play_arrow)
                            : const Icon(Icons.pause),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          mediaProviderR.nextSong();
                        },
                        icon: const Icon(Icons.skip_next),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
