import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.itemCount,
    required this.indicatorIdx,
    this.indicatorColor = Colors.grey,
    this.activeIndicatorColor = const Color.fromARGB(255, 226, 189, 255),
    this.indicatorSize = 8,
    this.spacing = 5
  });

  final int itemCount;
  final int indicatorIdx;
  final Color indicatorColor;
  final Color activeIndicatorColor;
  final double indicatorSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) => Container(
        width: indicatorSize,
        height: indicatorSize,
        margin: EdgeInsets.symmetric(horizontal: spacing/2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == indicatorIdx ? activeIndicatorColor : indicatorColor
        ),
      )),
    );
  }
}