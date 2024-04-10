import 'package:better_u/screens/bottomNav.dart';
import 'package:better_u/screens/data/all_programs.dart';
import 'package:flutter/material.dart';

class WorkoutPrograms extends StatefulWidget {
  const WorkoutPrograms({super.key});

  @override
  State<WorkoutPrograms> createState() => _WorkoutProgramsState();
}

class _WorkoutProgramsState extends State<WorkoutPrograms> {
  List<String> options = ["Name A-Z", "Interval", "Total days"];

  dynamic currentValue;

  List allPrograms = AllPrograms().programs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Picks"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Latest Workout Exercises", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),),
            const SizedBox(
              height: 25,
            ),
            const Text(
                "Stay consistent in your fitness journey by starting with the latest exercises. You can also view all exercises in order starting with the most recent"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${allPrograms.length} programs", style: const TextStyle(fontWeight: FontWeight.bold),),
                DropdownButton(
                    value: currentValue,
                    icon: const Icon(Icons.expand_more),
                    elevation: 16,
                    isExpanded: false,
                    underline: Container(
                      height: 0,
                    ),
                    hint: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Sort by",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    items: options.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        currentValue = val!;
                      });
                    })
              ],
            ),
            ...allPrograms.map((e) {
              return Container(
                width: double.infinity - 40,
                height: 300,
                margin: const EdgeInsets.all(10),
                decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 4)
                    )]
                  ),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(0),
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        e["coverImage"],
                        fit: BoxFit.cover,
                        width: double.infinity - 40,
                        height: 200,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text('${e["days"]} days',
                                style: const TextStyle(fontSize: 12)
                              ),
                              const SizedBox(width: 10,),
                              const Icon(
                                Icons.schedule,
                                size: 20,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('${e["interval"]} mins/day',
                                  style: const TextStyle(fontSize: 12))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            e["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                          )
                        ]))
                  ]),
                ),
              );
            })
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
