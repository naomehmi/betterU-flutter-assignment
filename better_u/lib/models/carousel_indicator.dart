import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color indicatorColor;
  final Color activeIndicatorColor;
  final double indicatorSize;
  final double spacing;

  const CarouselIndicator({
    required this.itemCount,
    required this.currentIndex,
    this.indicatorColor = Colors.grey,
    this.activeIndicatorColor = const Color.fromARGB(255, 226, 189, 255),
    this.indicatorSize = 8.0,
    this.spacing = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return Container(
          width: indicatorSize,
          height: indicatorSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex ? activeIndicatorColor : indicatorColor,
          ),
        );
      }),
    );
  }
}