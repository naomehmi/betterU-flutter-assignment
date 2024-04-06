import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 226, 189, 255),
                  width: 2, // Adjust the width of the outline as needed
                ),
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                // backgroundImage: AssetImage('images/profile-picture.jpg'), 
              ),
            ),
            const SizedBox(width: 8),
            const Text('Hi, Kelly!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset('images/carousel1.png'),
              Image.asset('images/carousel2.png'),
              Image.asset('images/carousel3.jpg'),
            ], 
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      )
    );
  }
}