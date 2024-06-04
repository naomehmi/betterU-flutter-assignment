import 'package:better_u/data/all_programs.dart';
import 'package:better_u/data/all_videos.dart';
import 'package:better_u/screens/content/videos/play_video.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ProgramDetails extends StatefulWidget {
  const ProgramDetails({super.key, required this.programId, required this.day});

  final int programId;
  final int day;

  @override
  State<ProgramDetails> createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  @override
  Widget build(BuildContext context) {
    List thisDayVideos =
        AllPrograms().programs[widget.programId - 1].workouts[widget.day - 1];
    Map<int, Map<int, Set<int>>> completedByUser =
        Provider.of<UserManagement>(context).loggedInUser.completedWorkouts;

    if (completedByUser.keys.firstWhere(
            (element) => element == widget.programId,
            orElse: () => 0) ==
        0) completedByUser[widget.programId] = {};

    return Column(
      children: [
        ...thisDayVideos.map((e) {
          bool thisDayDone =
              completedByUser[widget.programId]!.keys.contains(widget.day);
          if (!thisDayDone) {
            completedByUser[widget.programId]![widget.day] = {};
          }
          Set<int> thisWorkout =
              completedByUser[widget.programId]![widget.day]!;
          return TimelineTile(
            afterLineStyle: LineStyle(color: Colors.grey[300]!),
            beforeLineStyle: LineStyle(color: Colors.grey[300]!),
            indicatorStyle: IndicatorStyle(
                indicator: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.isEmpty) {
                    return Colors.white;
                  }
                  return Colors.purple[200]!;
                }),
                shape: const CircleBorder(),
                side: BorderSide(color: Colors.grey[300]!, width: 2),
                value:
                    completedByUser[widget.programId]![widget.day]?.contains(e),
                onChanged: (value) {
                  setState(() {
                    thisWorkout.contains(e)
                        ? thisWorkout.remove(e)
                        : thisWorkout.add(e);
                  });
                },
              ),
            )),
            isFirst: thisDayVideos.indexOf(e) == 0,
            isLast: thisDayVideos.indexOf(e) == thisDayVideos.length - 1,
            alignment: TimelineAlign.manual,
            lineXY: 0.05,
            endChild: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayVideo(video: AllVideos().videos.firstWhere((element) => element.id == e))));
              },
              child: Container(
                  width: (MediaQuery.of(context).size.width - 100),
                  margin: const EdgeInsets.all(10),
                  child: Card(
                      shadowColor: Colors.transparent,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: const EdgeInsets.all(0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  AllVideos().videos[e - 1].coverImage,
                                  fit: BoxFit.cover,
                                  width:
                                      (MediaQuery.of(context).size.width - 100),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              AllVideos().videos[e - 1].title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.track_changes,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  AllVideos().videos[e - 1].cat,
                                  style: const TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ]))),
            ),
          );
        })
      ],
    );
  }
}
