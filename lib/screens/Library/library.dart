import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/favoritesController.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/screens/Home/Widget/music_list.dart';
import 'package:musicapp/screens/Library/Widgets/favorite_music_list.dart';
import 'package:musicapp/screens/components/custom_AppBAr.dart';
import 'package:musicapp/screens/components/custom_SearchBar.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> with TickerProviderStateMixin {
  TextEditingController searchcontroller = TextEditingController();
  late TabController tabController; // Declare tabController

  late MusicPlayerController musicPlayerController;
  late FaveritesController favoritesController;

  @override
  void initState() {
    super.initState();
    setState(() {
      tabController = TabController(length: 2, vsync: this);
      // Initialize controllers inside initState
      musicPlayerController = Get.put(MusicPlayerController());
      favoritesController = Get.put(FaveritesController());
    });
  }

  @override
  void dispose() {
    // Dispose controllers when the State is disposed
    musicPlayerController.dispose();
    favoritesController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: const CustomFloatingActionButton(),
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.bgGradient),
          child: Column(
            children: [
              customAppBar(2),
              CustomTextField(
                  hintText: "Search musics....",
                  controller: searchcontroller,
                  icon: Icons.search,
                  color: AppColors.secondcolor),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                  controller: tabController,
                  indicatorColor: AppColors.secondcolor,
                  indicatorWeight: 2,
                  isScrollable: true,
                  tabs: const <Widget>[
                    Text("All Music",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Favorites",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ]),
              Expanded(
                child: TabBarView(controller: tabController, children: <Widget>[
                  allMusicsListItems(),
                  favoriteMusicList(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
