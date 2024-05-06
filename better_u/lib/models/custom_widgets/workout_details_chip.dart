import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorkoutDetailChip extends StatelessWidget {
  WorkoutDetailChip({
    super.key,
    required this.icon,
    required this.text
  });

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            side: BorderSide(color: Colors.transparent)),
        label: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ));
  }
}
