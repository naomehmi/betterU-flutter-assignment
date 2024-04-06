import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            CarouselSlider(
              items: [
                ContainImage(imagePath: 'images/carousel1.png'),
                ContainImage(imagePath: 'images/carousel2.png'),
                ContainImage(imagePath: 'images/carousel3.jpg'),
              ], 
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
              ),
            ),
          ],
        ),
      )
    );
  }
}

class ContainImage extends StatelessWidget {
  final String imagePath;

  const ContainImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.asset(
          imagePath,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
