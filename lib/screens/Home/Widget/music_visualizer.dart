

import 'package:flutter/material.dart';
import 'package:musicapp/constants/app_colors.dart';

// ignore: must_be_immutable
class MusicVisualizer extends StatelessWidget {
  List<Color> colors = [
    Colors.blueAccent,
    AppColors.offpink,
    Colors.redAccent,
    Colors.yellowAccent
  ];
  List<int> duration = [900, 700, 600, 800, 500];

  MusicVisualizer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.primary,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List<Widget>.generate(
              30,
              (index) => VisualComponent(
                    duration: duration[index % 5],
                    color: colors[index % 4],
                  ))),
    );
  }
}

class VisualComponent extends StatefulWidget {
  const VisualComponent({required this.duration, required this.color})
      : super(key: null);
  final int duration;
  final Color color;

  @override
  State<VisualComponent> createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    final curveAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInExpo);
    animation = Tween<double>(begin: 0, end: 100).animate(curveAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
  }
  
  @override
  void dispose() {
    // Dispose of the animation controller when the widget is removed
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      height: animation.value/2,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(5)),
    );
  }
}
