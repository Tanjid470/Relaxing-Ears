 import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/navigatorController.dart';

Container customAppBar(int route) {
  NavigatorController navigatorController=Get.put(NavigatorController());
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedTextKit(repeatForever: true, animatedTexts: [
              ColorizeAnimatedText('RELAXING EARS',
                  textStyle: const TextStyle(
                      color: AppColors.offpink,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  colors: [
                    AppColors.offpink,
                    AppColors.primary,
                  ],
                  speed: const Duration(seconds: 3))
            ]),
            IconButton(
                onPressed: () {
                  navigatorController.selectedindex = route;
                  navigatorController.pageController
                      .jumpToPage(navigatorController.selectedindex);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.offpink,
                  size: 25,
                ))
          ],
        )
        );
  }