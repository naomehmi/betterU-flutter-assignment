import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List carouselImages = [
    Image.asset("images/carousel1.jpg"),
    Image.asset("images/carousel2.jpg"),
    Image.asset("images/carousel3.jpg")
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("images/carousel1.jpg",
                height: 30,
                width: 30,
              )),
              const Text('Hi, User!'),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: const Column(
          children: [
            Text('Welcome to the Home Screen!')
          ],
        ),
      ),
    );
  }
}