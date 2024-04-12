import 'package:better_u/data/logged_in_user.dart';
import 'package:better_u/screens/bottomNav.dart';
import 'package:better_u/data/all_programs_and_videos.dart';
import 'package:better_u/models/carousel.dart';
import 'package:better_u/models/carousel_indicator.dart';
import 'package:better_u/models/top_picks_card.dart';
import 'package:better_u/screens/videos.dart';
import 'package:better_u/screens/workout_progams.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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

  List<Map<String, dynamic>> topPicks = AllPrograms().programs.sublist(0, 4);
  List<Map<String, String>> topVideos = AllPrograms().videos;

  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.bar_chart_outlined),
    Icon(Icons.people),
    Icon(Icons.account_circle)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 226, 189, 255),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 20,
                    //backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage('images/profile-picture.jpg'),
                  ),
                ),
                const SizedBox(width: 8),
                Consumer<LoggedInUser>(builder: (context, user, child) {
                  print("hell0 ${user.firstName}");
                  return Text(
                      'Hi, ${user.firstName.isNotEmpty ? user.firstName : "User"}!',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold));
                }),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex =
                            index; // Update current index when page changes
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CarouselIndicator(
                  itemCount: 3,
                  currentIndex: _currentIndex,
                  indicatorSize: 8.0,
                  spacing: 5.0,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Picks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WorkoutPrograms()));
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            side: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 224, 186, 253))),
                        child: const Text(
                          "view all",
                          style: TextStyle(
                              color: Color.fromARGB(255, 224, 186, 253)),
                        ),
                      )
                    ],
                  ),
                ),
                CarouselSlider(
                    items: topPicks.map((tp) {
                      return TopPicksCard(
                        coverImage: tp["coverImage"],
                        days: tp["days"],
                        interval: tp["interval"],
                        title: tp["title"],
                      );
                    }).toList(),
                    options: CarouselOptions(
                        height: 260,
                        viewportFraction: 0.45,
                        enableInfiniteScroll: false,
                        initialPage: 1)),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Our Videos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AllVideos()));
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(10),
                            side: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 224, 186, 253))),
                        child: const Text(
                          "view all",
                          style: TextStyle(
                              color: Color.fromARGB(255, 224, 186, 253)),
                        ),
                      )
                    ],
                  ),
                ),
                CarouselSlider(
                    items: topVideos.map((e) {
                      return Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 241, 230, 130),
                                    Color.fromARGB(255, 204, 161, 237)
                                  ]),
                              width: 2),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: const EdgeInsets.all(0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    '${e["coverImage"]}',
                                    fit: BoxFit.cover,
                                    width: 320,
                                    height: 180,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            '${e["title"]}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20),
                                          )
                                        ]))
                              ]),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                        height: 270,
                        viewportFraction: 0.6,
                        enableInfiniteScroll: false,
                        initialPage: 1)),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNav());
  }
}
