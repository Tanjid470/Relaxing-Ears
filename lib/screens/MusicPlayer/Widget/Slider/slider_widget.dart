import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/controller/musicplayerController.dart';
import 'package:musicapp/screens/MusicPlayer/Widget/Slider/utils.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double progressVal = 0;
  MusicPlayerController musicPlayerController =
      Get.put(MusicPlayerController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return SweepGradient(
                startAngle: 90.0,
                endAngle: degToRad(184),
                colors: [
                  const Color.fromARGB(255, 33, 243, 138),
                  const Color.fromARGB(255, 206, 40, 40).withAlpha(50)
                ],
                stops: [progressVal, progressVal],
                transform: GradientRotation(
                  degToRad(178),
                ),
              ).createShader(rect);
            },
          ),
          //Circle
          Center(
            child: Container(
              width: kDiameter - 120,
              height: kDiameter - 120,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.offpink,
                    width: 10,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 25,
                        color: AppColors.offpink.withAlpha(
                            normalize(progressVal * 20000, 100, 255).toInt()),
                        offset: const Offset(1, 3))
                  ]),
              //Mini circle
              child: SleekCircularSlider(
                min: kMinDegree,
                max: kMaxDegree,
                initialValue: 0,
                appearance: CircularSliderAppearance(
                  startAngle: 270,
                  angleRange: 360,
                  customWidths: CustomSliderWidths(
                    trackWidth: 5,
                    shadowWidth: 10,
                    progressBarWidth: 01,
                    handlerSize: 10,
                  ),
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    progressBarColor: Colors.transparent,
                    trackColor: Colors.transparent,
                    dotColor: AppColors.offpink,
                  ),
                ),
                onChange: (value) {
                  setState(() {
                    progressVal = normalize(value, kMinDegree, kMaxDegree);
                  });
                },
                innerWidget: (percentage) {
                  musicPlayerController.timerSet = percentage.toInt();
                  return Center(
                    child: Text(
                      '${percentage?.toInt()} min',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.offpink),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
