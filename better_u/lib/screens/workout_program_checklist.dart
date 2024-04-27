import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorkoutProgramChecklist extends StatefulWidget {
  const WorkoutProgramChecklist({super.key, required this.program});

  final Map<String, dynamic> program;

  @override
  State<WorkoutProgramChecklist> createState() =>
      _WorkoutProgramChecklistState();
}

class _WorkoutProgramChecklistState extends State<WorkoutProgramChecklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.program["title"],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.program["coverImage"],
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
                                "${widget.program['days']} days",
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
                              Text("${widget.program['interval']} mins/day",
                                  style: const TextStyle(fontSize: 12))
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
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
                  Text(widget.program["desc"]),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for(int i=1;i<=15;i++) Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: FilterChip(label: Text("Day $i"), onSelected: (val){}),
                        )
                      ],),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
