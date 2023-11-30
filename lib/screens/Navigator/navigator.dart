import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/navigatorController.dart';
import 'package:musicapp/screens/Home/home.dart';
import 'package:musicapp/screens/Library/library.dart';
import 'package:musicapp/screens/MusicPlayer/music_player.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  NavigatorController navigatorController=Get.put(NavigatorController());
  
  void onTapped(int index) {
    setState(() {
      navigatorController.selectedindex = index;
    });
    navigatorController.pageController.jumpToPage(index);
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Center(child: Text("Bottom Navigation"))),
      body: PageView(
        controller: navigatorController.pageController,
        children: const [
         
          HomePage(),
          Library(),
          MusicPlayer()   
        ],
        onPageChanged: onTapped,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
 
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                   BottomNavigationBarItem(icon: Icon(Icons.queue_music), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: ''),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.add_box_outlined), label: 'Add'),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: navigatorController.selectedindex,
        unselectedItemColor: Color(0XFF917FB3),
        selectedIconTheme: const IconThemeData(color: Color(0XFFFDE2F3)),
        backgroundColor: AppColors.primary,
        iconSize: 35,
        onTap: onTapped,
      ),
    );
  }
}
