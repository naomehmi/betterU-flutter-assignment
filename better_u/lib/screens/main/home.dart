import 'package:better_u/data/all_programs.dart';
import 'package:better_u/data/all_videos.dart';
import 'package:better_u/models/home_carousel/carousel_home.dart';
import 'package:better_u/models/top_picks/home_page_pick.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeCarousel(),
            HomePagePickTemplate(
              title: "Top Picks", 
              nextRoute: "/all-programs", 
              height: 260, 
              content: AllPrograms().programs.sublist(0,4), 
              type: "program"
            ),
            const SizedBox(height: 15),
            HomePagePickTemplate(
              title: "Our Videos",
              nextRoute: "/all-videos",
              height: 270,
              content: AllVideos().videos,
              type: "video"
            )
          ],
        ),
      ),
    );
  }
}