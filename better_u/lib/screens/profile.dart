import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
            child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: const SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 228, 193, 245),
              ),
            ),
          ),
        ])));
  }
}
