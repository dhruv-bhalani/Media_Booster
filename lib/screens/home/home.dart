import 'package:flutter/material.dart';
import 'package:media_player/main.dart';
import 'package:media_player/screens/home/home_provider.dart';
import 'package:media_player/screens/mediaPlayer/media_provider.dart';
import 'package:media_player/screens/videoPlayer/video_Povider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;
  late Homeprovider homeProviderW;
  late Homeprovider homeProviderR;
  late VideoProvider videoProviderW;
  late VideoProvider videoProviderR;
  late MediaProvider mediaProviderW;
  late MediaProvider mediaProviderR;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<Homeprovider>();
    homeProviderW = context.watch<Homeprovider>();
    mediaProviderW = context.watch<MediaProvider>();
    mediaProviderR = context.read<MediaProvider>();
    videoProviderR = context.read<VideoProvider>();
    videoProviderW = context.watch<VideoProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff058dd9),
        title: const Text(
          'Music & Video ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              homeProviderW.isdarkmode = !homeProviderW.isdarkmode;
            },
            icon: homeProviderW.isdarkmode
                ? const Icon(Icons.light_mode, color: Colors.white)
                : const Icon(
                    Icons.dark_mode,
                    color: Colors.white,
                  ),
          ),
          IconButton(
            onPressed: () {
              homeProviderR.check();
            },
            icon: homeProviderW.isCheck
                ? const Icon(Icons.list_rounded, color: Colors.white)
                : const Icon(Icons.grid_view_rounded, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              child: Text(
                'Music',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              icon: Icon(Icons.video_library, color: Colors.white),
              child: Text(
                'Video',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          homeProviderW.isCheck
              ? ListView.builder(
                  itemCount: mediaProviderR.musicList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      hoverColor: Colors.grey,
                      splashColor: Colors.grey,
                      onTap: () {
                        mediaProviderR.playMusic(index);
                        Navigator.pushNamed(context, '/music');
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          mediaProviderR.musicList[index].b_image!,
                        ),
                      ),
                      title: Text(
                        '${mediaProviderR.musicList[index].title}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: mediaProviderR.musicList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        mediaProviderR.currentIndex = index;

                        mediaProviderR.playMusic(index);
                        // mediaProviderR.changeIndex(index);
                        Navigator.pushNamed(context, '/music');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  mediaProviderR.musicList[index].b_image!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "${mediaProviderR.musicList[index].title}",
                          ),
                        ],
                      ),
                    );
                  },
                ),
          homeProviderW.isCheck
              ? ListView.builder(
                  itemCount: videoProviderR.videoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        mediaProviderR.currentIndex = index;
                        Navigator.pushNamed(context, '/video');
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          videoProviderR.videoList[index].video!,
                        ),
                      ),
                      title: Text(
                        '${videoProviderR.videoList[index].title}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${videoProviderR.videoList[index].path}'),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: videoProviderR.videoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // mediaProviderR.currentIndex = index;

                        Navigator.pushNamed(context, '/video');
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  videoProviderR.videoList[index].video!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "${videoProviderR.videoList[index].title}",
                          )
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
