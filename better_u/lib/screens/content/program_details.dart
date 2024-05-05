import 'package:better_u/data/all_programs.dart';
import 'package:better_u/data/all_videos.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ProgramDetails extends StatefulWidget {
  ProgramDetails({super.key, required this.programId, required this.day});

  int programId;
  int day;

  @override
  State<ProgramDetails> createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  @override
  Widget build(BuildContext context) {
    List thisDayVideos = AllPrograms()
        .programs[widget.programId - 1]
        .workouts[widget.day - 1]
        .keys
        .toList();
    return Column(
      children: [
        ...thisDayVideos.map((e) => TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.05,
          startChild: Container(color: Colors.amber,),
              endChild: Container(
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
            ))
      ],
    );
//     return SizedBox(
//       height: ((MediaQuery.of(context).size.width - 100) * 9 / 16 + 150) *
//           thisDayVideos.length,
//       child: FixedTimeline.tileBuilder(
//         builder: TimelineTileBuilder.fromStyle(
//           indicatorStyle: IndicatorStyle.outlined,
//           itemExtent: ,
//           itemCount: thisDayVideos.length,
//           contentsAlign: ContentsAlign.basic,
//           contentsBuilder: (context, index) => Container(
//               width: (MediaQuery.of(context).size.width - 100),
//               margin: const EdgeInsets.all(10),
//               child: Card(
//                   shadowColor: Colors.transparent,
//                   semanticContainer: true,
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   margin: const EdgeInsets.all(0),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             border: const GradientBoxBorder(
//                                 gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                     colors: [
//                                       Color.fromARGB(255, 241, 230, 130),
//                                       Color.fromARGB(255, 204, 161, 237)
//                                     ]),
//                                 width: 2),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(15),
//                             child: Image.asset(
//                               AllVideos()
//                                   .videos[
//                                       thisDayVideos.keys.toList()[index] -
//                                           1]
//                                   .coverImage,
//                               fit: BoxFit.cover,
//                               width:
//                                   (MediaQuery.of(context).size.width - 100),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           AllVideos()
//                               .videos[
//                                   thisDayVideos.keys.toList()[index] - 1]
//                               .title,
//                           style: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w500),
//                         ),
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.track_changes,
//                               size: 15,
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               AllVideos()
//                                   .videos[
//                                       thisDayVideos.keys.toList()[index] -
//                                           1]
//                                   .cat,
//                               style: const TextStyle(fontSize: 13),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         )
//                       ])),
//             )),
//     theme: TimelineTheme.of(context).copyWith(
//       nodePosition: 0,
//     ),
//   ),
// );
  }
}
