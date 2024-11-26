import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
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
  // late AudioPlayer player = AudioPlayer();
  // final AudioPlayer audioplayer = AudioPlayer();
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

// 8
// 9
    MusicModel(
      title: "Satyanaas",
      singer: "Chandu Champion",
      path:
          "https://pagalfree.com/musics/128-Satyanaas - Chandu Champion 128 Kbps.mp3",
      b_image: "https://pbs.twimg.com/media/GObNFwhWcAA5Elo.jpg",
      f_image:
          "https://a10.gaanacdn.com/gn_img/albums/lJvKa16KDV/vKa5nPJXKD/size_m.jpg",
    ),
// 10
    MusicModel(
      title: "Zaalim",
      singer: "Badshah",
      path: "https://pagalfree.com/musics/128-Zaalim - Badshah 128 Kbps.mp3",
      b_image:
          "https://i1.sndcdn.com/artworks-SwgPKyuEp7yz5O7c-N2fWIA-t1080x1080.jpg",
      f_image: "https://i.ytimg.com/vi/3rWL1mavaKQ/maxresdefault.jpg",
    ),
// 11
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
// 12
    MusicModel(
      title: "Khaali Botal",
      singer: "Manan Bhardwaj",
      path:
          "https://pagalfree.com/musics/128-Khaali Botal - Manan Bhardwaj 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIOvtX0ZvPOHSlyguN7ngK60oG-mebaykDbg&s",
      f_image: "https://i.ytimg.com/vi/AyAzg7YZPRA/maxresdefault.jpg",
    ),
// 13
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
// 14
    MusicModel(
      title: "Yaad Aaunga",
      singer: "Stebin Ben",
      path:
          "https://pagalfree.com/musics/128-Main Yaad Aaunga - Stebin Ben 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzk-7OHKfPpQaa6kSCzYIyWzFiXC95ze8cwg&s",
      f_image: "https://i.ytimg.com/vi/02aYtxLwidM/hqdefault.jpg",
    ),
// 15
    MusicModel(
      title: "ghagra",
      singer: "Crew",
      path: "https://pagalfree.com/musics/128-Ghagra - Crew 128 Kbps.mp3",
      b_image:
          "https://i.scdn.co/image/ab67616d0000b273ab00f27207dbce8fb602d9b1",
      f_image:
          "https://english.cdn.zeenews.com/sites/default/files/styles/zm_500x286/public/2024/03/14/1376173-crew-ghagra.png",
    ),
// 16
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
// 17
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
// 18
    MusicModel(
      title: "Khudaya",
      singer: "Sarfira",
      path: "https://pagalfree.com/musics/128-Khudaya - Sarfira 128 Kbps.mp3",
      b_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe9T5HAkihnepzcsFKUzcZWCkXdYRhTr1ApXdABrcLpPd3G3NMbgvaiYmb9ikZmqwJ2kY&usqp=CAU",
      f_image:
          "https://images.onearabia.me/img/2024/06/khudaya-1719472464287-600x340.jpg",
    ),
// 19
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
// 20
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
// 21
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
// 22
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
// 23
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
// 24
    MusicModel(
        title: "Karshan Bhagwan Chalya",
        singer: 'Aditya Gadhvi',
        path: '',
        b_image: 'https://i.ytimg.com/vi/PHyT-qbJvuk/sddefault.jpg',
        f_image: 'https://i.ytimg.com/vi/YMrVf4O65Ss/maxresdefault.jpg'),
// 25
    MusicModel(
        title: "Mayalu Manvi",
        singer: 'Aditya Gadhvi',
        path: '',
        b_image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC24ev37v4GGbBEZzImpoCCkwc7nv5RY7GTg&s',
        f_image:
            'https://i.ytimg.com/vi/WWeDMJWgpRc/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLCAMDYzQBf6f0BKrK0-hdkiqdHxBw'),
// 26
    MusicModel(
        title: "Gori Radha Ne Kalo Kaan",
        singer: 'Kirtidan Gadhvi',
        path: '',
        b_image:
            'https://i.scdn.co/image/ab6761610000e5ebf78923904ab4bb312f36e788',
        f_image:
            'https://c.saavncdn.com/951/Gori-Radha-Ne-Kalo-Kaan-Shri-Krishna-Nonstop-Dandiya-Gujarati-2022-20220812122435-500x500.jpg'),
// 27
    MusicModel(
        title: 'Moj ma revu moj ma',
        path: '',
        singer: 'Aditya Gadhvi',
        b_image:
            'https://www.abhivyaktiart.org/wp-content/uploads/2020/03/Opening-performance-by-Aaditya-Gadhavi.jpg',
        f_image: 'https://i.ytimg.com/vi/pjNlNONkW50/sddefault.jpg'),
//28
    MusicModel(
        title: 'Ranchhod Rangila',
        path: '',
        singer: 'Sabhiben Ahir',
        b_image:
            'https://i.scdn.co/image/ab67616d0000b273b4e00e829db130c698bed229',
        f_image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIIIfmAwytyHnwHv3gPuD9h3L58CjLgGHU3g&s'),
//29
    MusicModel(
        title: 'Mor Bani Thanghat Kare',
        path: '',
        singer: 'Ranveer & Deepika',
        b_image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeKsmNt8Dfd-Xg-DJibolIj4muME3Pz8KOAQ&s',
        f_image: 'https://i.ytimg.com/vi/xJsvTCMg0qA/maxresdefault.jpg'),
//30
    MusicModel(
        title: 'Pari Hu Main',
        path: '',
        singer: 'Falguni Pathak',
        b_image:
            'https://i.timesnowhindi.com/stories/Vasaldi_Song_By_Falguni_Pathak.png',
        f_image:
            'https://sosimg.sgp1.cdn.digitaloceanspaces.com/artist-gallery/5623709_1702279120.webp'),
//31
    MusicModel(
        title: 'Gori Tame Manda Lidha Mohi Raj',
        path: '',
        singer: 'Umesh Barot',
        b_image:
            'https://lyricsraag.com/wp-content/uploads/2023/10/Gori-Tame-Manda-Lidha-Mohi-Raj-Lyrics-Translation-Saiyar-Mori-Re.jpg',
        f_image:
            'https://c.saavncdn.com/blob/761/Gori-Tame-Manda-Lidha-Mohi-Raj-Gujarati-2022-20220721083823-500x500.jpg'),
//32
    MusicModel(
        title: 'Nagar Me Jogi Aaya',
        path: '',
        singer: 'Aditya Gadhvi',
        b_image:
            'https://sosimg.sgp1.cdn.digitaloceanspaces.com/artist-gallery/8649380_1702284485.webp',
        f_image: 'https://i.ytimg.com/vi/05ZqAFpEo8E/maxresdefault.jpg'),
//33
    MusicModel(
        title: 'GHOOMARIYU',
        path: '',
        singer: 'twinkal patel-Om Bariya"',
        b_image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_BJd6WMc9F-4P9fLhvyjUwqqUm81X_nn4gA&s',
        f_image:
            'https://c.saavncdn.com/039/Ghoomariyu-2-0-Gujarati-2022-20220104153727-500x500.jpg'),
//34
    MusicModel(
        title: 'Gujarati Mashup',
        path: '',
        singer: 'Herry Nakum',
        b_image:
            'https://i.scdn.co/image/ab67616d0000b2739201ec9b61c41380a2070267',
        f_image:
            'https://i1.sndcdn.com/artworks-GXhzbjP1N0edJprf-m1q2zA-t500x500.jpg'),
//35
    MusicModel(
        title: 'Dakla',
        path: '',
        singer: 'Rajesh Ahir',
        b_image:
            'https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/22/85/15/228515ab-b152-be36-1a3c-d039f005cc29/3616842558226.jpg/1200x1200bf-60.jpg',
        f_image:
            'https://c.saavncdn.com/226/Dakla-Gujarati-2020-20211207045821-500x500.jpg'),
//36
    MusicModel(
        title: 'Hanuman Chalisa',
        path: '',
        singer: 'Aditya Gadhvi',
        b_image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSie0vuy7lYxgRs1pIdobxmiYnY_rdajtoGZQ&s',
        f_image:
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhktukss-4EpH2AcLP1cEzu4TsIh8-A__JwHf32soDq671wSSKhj5mvl_XF0ySiET0TcGHvGE8zX9Bi2bXVTOyBZvj2Ji6v96Edoi220kdHZ62A0ZllDaPUvOLL8MLamMWjy6oMkrCW4CgHDy0m4uc9p-PPcp4CjdnTSsMCYgbNQ2bnBAo5ls6yL4eWRTg/w640-h592/%E0%A4%B9%E0%A4%A8%E0%A5%81%E0%A4%AE%E0%A4%BE%E0%A4%A8%20%E0%A4%9A%E0%A4%BE%E0%A4%B2%E0%A5%80%E0%A4%B8%E0%A4%BE.jpg'),
//37
    MusicModel(
        title: 'Tshe Sanedo',
        path: '',
        singer: 'Aariz Saiyed',
        b_image:
            'https://a10.gaanacdn.com/gn_img/song/7rVW1Rbk56/VW1eq4MBWk/size_m_1569594381.jpg',
        f_image:
            'https://a10.gaanacdn.com/gn_img/song/7rVW1Rbk56/VW1eq4MBWk/size_m_1569594381.jpg'),
  ];
  void init() {
    List<Audio> audioList = musicList.map(
      (e) {
        return Audio.network(
          e.path ?? "",
          metas: Metas(
            title: e.title,
          ),
        );
      },
    ).toList();
    audioPlayer.open(
      Playlist(audios: audioList, startIndex: musicList.length + 0),
      autoStart: false,
    );
  }

  // void changeIndex(int index) {
  //   currentIndex = index;
  // }

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
    // audioPlayer.next();
    // isPlaying = true;
    currentIndex++;
    playMusic(currentIndex);
    // if (currentIndex < musicList.length - 1) {
    //   currentIndex++;
    // } else {
    //   currentIndex = 0;
    // }
    notifyListeners();
  }

  void previousSong() {
    // audioPlayer.previous();
    // isPlaying = true;
    currentIndex--;
    playMusic(currentIndex);
    // if (currentIndex > 0) {
    //   currentIndex--;
    // } else {
    //   currentIndex = musicList.length - 1;
    // }
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

  // void chengeRepeat() {
  //   isRepeat = !isRepeat;
  //   notifyListeners();
  // }

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
