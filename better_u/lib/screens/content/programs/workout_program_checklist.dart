import 'package:better_u/models/custom_widgets/workout_details_chip.dart';
import 'package:better_u/models/objects/program.dart';
import 'package:better_u/screens/content/programs/workout_done_page.dart';
import 'package:better_u/screens/content/programs/workout_program_timeline.dart';
import 'package:flutter/material.dart';

class WorkoutProgramChecklist extends StatefulWidget {
  WorkoutProgramChecklist({
    super.key,
    required this.program
  });

  final WorkoutProgram program;
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
          style: const TextStyle(fontWeight: FontWeight.w600),
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
                      WorkoutDetailChip(icon: Icons.calendar_month_outlined, text: "${widget.program.days} days"),
                      const SizedBox(
                        width: 10,
                      ),
                      WorkoutDetailChip(icon: Icons.schedule, text: "${widget.program.interval} mins/day"),
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
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
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
                    height: 450,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/other/rest.jpg", width: 200,),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Rest is important for your body,\nread a book, take a nap, relax!\nYou deserve it.", textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to mark the selected day as completed
                      // Navigate to the "workout_done" page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const WorkoutDonePage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 226, 189, 255),
                      ),
                      elevation: MaterialStateProperty.all<double>(0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Mark Day ${widget._currentDay} as Completed',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}