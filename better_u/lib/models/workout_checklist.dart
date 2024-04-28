import 'package:better_u/screens/playVideo.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class WorkoutChecklist extends StatefulWidget {
  const WorkoutChecklist({super.key, required this.videos});

  final List videos;

  @override
  State<WorkoutChecklist> createState() => _WorkoutChecklistState();
}

class _WorkoutChecklistState extends State<WorkoutChecklist> {
  @override
  Widget build(BuildContext context) {
    double oneCheckBoxHeight = (MediaQuery.of(context).size.width + 52) * 9/16; 
    double completedHeight = 38;
    int done = widget.videos.where((e) => e["completed"]).length;
    int notDone = widget.videos.length - done;
    double checkHeight = notDone * (oneCheckBoxHeight) + done * completedHeight;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Container(
            width: 2,
            height: checkHeight,
            color: Colors.grey,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...widget.videos.map((e) {
              return Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      visualDensity: const VisualDensity(horizontal: -4),
                      value: e["completed"],
                      onChanged: (val) {
                        setState(() {
                          e["completed"] = val!;
                        });
                      },
                      checkColor: const Color.fromARGB(255, 139, 93, 175),
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        // print(states);
                        if (states.contains(MaterialState.selected)) {
                          return Colors.purple[200]!;
                        }
                        return Colors.white;
                      }),
                    ),
                  ),
                  if (!e["completed"])
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PlayVideo(video: e)));
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
                                                Color.fromARGB(
                                                    255, 241, 230, 130),
                                                Color.fromARGB(
                                                    255, 204, 161, 237)
                                              ]),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        e["coverImage"],
                                        fit: BoxFit.cover,
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(e["title"], style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                  ),),
                                  Row(
                                    children: [
                                      const Icon(Icons.track_changes, size: 15,),
                                      const SizedBox(width: 10,),
                                      Text(e["cat"], style: const TextStyle(fontSize: 13),)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ]))),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width - 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                e["title"],
                                style: const TextStyle(fontSize: 16),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            const Chip(
                              color: MaterialStatePropertyAll(Color(0xFF8B5DAF)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              label: Text("Completed!", style: TextStyle(color: Colors.white),))
                          ],
                        ),
                      ),
                    )
                ],
              );
            })
          ],
        )
      ],
    );
  }
}
