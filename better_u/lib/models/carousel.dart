import 'package:flutter/material.dart';

class ContainImage extends StatelessWidget {
  final String imagePath;

  const ContainImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.asset(
          imagePath,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          fit: BoxFit.cover,
        );
      },
    );
  }
}