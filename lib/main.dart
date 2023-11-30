import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musicapp/controller/favoritesController.dart';
import 'package:musicapp/screens/Splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var favoriteMusic = await Hive.openBox('favMusic');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FaveritesController faveritesController = Get.put(FaveritesController());
  @override
  void initState() {
    super.initState();
    // Call your onInit function here or perform initialization tasks
    onInit();
  }

  void onInit() async {
    await faveritesController.favoriteList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
     //   scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.quicksand().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      home: const SplashScreen(),
    );
  }
}
