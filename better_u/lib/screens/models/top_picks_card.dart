import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TopPicksCard extends StatelessWidget {
  TopPicksCard({super.key,
  required this.coverImage,
  required this.days,
  required this.interval,
  required this.title
  });

  String coverImage;
  int days;
  String interval;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 300,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: const GradientBoxBorder(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 241, 230, 130),
                  Color.fromARGB(255, 204, 161, 237)
                ]),
            width: 2),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                coverImage,
                fit: BoxFit.cover,
                width: 170,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$days days",
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.schedule, size: 20, color: Colors.grey),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("$interval mins/day", style: const TextStyle(fontSize: 12))
                    ],
                  ),
                ],
              ),
            ),
            Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}
