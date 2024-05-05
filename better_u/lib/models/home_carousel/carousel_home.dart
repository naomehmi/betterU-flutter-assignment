import 'package:better_u/models/home_carousel/carousel_img.dart';
import 'package:better_u/models/home_carousel/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  List allImagesUrl = [
    '../assets/carousel-pics/carousel1.png',
    '../assets/carousel-pics/carousel2.png',
    '../assets/carousel-pics/carousel3.jpg',
  ];

  int carouselIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(items: allImagesUrl.map((img) => CarouselImage(path: img)).toList(), options: CarouselOptions(
          height: 200,
          aspectRatio: MediaQuery.of(context).size.width,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason){
            setState(() {
              carouselIdx = index;
            });
          }
        )),
        const SizedBox(height: 10,),
        CarouselIndicator(itemCount: allImagesUrl.length, indicatorIdx: carouselIdx),
        const SizedBox(height: 10,)
      ],
    );
  }
}