import 'package:flutter/material.dart';
import 'package:media_player/model/model.dart';

import 'package:media_player/screens/mediaPlayer/media_provider.dart';
import 'package:media_player/utils/extension.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
    // final MusicModel musicModel =
    //     ModalRoute.of(context)!.settings.arguments as MusicModel;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Media Player'),
      // ),
      body: Stack(
        children: [
          Image(
            image: NetworkImage(
              mediaProviderR.musicList[mediaProviderR.currentIndex].b_image!,
            ),
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              iconColor: Colors.white,
              iconSize: 25,
              tooltip: 'Menu',
              padding: const EdgeInsets.all(16),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text('Shere'),
                    onTap: () {
                      Share.share(
                          "${mediaProviderR.musicList[mediaProviderR.currentIndex].title}\n${mediaProviderR.musicList[mediaProviderR.currentIndex].path}");
                    },
                  ),
                  PopupMenuItem(
                    child: const Text('Exit'),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                ];
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // Image(
                  //   image: NetworkImage(
                  //       mediaProviderR
                  //           .musicList[mediaProviderR.currentIndex].f_image!,
                  //       scale: 1.5),
                  // ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      mediaProviderR
                          .musicList[mediaProviderR.currentIndex].f_image!,
                      scale: 1.5,
                    ),
                    radius: 150,
                    backgroundColor: Colors.transparent,
                  ),
                  70.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${mediaProviderR.musicList[mediaProviderR.currentIndex].title}...',
                        style: const TextStyle(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          mediaProviderW.isLike = !mediaProviderW.isLike;
                        },
                        icon: mediaProviderW.isLike
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  150.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0${mediaProviderW.liveDuration.inMinutes}:${mediaProviderW.liveDuration.inSeconds}',
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
                  50.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // mediaProviderR.chengeRepeat();
                        },
                        icon: const Icon(Icons.repeat),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          mediaProviderR.previousSong();
                        },
                        icon: const Icon(
                          Icons.skip_previous,
                          size: 40,
                        ),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          mediaProviderR.chengePlayorPause();
                        },
                        icon: mediaProviderW.isPlaying
                            ? const Icon(
                                Icons.pause_circle_outline_outlined,
                                size: 50,
                              )
                            : const Icon(
                                Icons.play_circle_outline_outlined,
                                size: 50,
                              ),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          mediaProviderR.nextSong();
                        },
                        icon: const Icon(
                          Icons.skip_next,
                          size: 40,
                        ),
                        color: Colors.white,
                      ),
                      PopupMenuButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        iconColor: Colors.white,
                        iconSize: 25,
                        tooltip: 'Menu',
                        icon: const Icon(Icons.menu),
                        itemBuilder: (context) {
                          return [
                            
                            PopupMenuItem(
                              child: Text(
                                  'Song ${mediaProviderR.currentIndex + 1}/${mediaProviderR.musicList.length}'),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 500,
                                      color: Colors.white,
                                      child: ListView.builder(
                                        itemCount:
                                            mediaProviderW.musicList.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(16),
                                            onTap: () {
                                              mediaProviderW.isPlaying = true;
                                              Navigator.pop(context);
                                            },
                                            leading: CircleAvatar(
                                              radius: 25,
                                              backgroundImage: NetworkImage(
                                                mediaProviderW
                                                    .musicList[index].f_image!,
                                              ),
                                            ),
                                            title: Text(
                                              '${mediaProviderW.musicList[index].title}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                                '${mediaProviderW.musicList[index].path}'),
                                            trailing: IconButton(
                                              onPressed: () {
                                                mediaProviderW.isPlaying = true;
                                                Navigator.pop(context);
                                              },
                                              icon:
                                                  const Icon(Icons.play_arrow),
                                              style: IconButton.styleFrom(
                                                  iconSize: 30),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),

                          ];
                        },
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
