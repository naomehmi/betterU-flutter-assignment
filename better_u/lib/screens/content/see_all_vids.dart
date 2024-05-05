import 'package:better_u/data/all_videos.dart';
import 'package:better_u/models/objects/video.dart';
import 'package:better_u/screens/content/play_video.dart';

import 'package:flutter/material.dart';

class AllVideosShow extends StatefulWidget {
  const AllVideosShow({super.key});

  @override
  State<AllVideosShow> createState() => _AllVideosShowState();
}

class _AllVideosShowState extends State<AllVideosShow> {
  List<String> options = ["Name A-Z", "Workout Duration"];

  dynamic currentValue;

  List<Video> allVideos = AllVideos().videos;

  @override
  void initState() {
    super.initState();
    allVideos = List<Video>.from(allVideos);
    currentValue = null;
  }

  void sortPrograms(String option) {
    setState(() {
      switch (option) {
        case "Name A-Z":
          allVideos.sort((a, b) => a.title.compareTo(b.title));
          break;
        case "Workout Duration":
          allVideos.sort((a, b) => a.time.compareTo(b.time));
          break;
        default:
          // Default sorting by name if no valid option is selected
          allVideos.sort((a, b) => a.title.compareTo(b.title));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Workout Videos"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Workout Videos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
                "This section is for users who don't feel like sticking to a program currently, and only want to do a one-off exercises"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${allVideos.length} programs",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                DropdownButton(
                    value: currentValue,
                    icon: const Icon(Icons.expand_more),
                    elevation: 16,
                    isExpanded: false,
                    underline: Container(
                      height: 0,
                    ),
                    hint: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Sort by",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    items: options.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        currentValue = val!;
                        sortPrograms(currentValue!);
                      });
                    })
              ],
            ),
            ...allVideos.map((e) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayVideo(video: e)));
                },
                child: Container(
                  width: double.infinity - 40,
                  //height: 300,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.all(0),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          e.coverImage,
                          fit: BoxFit.cover,
                          width: double.infinity - 40,
                          height: 200,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.track_changes,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(e.cat,
                                        style: const TextStyle(fontSize: 12)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.schedule,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(e.time,
                                        style: const TextStyle(fontSize: 12))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  e.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                )
                              ]))
                    ]),
                  ),
                ),
              );
            })
          ],
        ),
      ),
      //bottomNavigationBar: const BottomNav(),
    );
  }
}
