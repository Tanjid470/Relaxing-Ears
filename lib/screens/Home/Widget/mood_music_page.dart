import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/moodmusicController.dart';

import 'package:musicapp/screens/Home/Widget/music_visualizer.dart';

class MoodMusic extends StatefulWidget {
  const MoodMusic({super.key});

  @override
  State<MoodMusic> createState() => _MoodMusicState();
}

class _MoodMusicState extends State<MoodMusic> {
  MoodMusicController moodMusicController = Get.put(MoodMusicController());
  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    // Load audio file here using audioPlayer
    loadAudio();
  }

  Future<void> loadAudio() async {
      await audioPlayer.setSource(UrlSource(moodMusicController.musics[moodMusicController.selectedIndex.value]));
  }

  Future<void> playPause() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 20;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: playPause,
          //backgroundColor: const Color.fromARGB(255, 229, 171, 240),
          child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        ),
        appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: const Text(""
                // moodMusicController.images[moodMusicController.images.keys
                //         .elementAt(moodMusicController.selectedIndex.value)
                //         .toString()]
                //     .toString(),
                )),
        body: Column(
          children: [
            SizedBox(
              height: 2 * height / 3,
              child: Stack(
                children: [
                  Container(),
                  Container(
                    height: 2 * height / 3,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      image: DecorationImage(
                        image: AssetImage(moodMusicController.images.keys
                            .elementAt(moodMusicController.selectedIndex.value)
                            .toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    top: height / 10,
                    left: width / 5,
                    child: Container(
                      width: width / 1.6,
                      height: height / 2.8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 199, 184, 184),
                          width: 5,
                        ),
                        image: DecorationImage(
                          image: AssetImage(moodMusicController.images.keys
                              .elementAt(
                                  moodMusicController.selectedIndex.value)
                              .toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 200,
                      left: 0,
                      child: Container(
                        height: 100,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            Expanded(child: MusicVisualizer())
          ],
        ),
      ),
    );
  }
}
