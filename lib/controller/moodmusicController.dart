
import 'package:get/get.dart';
import 'package:musicapp/constants/app_image.dart';
import 'package:musicapp/constants/app_music.dart';

class MoodMusicController extends GetxController {


  Map<String, String> images = {
    AppImage.sleeping: 'Sleeping',
    AppImage.study: 'Study',
    AppImage.relaxing: 'Relaxing'
  };
  List<String> musics = [
    AppMusic.peacefulPiano,
    AppMusic.restfulRhythms,
    AppMusic.peacefulNature
  ];
  RxInt selectedIndex = 0.obs;

}
