import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/controller/moodmusicController.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/controller/navigatorController.dart';
import 'package:musicapp/screens/Home/Widget/mood_music_page.dart';

class Grid extends StatefulWidget {
  final int index;
  final String keys;
  final String value;

  Grid({
    Key? key,
    required this.index,
    required this.value,
    required this.keys,
  }) : super();

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  NavigatorController navigatorController = Get.put(NavigatorController());

  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
      MoodMusicController moodMusicController=Get.put(MoodMusicController());

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
                    onTap: () {
                      moodMusicController.selectedIndex=widget.index.obs;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MoodMusic()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 100,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: const Color(0XFFFDE2F3).withOpacity(.5),
                              width: 5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35)),
                          image:  DecorationImage(
                              image: AssetImage(widget.keys), fit: BoxFit.cover)),
                      child:  Center(
                          child: Text(
                        widget.value,
                        style: const TextStyle(
                            fontSize: 45,
                            color: Color(0XFFFDE2F3),
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                  );
  }
}
