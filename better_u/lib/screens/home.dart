import 'package:better_u/screens/models/carousel.dart';
import 'package:better_u/screens/models/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<String> imagePaths = [
    'images/carousel1.png',
    'images/carousel2.png',
    'images/carousel3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child :
            Row(
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
             items: imagePaths.map((imagePath) {
                return ContainImage(imagePath: imagePath);
              }).toList(), 
              options: CarouselOptions(
                height: 200,
                aspectRatio: screenWidth / 200,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Update current index when page changes
                  });
                },
              ),
            ),
            SizedBox(height: 10), 
            CarouselIndicator(
              itemCount: 3,
              currentIndex: _currentIndex,
              indicatorSize: 8.0,
              spacing: 5.0,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Top Picks', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            )
          ],
        ),
      )
    );
  }
}
