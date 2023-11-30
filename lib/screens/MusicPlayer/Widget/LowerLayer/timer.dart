import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/constants/textStyle.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/screens/MusicPlayer/Widget/Slider/slider_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> timer(BuildContext context) {
  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return Container(
        child: AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: AppColors.primary,
          content: SingleChildScrollView(
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                child: SliderWidget(),
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    print(musicPlayerController.timerSet.toInt());

                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //   content: Center(child: Text('Time Set',style: Head20Text(Colors.blue, 12),)),
                    //   duration: const Duration(milliseconds: 1000),
                    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    // ));
                   
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFF917FB3), // Set the background color here
                  ),
                  child: Text('Set', style: Head20Text(AppColors.offpink, 21))),
            )
          ],
        ),
      );
    },
  );
}
