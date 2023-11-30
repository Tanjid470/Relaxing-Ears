import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/constants/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/controller/navigatorController.dart';

class MyCustomCardWidget extends StatefulWidget {
  final int index;
  final String keys;
  final String value;
  final String musicsValue;

  MyCustomCardWidget({
    Key? key,
    required this.index,
    required this.value,
    required this.keys,
    required this.musicsValue,
  }) : super();

  @override
  State<MyCustomCardWidget> createState() => _MyCustomCardWidgetState();
}

class _MyCustomCardWidgetState extends State<MyCustomCardWidget> {
  NavigatorController navigatorController = Get.put(NavigatorController());

  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: 80,
      decoration: BoxDecoration(
          color: AppColors.secondcolor.withOpacity(.1),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2,
                color: Colors.white,
                offset: Offset(0, 0),
                blurStyle: BlurStyle.outer),
          ]),
      child: GestureDetector(
        onTap: () {
          setState(() {
            navigatorController.selectedindex = 2;
            musicPlayerController.pointer = widget.index;
            musicPlayerController.player.pause();
          });
          navigatorController.pageController
              .jumpToPage(navigatorController.selectedindex);
        },
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 35, // Set the radius to control the size
              backgroundImage: AssetImage(widget.keys), // Set the image
            ),
            title: Text(
              widget.value,
              style: HeadText(AppColors.tertiary, 20.0),
            ),
            subtitle: Text(
              widget.musicsValue,
              style: Head20Text(AppColors.secondary, 17),
            ),
          ),
        ),
      ),
    );
  }
}
