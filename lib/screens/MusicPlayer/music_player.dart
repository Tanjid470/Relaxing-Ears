import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/favoritesController.dart';
import 'package:musicapp/screens/MusicPlayer/Widget/LowerLayer/timer.dart';
import 'package:musicapp/screens/MusicPlayer/Widget/UpperLayer/upper_layer.dart';
import 'package:musicapp/screens/MusicPlayer/Widget/LowerLayer/play_buttom.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/controller/navigatorController.dart';
import 'package:musicapp/screens/components/alert_box.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
  NavigatorController navigatorController = Get.put(NavigatorController());
  FaveritesController faveritesController = Get.put(FaveritesController());
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppColors.bgGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //-------- upper half
              upperLayer(context),
              //------- Player
              Expanded(child: playerLayer(context))
            ],
          ),
        ),
      ),
    );
  }

  Container playerLayer(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //---------Music Features
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (faveritesController.favoriteList
                        .contains(musicPlayerController.pointer)) {
                      faveritesController
                          .favOneDelete(musicPlayerController.pointer);
                    } else {
                      faveritesController
                          .favoAdded(musicPlayerController.pointer);
                    }
                    print(faveritesController.favoriteList);
                  });
                },
                child: IconWithTitle(
                    icon: faveritesController.favoriteList
                            .contains(musicPlayerController.pointer)
                        ? CupertinoIcons.heart_solid
                        : CupertinoIcons.heart,
                    title: "Favorites"),
              ),
              GestureDetector(
                  onTap: () {
                     alert_dialog(context);
                    //timer(context);
                  },
                  child: const IconWithTitle(
                      icon: CupertinoIcons.clock, title: "Timer")),
              GestureDetector(
                onTap: () => alert_dialog(context),
                child: const IconWithTitle(
                    icon: CupertinoIcons.add, title: "Add\nSounds"),
              ),
            ],
          ),

          const SizedBox(
            height: 35,
          ),

          //---------Music Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (musicPlayerController.pointer >= 1 &&
                        musicPlayerController.pointer <=
                            musicPlayerController.images.length) {
                      musicPlayerController.player.pause();
                      musicPlayerController.isPlaying = false;
                      musicPlayerController.pointer -= 1;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("out of limit")));
                    }
                  });
                },
                child:const Icon(Icons.skip_previous_rounded,size: 50,color: AppColors.offpink,)
                // const Image(
                //     image: AssetImage(
                //         "assets/image/musicController/Previous.png")),
              ),

//                    Play Music
              PlayButton(
                musicAddress: musicPlayerController.musics.keys
                    .elementAt(musicPlayerController.pointer)
                    .toString(), //works
              ),
//
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (musicPlayerController.pointer >= 0 &&
                        musicPlayerController.pointer <
                            musicPlayerController.images.length - 1) {
                      musicPlayerController.player.pause();
                      musicPlayerController.isPlaying = false;
                      musicPlayerController.pointer += 1;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("out of limit")));
                    }
                  });
                },
                child:const Icon(Icons.skip_next_rounded,size: 50,color: AppColors.offpink,)
                // const Image(
                //     image: AssetImage("assets/image/musicController/Next.png")),
              )
            ],
          )
        ],
      ),
    );
  }
}

class IconWithTitle extends StatelessWidget {
  final String title;
  final IconData? icon;
  const IconWithTitle({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.tertiary,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(color: AppColors.secondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
