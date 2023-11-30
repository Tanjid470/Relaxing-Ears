import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/screens/components/custom_Card.dart';

Expanded allMusicsListItems() {
  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
  return Expanded(
    child: Container(
 
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: musicPlayerController.images.length,
        itemBuilder: (context, index) {
          final key =
              musicPlayerController.images.keys.elementAt(index).toString();
          final value = musicPlayerController.images[key].toString();
          final musicsValue = musicPlayerController.musics[
                  musicPlayerController.musics.keys.elementAt(index).toString()]
              .toString();
          return MyCustomCardWidget(
            index: index,
            keys: key,
            value: value,
            musicsValue: musicsValue,
          );
        },
      ),
    ),
  );
}
