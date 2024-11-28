import 'package:flutter/material.dart';
import 'package:media_player/screens/mediaPlayer/media_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late MediaProvider mediaProviderW;
  late MediaProvider mediaProviderR;

  @override
  Widget build(BuildContext context) {
    mediaProviderW = context.watch<MediaProvider>();
    mediaProviderR = context.read<MediaProvider>();

    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // child: GridView.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     childAspectRatio: 3 / 4,
        //   ),
        //   itemCount: mediaProviderW.favList.length,
        //   itemBuilder: (context, index) {
        //     return GestureDetector(
        //       onTap: () {
        //         mediaProviderR.currentIndex = index;
        //
        //         mediaProviderR.playMusic(index);
        //         // mediaProviderR.changeIndex(index);
        //         Navigator.pushNamed(context, '/music',
        //             arguments: mediaProviderR.favList[index]);
        //       },
        //       child: Column(
        //         children: [
        //           Container(
        //             height: 100,
        //             width: 200,
        //             decoration: BoxDecoration(
        //               image: DecorationImage(
        //                 image: NetworkImage(
        //                   mediaProviderW
        //                       .favList[mediaProviderR.currentIndex].b_image!,
        //                 ),
        //                 fit: BoxFit.cover,
        //               ),
        //             ),
        //           ),
        //           Text(
        //             "${mediaProviderW.favList[mediaProviderR.currentIndex].title}",
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: mediaProviderR.favList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                mediaProviderR.currentIndex = index;

                mediaProviderR.playMusic(index);
                // mediaProviderR.changeIndex(index);
                Navigator.pushNamed(context, '/music',
                    arguments: mediaProviderR.favList[index]);
              },
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          mediaProviderW.favList[index].b_image!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    '${mediaProviderW.favList[index].title}',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
