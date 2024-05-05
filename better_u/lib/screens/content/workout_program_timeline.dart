import 'package:better_u/models/objects/program.dart';
import 'package:better_u/screens/content/program_details.dart';
import 'package:flutter/material.dart';

class WorkoutProgramChecklist extends StatefulWidget {
  WorkoutProgramChecklist({
    super.key,
    required this.program
  });

  WorkoutProgram program;
  int _currentDay = 1;

  @override
  State<WorkoutProgramChecklist> createState() => _WorkoutProgramChecklistState();
}

class _WorkoutProgramChecklistState extends State<WorkoutProgramChecklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.program.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.program.coverImage,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    children: [
                      Chip(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              side: BorderSide(color: Colors.transparent)),
                          label: Row(
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
                                "${widget.program.days} days",
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Chip(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)),
                            side: BorderSide(color: Colors.transparent)),
                        label: Row(
                          children: [
                            const Icon(Icons.schedule,
                                size: 20, color: Colors.grey),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${widget.program.interval} mins/day",
                                style: const TextStyle(fontSize: 12))
                          ],
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.program.desc),
                  SizedBox(
                    height: 65,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 1; i <= widget.program.workouts.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                                label: Text("Day $i"),
                                selected:widget._currentDay == i,
                                onSelected: (val) {
                                  setState(() {
                                    widget._currentDay = i;
                                  });
                                }),
                          )
                      ],
                    ),
                  ),
                  Text(
                    "Day ${widget._currentDay}'s Workout ${widget.program.workouts[widget._currentDay - 1] == 0 ? ' (Rest Day)' : ''}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if(widget.program.workouts[widget._currentDay - 1] != 0) ProgramDetails(programId: widget.program.id, day: widget._currentDay)
                  else SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("../assets/other/rest.jpg", width: 200,),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Rest is important for your body,\nread a book, take a nap, relax!\nYou deserve it.")
                      ],
                    ),
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}