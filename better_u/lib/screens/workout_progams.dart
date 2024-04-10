import 'package:better_u/screens/bottomNav.dart';
import 'package:flutter/material.dart';

class WorkoutPrograms extends StatefulWidget {
  const WorkoutPrograms({super.key});

  @override
  State<WorkoutPrograms> createState() => _WorkoutProgramsState();
}

class _WorkoutProgramsState extends State<WorkoutPrograms> {
  List<String> options = [
    "Name A-Z",
    "Interval",
    "Total days"
  ];

  dynamic currentValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Picks"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text("Latest Workout Exercises"),
            const Text("Stay consistent in your fitness journey by starting with the latest exercises. You can also view all exercises in order starting with the most recent"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("8 programs"),
                DropdownButton(
                  value: currentValue,
                  icon: const Icon(Icons.expand_more),
                  elevation: 16,
                  isExpanded: false,
                  underline: Container(height: 0,),
                  hint: const Align(
                    alignment: Alignment.centerRight,
                    child: Text("Sort by", style: TextStyle(
                      color: Colors.grey
                    ),),
                  ),
                  items: options.map((e){
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e));
                  }).toList(),
                  onChanged: (val){
                    setState(() {
                      currentValue = val!;
                    });
                  })
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}