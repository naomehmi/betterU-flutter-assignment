import 'package:better_u/models/custom_widgets/todays_exercise.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressTracker extends StatelessWidget {
  const ProgressTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today's Exercise",
              style: TextStyle(
                color: Color.fromARGB(255, 139, 93, 175),
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TodaysExercise(icon: Icons.alarm, text: "23.8 Mins", color: Colors.purple[200],),
                TodaysExercise(icon: Icons.local_fire_department, text: "191.6 Kcal", color: const Color.fromARGB(255, 241, 230, 130),)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Body Weight",
              style: TextStyle(
                color: Color.fromARGB(255, 139, 93, 175),
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            const Text(
              "Current (kg)",
              style: TextStyle(
                fontSize: 14
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "55.7 kg",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 170, 140, 36),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[200]!.withOpacity(0.5),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  onPressed: (){}, 
                  child: const Text(
                    "LOG",
                    style: TextStyle(
                      color: Color.fromARGB(255, 139, 93, 175),
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                )
              ],
            ),
            const Divider(),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Weight Loss Progress in the Last 7 Days",
                textAlign: TextAlign.center,
              ),
            ),
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  minX: 1,
                  // minY: 0,
                  lineBarsData: [
                    LineChartBarData(
                      color: Colors.purple[200],
                      spots: [
                        const FlSpot(1, 55),
                        const FlSpot(2, 54),
                        const FlSpot(3, 53),
                        const FlSpot(4, 54),
                        const FlSpot(5, 55),
                        const FlSpot(6, 52),
                        const FlSpot(7, 54),
                      ]
                    )
                  ],
                )  
              ),
            )
          ],
        ), 
      ),
    );
  }
}