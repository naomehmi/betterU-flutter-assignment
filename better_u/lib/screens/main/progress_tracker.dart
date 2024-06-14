import 'package:better_u/models/custom_widgets/todays_exercise.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressTracker extends StatelessWidget {
  ProgressTracker({super.key});

  Map sampleData = {
    "2024-06-10" : 54.8,
    "2024-06-11" : 55.7
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Today's Exercise",
                style: TextStyle(
                  color: Color.fromARGB(255, 139, 93, 175),
                  fontWeight: FontWeight.w600,
                  fontSize: 25
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
                height: 20,
              ),
              const Text(
                "Body Weight",
                style: TextStyle(
                  color: Color.fromARGB(255, 139, 93, 175),
                  fontWeight: FontWeight.w600,
                  fontSize: 25
                ),
              ),
              const SizedBox(height: 10,),
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
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 170, 140, 36),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[200]!.withOpacity(0.5),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )
                    ),
                    onPressed: (){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Weight Log"),
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: const Icon(
                              Icons.close,
                              size: 30,
                              color: Color.fromARGB(255, 139, 93, 175),
                            ))
                          ],
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                             for(String date in sampleData.keys) ListTile(
                              title: Text(date),
                              subtitle: Text("${sampleData[date]}"),
                             )
                            ],
                          ),
                        ),
                      ));
                    }, 
                    child: const Text(
                      "LOG",
                      style: TextStyle(
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
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Weight Progress in the Last 7 Days",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
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
              ),
              const Divider(
                height: 10  ,
              ),
              Row(
                children: [
                  const Text(
                    "Target Weight",
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "53 kg",
                    style: TextStyle(
                      color: Color.fromARGB(255, 170, 140, 36),
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                  IconButton(onPressed: (){
                    showDialog(context: context, builder: (context) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Target Weight",
                            style: TextStyle(
                              color: Color.fromARGB(255, 139, 93, 175),
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: const Icon(
                            Icons.close,
                            size: 30,
                            color: Color.fromARGB(255, 139, 93, 175),
                          ))
                        ],
                      ),
                      content: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                              autofocus: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.purple[200]!)
                                )
                              ),
                              style: const TextStyle(
                                fontSize: 30
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ElevatedButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("OK"))
                          ],
                        ),
                      ),
                    ));
                  }, icon: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 139, 93, 175),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 209, 150, 255).withOpacity(0.5),
                      const Color.fromARGB(255, 241, 230, 130).withOpacity(0.5),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  width: 200,
                  height: 125,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Workouts Done",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 139, 93, 175),
                        ),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Monoton",
                          color: Color.fromARGB(255, 139, 93, 175)
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ), 
        ),
      ),
    );
  }
}