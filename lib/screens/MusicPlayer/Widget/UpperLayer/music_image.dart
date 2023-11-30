import 'package:flutter/material.dart';

class MusicImage extends StatelessWidget {
  final String imageUrl;

  const MusicImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(81, 145, 127, 179),
          width: 20.0,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color.fromARGB(82, 229, 190, 236),
            width: 10.0,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipOval(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}