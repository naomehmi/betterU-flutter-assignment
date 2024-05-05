import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) => Image.asset(
      path,
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      fit: BoxFit.cover,
    ));
  }
}