import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodaysExercise extends StatelessWidget {
  TodaysExercise({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  IconData icon;
  String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width / 2 - 30,
        color: color!.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 35,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
