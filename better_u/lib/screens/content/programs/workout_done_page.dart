import 'package:better_u/screens/main/home.dart';
import 'package:flutter/material.dart';

class WorkoutDonePage extends StatefulWidget {
  const WorkoutDonePage({super.key});

  @override
  _WorkoutDonePageState createState() => _WorkoutDonePageState();
}

class _WorkoutDonePageState extends State<WorkoutDonePage> {
  bool _showFAB = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _showFAB = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 189, 255),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color.fromARGB(255, 241, 230, 130),
              radius: 60,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 100,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Hooray! It’s all done for today! Keep on going",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: _showFAB
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              elevation: 0.0,
              child: const Icon(Icons.home),
            )
          : null,
    );
  }
}
