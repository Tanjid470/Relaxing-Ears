

import 'package:flutter/material.dart';
import 'package:musicapp/constants/app_colors.dart';
import 'package:musicapp/constants/textStyle.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // Add your action here
      },
      backgroundColor:AppColors.secondcolor,

      label: Text(
        'Ask for a music',
        style: Head20Text(AppColors.black, 25.0),
      ),
    );
  }
}

