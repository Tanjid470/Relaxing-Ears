import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/controller/navigatorController.dart';

class PlayButton extends StatefulWidget {
  final String musicAddress;

  const PlayButton({Key? key, required this.musicAddress}) : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
  NavigatorController navigatorController = Get.find();
  //bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    musicPlayerController.player.onPlayerStateChanged.listen((state) async {
      if (state == PlayerState.playing) {
        setState(() {
          musicPlayerController.isPlaying = true;
        });

        // Get the duration of the music
        Duration? duration = await musicPlayerController.player.getDuration();

        // Schedule a timer to restart the music 1 second before it ends
        Timer.periodic(Duration(seconds: duration!.inSeconds - 1), (timer) {
          if (musicPlayerController.player.state == PlayerState.playing) {
            musicPlayerController.player.seek(Duration(seconds: 1));
          }
        });
      } else if (state == PlayerState.paused) {
        setState(() {
          musicPlayerController.isPlaying = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (musicPlayerController.isPlaying) {
          musicPlayerController.player.pause();
        } else {
         
          playMusicFromUrl(widget.musicAddress);
        }
      },
      child: Stack(
        children: [
          // The circle
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.secondary,
                  Color.fromARGB(103, 41, 45, 73),
                ],
              ),
            ),
          ),

          // The play/pause icon
          Container(
            height: 80,
            width: 80,
            child: Center(
              child: musicPlayerController.isPlaying
                  ? const Icon(Icons.pause, color: AppColors.accent, size: 32)
                  : Icon(Icons.play_arrow, color: AppColors.accent, size: 32),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> playMusicFromUrl(String musicAddress) async {
    try {
       Fluttertoast.showToast(
        msg: "loading",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
        backgroundColor: AppColors.primary
    );
      musicPlayerController.switchToPreloadedPlayer();
      await musicPlayerController.player.setSource(UrlSource(musicAddress));
      await musicPlayerController.player.setReleaseMode(ReleaseMode.loop);

      // Start playing
      await musicPlayerController.player.resume();
    } catch (e) {
      print('Error: $e');
    }
  }
}
