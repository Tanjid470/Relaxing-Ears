

import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/constants/textStyle.dart';
import 'package:musicapp/controller/favoritesController.dart';
import 'package:musicapp/screens/Navigator/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  //   Timer(const Duration(seconds: 1), () { 
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomNavigationWidget()));
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash:  Icon(Icons.music_note,color: AppColors.offpink,size: 100,), 
        splashIconSize: 100,
        duration: 100,
        animationDuration: Duration(seconds: 2),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: AppColors.primary,
        nextScreen:const BottomNavigationWidget(), 
      )
    );
  }
}