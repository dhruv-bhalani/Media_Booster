import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class MediaProvider extends ChangeNotifier {
  bool isPlaying = false;
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  Duration liveDuration = Duration(seconds: 0);
  Duration totalDuration = Duration(seconds: 0);
  MediaProvider() {
    init();
    getMusicDuration();
    getLiveDuration();
  }
  List<Audio> music = [
    Audio.network(
        "https://pagalfree.com/musics/128-Aayi Nai - Stree 2 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/musics/128-Bhool Bhulaiyaa 3 - Title Track (Feat. Pitbull) - Bhool Bhulaiyaa 3 128 Kbps.mp3"),
    Audio.network(
        "https://pagalfree.com/download/320-Mere Mehboob Mere Sanam - Bad Newz 320 Kbps.mp3"),
    Audio.network(
      "https://pagalfree.com/musics/128-Ae Dil Hai Mushkil - Title Track (Feat. Badshah) - Ae Dil Hai Mushkil 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Dilbar - Title Track (Feat. Badshah) - Dilbar 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/download/320-Tauba Tauba - Bad Newz 320 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Halki Halki Si - Asees Kaur 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Satyanaas - Chandu Champion 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Zaalim - Badshah 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Aaj Ki Raat - Stree 2 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Khaali Botal - Manan Bhardwaj 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Pushpa Pushpa - Pushpa 2 The Rule 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Pyaar Ka Punchnama - Badshah 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Saandana - Badshah 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Tera Baap - Badshah 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Zara Zara - Badshah 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Khudaya - Sarfira 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Hauli Hauli - Khel Khel Mein 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Galti - Vishal Mishra 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Singham Again Title Track - Singham Again 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Meri Meri - Badshah 128 Kbps.mp3",
    ),
    Audio.network(
      "https://pagalfree.com/musics/128-Khuda Hafiz - Title Track (Feat. Badshah) - Khuda Hafiz 128 Kbps.mp3",
    ),
  ];
  void init() {
    audioPlayer.open(
      Playlist(audios: music),
      autoStart: false,
    );
    isPlaying = true;
    notifyListeners();
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
    audioPlayer.next();
    isPlaying = true;
    notifyListeners();
  }

  void previousSong() {
    audioPlayer.previous();
    isPlaying = true;
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
}
