import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/controller/navigatorController.dart';
import 'package:musicapp/screens/MusicPlayer/Widget/UpperLayer/music_image.dart';
import 'package:musicapp/screens/components/alert_box.dart';

Container upperLayer(BuildContext context) {
  MusicPlayerController musicPlayerController = Get.put(MusicPlayerController());
  NavigatorController navigatorController = Get.put(NavigatorController());
  return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: [
          SizedBox(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    navigatorController.selectedindex = 1;
                    navigatorController.pageController
                        .jumpToPage(navigatorController.selectedindex);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 30,
                    color: AppColors.accent,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    alert_dialog(context);
                  },
                  icon: const Icon(
                    Icons.download_rounded,
                    size: 30,
                    color: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
          //------- Image, text
         Container(
          height: MediaQuery.of(context).size.height/2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [        
                 const SizedBox(height: 10,) ,MusicImage(
              imageUrl: musicPlayerController.images.keys
                  .elementAt(musicPlayerController.pointer)
                  .toString()),
          const SizedBox(
            height: 25,
          ),
          // Music Title
          Text(
            musicPlayerController.images[musicPlayerController.images.keys
                    .elementAt(musicPlayerController.pointer)
                    .toString()]
                .toString(),
            style: AppColors.headerText.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(
            musicPlayerController.musics[musicPlayerController.musics.keys
                    .elementAt(musicPlayerController.pointer)
                    .toString()]
                .toString(),
            textAlign: TextAlign.center,
            style: AppColors.subTitleText,
          )
            ],
          ),
         )
        ],
      ));
}







