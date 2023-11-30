import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/favoritesController.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/screens/components/custom_Card.dart';

Expanded favoriteMusicList() {
  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
  FaveritesController faveritesController = Get.put(FaveritesController());
  return Expanded(
    child: Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: faveritesController.favoriteList.length,
        itemBuilder: (context, index) {
          final favoritelistIndex =faveritesController.favoriteList.elementAt(index);
          final key = musicPlayerController.images.keys.elementAt(favoritelistIndex).toString();
          final value = musicPlayerController.images[key].toString();
          final musicsValue = musicPlayerController.musics[musicPlayerController.musics.keys.elementAt(favoritelistIndex).toString()].toString();
          return MyCustomCardWidget(
            index: favoritelistIndex,
            keys: key,
            value: value,
            musicsValue: musicsValue,
          );
        },
      ),
    ),
  );
}
