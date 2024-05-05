import 'package:better_u/models/objects/video.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TopVideos extends StatelessWidget {
  TopVideos({super.key, required this.video});

  Video video;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              video.coverImage,
              fit: BoxFit.cover,
              width: 320,
              height: 180,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.track_changes,
                        size: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(video.cat, style: const TextStyle(fontSize: 12)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.schedule,
                        size: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(video.time, style: const TextStyle(fontSize: 12))
                    ]),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      video.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    )
                  ]))
        ]),
      ),
    );
  }
}
