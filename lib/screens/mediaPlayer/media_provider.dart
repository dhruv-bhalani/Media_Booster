import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_player/model/model.dart';

class MediaProvider extends ChangeNotifier {
  bool isPlaying = false;
  bool isLike = true;
  int currentIndex = 0;
  int tabcurrentIndex = 0;
  bool isRepeat = false;
  List favList = [];
  // PlayerState? _playerState;

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  Duration liveDuration = const Duration(seconds: 0);
  Duration totalDuration = const Duration(seconds: 0);
  MediaProvider() {
    init();
    getMusicDuration();
    getLiveDuration();
  }
  List<MusicModel> musicList = [
// 1
    MusicModel(
      title: "Halki Halki Si",
      singer: " Asees Kaur",
      path:
          "https://pagalfree.com/musics/128-Halki Halki Si - Asees Kaur 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTDRh4HnMMyLBRjKogs6sBsDWKfzmw6fVf7g&s",
      f_image:
          "https://feeds.abplive.com/onecms/images/uploaded-images/2022/06/08/aa431b2a2315ae75920ffc7716fd46ec_original.jpg",
    ),

    MusicModel(
      title: "Aayi Nai",
      singer: "Sachin-Jigar, Pawan Singh, Divya Kumar",
      path: "https://pagalfree.com/musics/128-Aayi Nai - Stree 2 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcR4Wi7I5w0cH6OzxSQ0vPNACrCiEXJeRcSX_RsteIZRF9wVPg6Z",
      f_image:
          "https://img.wynk.in/unsafe/200x200/filters:no_upscale():strip_exif():format(jpg)/http://s3.ap-south-1.amazonaws.com/wynk-music-cms/srch_saregama/20240801205737000/8907212018256/1722528920624/resources/8907212018256.jpg",
    ),
// 2
    MusicModel(
      title: "Bhool Bhulaiyaa 3",
      singer: "Kartik Aaryan  ",
      path:
          "https://pagalfree.com/musics/128-Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.mp3",
      b_image:
          "https://upload.wikimedia.org/wikipedia/en/6/6f/Bhool_bhulaiyaa.jpg",
      f_image: "https://static.toiimg.com/photo/114837280.cms?imgsize=35968",
    ),
// 3
    MusicModel(
        title: "Mere Mehboob Mere Sanam",
        singer: " Alka Yagnik",
        path:
            "https://pagalfree.com/download/320-Mere Mehboob Mere Sanam - Bad Newz 320 Kbps.mp3",
        b_image:
            "https://i.scdn.co/image/ab67616d00001e02e1e330d774b305917db5fa82",
        f_image:
            "https://c.saavncdn.com/947/Mere-Mehboob-Mere-Sanam-From-Bad-Newz-Hindi-2024-20240712103733-500x500.jpg"),
// 4
    MusicModel(
      title: "Maar Udi",
      singer: "Shreya Ghoshal",
      path: "https://pagalfree.com/musics/128-Maar Udi - Sarfira 128 Kbps.mp3",
      b_image:
          "https://i.scdn.co/image/ab67616d0000b27356f33d97add47c95c08a964c",
      f_image: "https://i.ytimg.com/vi/3X-KIObXxpA/sddefault.jpg",
    ),
// 5
    MusicModel(
      title: "Angaaron",
      singer: "Vikas Badisa & Ravi Krishnan ",
      path:
          "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3",
      b_image:
          "https://c.saavncdn.com/580/Angaaron-From-Pushpa-2-The-Rule-Hindi-2024-20240528221027-500x500.jpg",
      f_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyUZSxrI62ZnzpZAvPNEoD6ZC3KEUHtiK7Nw&s",
    ),
// 6
    MusicModel(
      title: "Tauba Tauba",
      singer: "Karan Aujla & Vicky Kaushal",
      path:
          "https://pagalfree.com/download/320-Tauba Tauba - Bad Newz 320 Kbps.mp3",
      b_image:
          "https://stat4.bollywoodhungama.in/wp-content/uploads/2024/07/Vicky-Kaushal-and-Karan-Aujla-shine-on-Times-Square-with-viral-Tauba-Tauba-from-Bad-Newz-see-pics-1.jpg",
      f_image: "https://i.ytimg.com/vi/gVQlO6XDQp8/maxresdefault.jpg",
    ),

// 7
    MusicModel(
      title: "Satyanaas",
      singer: "Chandu Champion",
      path:
          "https://pagalfree.com/musics/128-Satyanaas - Chandu Champion 128 Kbps.mp3",
      b_image: "https://pbs.twimg.com/media/GObNFwhWcAA5Elo.jpg",
      f_image:
          "https://a10.gaanacdn.com/gn_img/albums/lJvKa16KDV/vKa5nPJXKD/size_m.jpg",
    ),
// 8
    MusicModel(
      title: "Zaalim",
      singer: "Badshah",
      path: "https://pagalfree.com/musics/128-Zaalim - Badshah 128 Kbps.mp3",
      b_image:
          "https://i1.sndcdn.com/artworks-SwgPKyuEp7yz5O7c-N2fWIA-t1080x1080.jpg",
      f_image: "https://i.ytimg.com/vi/3rWL1mavaKQ/maxresdefault.jpg",
    ),
// 9
    MusicModel(
      title: "Aaj Ki Raat",
      singer: "Sachin-Jigar",
      path:
          "https://pagalfree.com/musics/128-Aaj Ki Raat - Stree 2 128 Kbps.mp3",
      b_image:
          "https://cdns-images.dzcdn.net/images/cover/126dbc31ec91303660d1a1b74686aad2/0x1900-000000-80-0-0.jpg",
      f_image:
          "https://lyricsraag.com/wp-content/uploads/2024/07/Aaj-Ki-Raat-lyrics-english-Stree-2-Tamannaah-Bhatia.jpg",
    ),
// 10
    MusicModel(
      title: "Khaali Botal",
      singer: "Manan Bhardwaj",
      path:
          "https://pagalfree.com/musics/128-Khaali Botal - Manan Bhardwaj 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIOvtX0ZvPOHSlyguN7ngK60oG-mebaykDbg&s",
      f_image: "https://i.ytimg.com/vi/AyAzg7YZPRA/maxresdefault.jpg",
    ),
// 11
    MusicModel(
      title: "pushpa pushpa",
      singer: "Allu Arjun",
      path:
          "https://pagalfree.com/musics/128-Pushpa Pushpa - Pushpa 2 The Rule 128 Kbps.mp3",
      b_image:
          "https://upload.wikimedia.org/wikipedia/en/thumb/1/11/Pushpa_2-_The_Rule.jpg/220px-Pushpa_2-_The_Rule.jpg",
      f_image:
          "https://images.news18.com/ibnlive/uploads/2024/10/pushpa-2-release-date-2024-10-3a3d3b3c527135b709a35d5d47e54d3a.jpg?impolicy=website&width=360&height=270",
    ),
// 12
    MusicModel(
      title: "Yaad Aaunga",
      singer: "Stebin Ben",
      path:
          "https://pagalfree.com/musics/128-Main Yaad Aaunga - Stebin Ben 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzk-7OHKfPpQaa6kSCzYIyWzFiXC95ze8cwg&s",
      f_image: "https://i.ytimg.com/vi/02aYtxLwidM/hqdefault.jpg",
    ),
// 13
    MusicModel(
      title: "ghagra",
      singer: "Crew",
      path: "https://pagalfree.com/musics/128-Ghagra - Crew 128 Kbps.mp3",
      b_image:
          "https://i.scdn.co/image/ab67616d0000b273ab00f27207dbce8fb602d9b1",
      f_image:
          "https://english.cdn.zeenews.com/sites/default/files/styles/zm_500x286/public/2024/03/14/1376173-crew-ghagra.png",
    ),
// 14
    MusicModel(
      title: "Team India Hain HUm",
      singer: "Maidaan",
      path:
          "https://pagalfree.com/musics/128-Team India Hain Hum - Maidaan 128 Kbps.mp3",
      b_image:
          "https://c.saavncdn.com/499/Maidaan-Hindi-2024-20240427083419-500x500.jpg",
      f_image:
          "https://i.ytimg.com/vi/syL5y4G-gig/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCMhQ8dxY-nOVNEtSx8nOoCzEhJ2Q",
    ),
// 15
    MusicModel(
      title: "Tilasmi Bahein",
      singer: "Heeramandi",
      path:
          "https://pagalfree.com/musics/128-Tilasmi Bahein - Heeramandi 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSLEBQ-cCDv8Fi7yiaynmba31WZiZOBlJegnB13G-DDTrE4yipzSYyeJpjEKpbfADuBos&usqp=CAU",
      f_image:
          "https://miro.medium.com/v2/resize:fit:739/1*-g-4MNiotmgUwg2cu_mt6A.jpeg",
    ),
// 16
    MusicModel(
      title: "Khudaya",
      singer: "Sarfira",
      path: "https://pagalfree.com/musics/128-Khudaya - Sarfira 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe9T5HAkihnepzcsFKUzcZWCkXdYRhTr1ApXdABrcLpPd3G3NMbgvaiYmb9ikZmqwJ2kY&usqp=CAU",
      f_image:
          "https://images.onearabia.me/img/2024/06/khudaya-1719472464287-600x340.jpg",
    ),
// 17
    MusicModel(
      title: "Hauli Hauli",
      singer: "Khel Khel Mein",
      path:
          "https://pagalfree.com/musics/128-Hauli Hauli - Khel Khel Mein 128 Kbps.mp3",
      b_image:
          "https://m.media-amazon.com/images/M/MV5BMTg3MGU1ZGItZWEzNy00ZGJmLTk1OTYtZGIxNjdhNGViMjUyXkEyXkFqcGc@.V1.jpg",
      f_image:
          "https://m.media-amazon.com/images/M/MV5BMTg3MGU1ZGItZWEzNy00ZGJmLTk1OTYtZGIxNjdhNGViMjUyXkEyXkFqcGc@.V1.jpg",
    ),
// 18
    MusicModel(
      title: "Galti",
      singer: "Vishal Mishra",
      path:
          "https://pagalfree.com/musics/128-Galti - Vishal Mishra 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKkAN1MddcBndLdHTMIjXvpvKRo59kjLrgRA&s",
      f_image:
          "https://c.saavncdn.com/218/Galti-Hindi-2024-20240201182008-500x500.jpg",
    ),
// 19
    MusicModel(
      title: "Singham Again",
      singer: "Singham",
      path:
          "https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3",
      b_image:
          "https://s.saregama.tech/image/c/fh_200/e/2b/cf/singham-again_title-track_ott_1440_1729858521.jpg",
      f_image:
          "https://stat4.bollywoodhungama.in/wp-content/uploads/2024/10/Singham-Again-11.jpg",
    ),
// 20
    MusicModel(
      title: "Agar Ho Tum",
      singer: "Mr. And Mrs. Mahi",
      path:
          "https://pagalfree.com/musics/128-Agar Ho Tum - Mr. And Mrs. Mahi 128 Kbps.mp3",
      b_image:
          "https://c.saavncdn.com/522/Agar-Ho-Tum-From-Mr-And-Mrs-Mahi-Hindi-2024-20240520115627-500x500.jpg",
      f_image:
          "https://media5.bollywoodhungama.in/wp-content/uploads/2024/05/Agar-Ho-Tum-Mr.-Mrs.-Mahi-Rajkummar-Rao-Janhvi-Kapoor-480x360.jpg",
    ),
// 21
    MusicModel(
      title: "Sukriya",
      singer: "Saaj Bhatt",
      path:
          "https://pagalfree.com/musics/128-Sukriya - Saaj Bhatt 128 Kbps.mp3",
      b_image:
          "https://c.saavncdn.com/714/Sukriya-Hindi-2021-20210629020310-500x500.jpg",
      f_image:
          "https://c.saavncdn.com/714/Sukriya-Hindi-2021-20210629020310-500x500.jpg",
    ),
  ];

  void init() {
    List<Audio> audioList = musicList.map(
      (e) {
        return Audio.liveStream(
          e.path ?? "",
          metas: Metas(
            title: e.title,
          ),
        );
        // return Audio.network(
        //   e.path ?? "",
        //   metas: Metas(
        //     title: e.title,
        //   ),
        // );
      },
    ).toList();
    audioPlayer.open(
      Playlist(audios: audioList, startIndex: musicList.length + 0),
      autoStart: false,
    );
  }

  void changeIndex(int index) {
    currentIndex = index;
  }

  void chengePlayorPause() {
    if (audioPlayer.isPlaying.value) {
      audioPlayer.pause();
      isPlaying = false;
    } else {
      audioPlayer.play();
      isPlaying = true;
    }
    notifyListeners();
  }

  void nextSong() {
    currentIndex++;
    playMusic(currentIndex);
    notifyListeners();
  }

  void previousSong() {
    currentIndex--;
    playMusic(currentIndex);
    notifyListeners();
  }

  void getMusicDuration() {
    audioPlayer.current.listen((event) {
      totalDuration = event!.audio.duration;
      notifyListeners();
    });
  }

  void getLiveDuration() {
    audioPlayer.currentPosition.listen((event) {
      liveDuration = event;
      notifyListeners();
    });
  }

  void seekMusic(Duration d1) {
    audioPlayer.seek(d1);
  }

  void likeSong() {
    isLike = !isLike;
    notifyListeners();
  }

  void playMusic(int index) {
    currentIndex = index;
    audioPlayer.open(Audio.network(musicList[index].path!), autoStart: true);
    isPlaying = true;
    notifyListeners();
  }

  void pauseMusic() {
    audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }
}
