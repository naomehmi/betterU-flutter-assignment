import 'package:better_u/models/top_picks/top_picks_programs.dart';
import 'package:better_u/models/top_picks/top_videos.dart';
import 'package:better_u/screens/content/videos/play_video.dart';
import 'package:better_u/screens/content/programs/workout_program_checklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePagePickTemplate extends StatelessWidget {
  HomePagePickTemplate({
    Key? key,
    required this.title,
    required this.nextRoute,
    required this.height,
    required this.content,
    required this.type,
    required this.textColor, 
  });

  final String title;
  final String nextRoute;
  final double height;
  final List content;
  final String type;
  final Color textColor; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: textColor,
                ),
                child: Text(
                  title,
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, nextRoute);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  side: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 224, 186, 253),
                  ),
                ),
                child: const Text(
                  "view all",
                  style: TextStyle(
                    color: Color.fromARGB(255, 224, 186, 253),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...content.map(
                (e) => GestureDetector(
                  onTap: () {
                    if (type == "video") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlayVideo(video: e,)));
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutProgramChecklist(program: e)));
                    }
                  },
                  child: type == "program" ? TopPicksCard(program: e) : TopVideos(video: e),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
