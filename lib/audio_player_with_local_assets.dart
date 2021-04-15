import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWithLocalAssets extends StatefulWidget {
  @override
  _AudioPlayerWithLocalAssetsState createState() => _AudioPlayerWithLocalAssetsState();
}

class _AudioPlayerWithLocalAssetsState extends State<AudioPlayerWithLocalAssets> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String path = 'audio.mp3';
  @override
  void initState() {
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState =s;
      });

    });
    playMusic();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  playMusic()async{
    await audioCache.play(path);
  }
  pauseMusic()async{
    await audioPlayer.pause();
  }
}
