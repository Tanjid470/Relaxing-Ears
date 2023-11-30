import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/moodmusicController.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/controller/navigatorController.dart';
import 'package:musicapp/screens/Home/Widget/music_list.dart';
import 'package:musicapp/screens/components/custom_AppBAr.dart';
import 'package:musicapp/screens/components/grid_Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = TextEditingController();
  NavigatorController navigatorController = Get.put(NavigatorController());
  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
  MoodMusicController moodMusicController = Get.put(MoodMusicController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          // color: AppColors.bgcolor,
          decoration: BoxDecoration(
            gradient: AppColors.bgGradient,
          ),
          child: Column(
            children: [
              customAppBar(1),
              Container(
                height: 170,
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moodMusicController.images.length,
                  itemBuilder: (context, index) {
                    final key = moodMusicController.images.keys
                        .elementAt(index)
                        .toString();
                    final value = moodMusicController.images[key].toString();

                    return Grid(
                      index: index,
                      keys: key,
                      value: value,
                    );
                  },
                  addAutomaticKeepAlives: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ListTile(
                title: Text(
                  "Daily music",
                  style: TextStyle(fontSize: 30, color: Color(0XFF917FB3)),
                ),
                leading: Icon(
                  Icons.line_weight_outlined,
                  size: 30,
                  color: Color(0XFF917FB3),
                ),
                trailing: Icon(
                  Icons.play_circle,
                  size: 35,
                  color: Color(0XFF917FB3),
                ),
              ),
              Expanded(child: allMusicsListItems())
            ],
          ),
        ),
      ),
    );
  }

 
}
