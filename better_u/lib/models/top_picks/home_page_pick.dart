import 'package:better_u/models/top_picks/top_picks_programs.dart';
import 'package:better_u/models/top_picks/top_videos.dart';
import 'package:better_u/screens/content/videos/play_video.dart';
import 'package:better_u/screens/content/programs/workout_program_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePagePickTemplate extends StatelessWidget {
  HomePagePickTemplate({
    super.key,
    required this.title,
    required this.nextRoute,
    required this.height,
    required this.content,
    required this.type,
  });

  String title;
  String nextRoute;
  double height;
  List content;
  String type;

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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black
                ),
                child: Text(
                  title,
                ),
              ),
              OutlinedButton(
                onPressed: (){
                  Navigator.pushNamed(context, nextRoute);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  side: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 224, 186, 253),
                  )
                ),
                child: const Text(
                  "view all",
                  style: TextStyle(
                    color: Color.fromARGB(255, 224, 186, 253) 
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
            children: [...content.map(
              (e) => GestureDetector(
                onTap: () {
                  if(type == "video") {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PlayVideo(video: e,)));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutProgramChecklist(program: e)));
                  }
                },
                child: type == "program" ? 
                TopPicksCard(program: e) : 
                TopVideos(video: e),
              )
            )],  
          ),
        )
      ],
    );
  }
}