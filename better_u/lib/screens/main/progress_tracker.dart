import 'dart:collection';
import 'dart:math';
import 'package:better_u/models/custom_widgets/todays_exercise.dart';
import 'package:better_u/models/objects/user.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:better_u/state_management/theme_provider.dart';

class ProgressTracker extends StatefulWidget {
  const ProgressTracker({super.key});

  @override
  State<ProgressTracker> createState() => _ProgressTrackerState();
}

class _ProgressTrackerState extends State<ProgressTracker> {
  late SplayTreeMap<DateTime, double> userWeight;

  TextEditingController targetWeight = TextEditingController();
  int totalWorkouts = 0;
  late double userTarget;
  String errorText = "";

  @override
  void initState() {
    userWeight = Provider.of<UserManagement>(context, listen: false).loggedInUser.weightLog;
    userTarget = Provider.of<UserManagement>(context, listen: false).loggedInUser.goalWeight;
    Map<int, Map<int, Set<int>>> completedWorkouts =
        Provider.of<UserManagement>(context, listen: false)
            .loggedInUser
            .completedWorkouts;
    for (int i in completedWorkouts.keys) {
      List days = completedWorkouts[i]!.keys.toList();
      for (int j in days) {
        totalWorkouts += completedWorkouts[i]![j]!.length;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color textColor = themeProvider.themeType == ThemeType.dark
        ? Colors.yellow // Yellow for dark mode
        : Color.fromARGB(255, 139, 93, 175); // Purple for light mode

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
                    fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TodaysExercise(
                    icon: Icons.alarm,
                    text: "23.8 Mins",
                    color: Colors.purple[200],
                  ),
                  TodaysExercise(
                    icon: Icons.local_fire_department,
                    text: "191.6 Kcal",
                    color: Color.fromARGB(255, 255, 231, 96),
                  )
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
                    fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Current (kg)",
                style: TextStyle(fontSize: 14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    userWeight.isNotEmpty ? userWeight[userWeight.keys.last].toString() : 'Not Logged',
                    style: const TextStyle(
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
                          )),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  insetPadding: const EdgeInsets.all(0),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Weight Log"),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            size: 30,
                                            color: Color.fromARGB(
                                                255, 139, 93, 175),
                                          ))
                                    ],
                                  ),
                                  content: SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        400,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          for (DateTime date in userWeight.keys)
                                            ListTile(
                                              title: Text(DateFormat.yMMMd()
                                                  .format(date)),
                                              subtitle: Text(
                                                  "${userWeight[date]} kg"),
                                              trailing: TextButton(
                                                child: const Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        TextEditingController
                                                            logWeight =
                                                            TextEditingController(
                                                                text: userWeight[
                                                                            date]
                                                                        .toString() == 'null' ?
                                                                    "" : userWeight[
                                                                            date]
                                                                        .toString());
                                                        return AlertDialog(
                                                          title: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "${DateFormat.yMMMd().format(date)}'s weight",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            139,
                                                                            93,
                                                                            175),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.close,
                                                                    size: 30,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            139,
                                                                            93,
                                                                            175),
                                                                  ))
                                                            ],
                                                          ),
                                                          content: SizedBox(
                                                            height: 150,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                TextField(
                                                                  controller:
                                                                      logWeight,
                                                                  keyboardType: const TextInputType
                                                                      .numberWithOptions(
                                                                      decimal:
                                                                          true,
                                                                      signed:
                                                                          false),
                                                                  autofocus:
                                                                      true,
                                                                  decoration: InputDecoration(
                                                                      contentPadding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              5,
                                                                          horizontal:
                                                                              5),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5),
                                                                          borderSide:
                                                                              BorderSide(color: Colors.purple[200]!))),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          30),
                                                                ),
                                                                SizedBox(
                                                                  height: 15,
                                                                  child: Text(errorText),
                                                                ),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                          if(logWeight.text.isEmpty){
                                                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Textfield Cannot Be Empty")));
                                                                          } else{
                                                                            Provider.of<UserManagement>(context, listen: false).addNewLog(date, double.parse(logWeight.text));
                                                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Weight Log updated!")));
                                                                            setState(() {});
                                                                          }
                                                                      Navigator.pop(
                                                                          context);
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            "OK"))
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                DateTime? datePick =
                                                    await showDatePicker(
                                                        context: context,
                                                        firstDate:
                                                            DateTime(2024),
                                                        lastDate:
                                                            DateTime.now());
                                                if (datePick != null &&
                                                    context.mounted) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        TextEditingController
                                                            logWeight =
                                                            TextEditingController(
                                                                text: userWeight[
                                                                            datePick]
                                                                        .toString() == 'null' ?
                                                                    "" : userWeight[
                                                                            datePick]
                                                                        .toString());
                                                        return AlertDialog(
                                                          title: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "${DateFormat.yMMMd().format(datePick)}'s weight",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            139,
                                                                            93,
                                                                            175),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.close,
                                                                    size: 30,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            139,
                                                                            93,
                                                                            175),
                                                                  ))
                                                            ],
                                                          ),
                                                          content: SizedBox(
                                                            height: 150,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                TextField(
                                                                  controller:
                                                                      logWeight,
                                                                  keyboardType: const TextInputType
                                                                      .numberWithOptions(
                                                                      decimal:
                                                                          true,
                                                                      signed:
                                                                          false),
                                                                  autofocus:
                                                                      true,
                                                                  decoration: InputDecoration(
                                                                      contentPadding: const EdgeInsets
                                                                          .symmetric(
                                                                          vertical:
                                                                              5,
                                                                          horizontal:
                                                                              5),
                                                                      border: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(
                                                                              5),
                                                                          borderSide:
                                                                              BorderSide(color: Colors.purple[200]!))),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          30),
                                                                ),
                                                                SizedBox(
                                                                  height: 15,
                                                                  child: Text(errorText),
                                                                ),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                          if(logWeight.text.isEmpty){
                                                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Textfield Cannot Be Empty")));
                                                                          } else{
                                                                            Provider.of<UserManagement>(context, listen: false).addNewLog(datePick, double.parse(logWeight.text));
                                                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Weight Log updated!")));
                                                                            setState(() {});
                                                                          }
                                                                      Navigator.pop(
                                                                          context);
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            "OK"))
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                }
                                              },
                                              child: const Text("Add"))
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      child: const Text(
                        "LOG",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                ],
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Weight Progress in the Last ${userWeight.length >= 7 ? 7 : userWeight.length} Days",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 2,
                child: LineChart(LineChartData(
                  titlesData: FlTitlesData(
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              interval: 1,
                              reservedSize: 50,
                              showTitles: true,
                              getTitlesWidget: (x, meta) {
                                List axisTitles = userWeight.keys.toList();
                                if (userWeight.length > 7) {
                                  axisTitles =
                                      axisTitles.sublist(userWeight.length - 8);
                                }
                                return SideTitleWidget(
                                    axisSide: meta.axisSide,
                                    child: Text(
                                      DateFormat.MMMd()
                                          .format(axisTitles[x.toInt() - 1])
                                          .replaceFirst(" ", "\n"),
                                      style: const TextStyle(fontSize: 14),
                                    ));
                              }))),
                  minX: userWeight.length < 7 ? 1 : userWeight.length - 6,
                  minY: userWeight.values.isNotEmpty ? userWeight.values.fold(double.infinity, (previousValue, element) => previousValue < element ? previousValue : element).floorToDouble() : 0,
                  maxY: userWeight.values.isNotEmpty ? userWeight.values.fold(double.negativeInfinity, (previousValue, element) => previousValue > element ? previousValue : element).ceilToDouble() : 60,
                  betweenBarsData: [],
                  lineBarsData: [
                    LineChartBarData(color: Colors.purple[200], spots: [
                      for (int i = userWeight.length < 7 ? 1 : userWeight.length - 6; i <= userWeight.length; i++)
                        FlSpot(
                            i.toDouble(),
                            userWeight[userWeight.keys.toList()[i - 1]]!
                                .toDouble())
                    ])
                  ],
                )),
              ),
              const Divider(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "Target Weight",
                    style: TextStyle(fontSize: 15),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "$userTarget kg",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 170, 140, 36),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Target Weight",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 139, 93, 175),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            size: 30,
                                            color: Color.fromARGB(
                                                255, 139, 93, 175),
                                          ))
                                    ],
                                  ),
                                  content: SizedBox(
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextField(
                                          controller: targetWeight,
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
                                              decimal: true, signed: false),
                                          autofocus: true,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  borderSide: BorderSide(
                                                      color: Colors
                                                          .purple[200]!))),
                                          style: const TextStyle(fontSize: 30),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Provider.of<UserManagement>(
                                                      context,
                                                      listen: false)
                                                  .changeGoal(double.parse(
                                                      targetWeight.text));
                                              Navigator.pop(context);
                                            },
                                            child: const Text("OK"))
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      icon: const Icon(
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
                      gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 209, 150, 255)
                                .withOpacity(0.5),
                            const Color.fromARGB(255, 241, 230, 130)
                                .withOpacity(0.5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(20)),
                  width: 200,
                  height: 125,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Workouts Done",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      Text(
                        "$totalWorkouts",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: "Monoton",
                            color: textColor),
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
