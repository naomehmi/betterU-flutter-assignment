import 'package:better_u/screens/home.dart';
import 'package:better_u/screens/signup.dart';
import 'package:better_u/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        '/home': (context) => Home(),
      },
      home: OnboardingPage(),
    );
  }
}