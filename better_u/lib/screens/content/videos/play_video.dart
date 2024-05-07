import 'package:better_u/data/all_videos.dart';
import 'package:better_u/models/objects/video.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.video});

  final Video video;

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late final url = widget.video.url.toString();
  late YoutubePlayerController _controller;
  List<Video> otherVids = AllVideos().videos;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(url);
    _controller = YoutubePlayerController(
        initialVideoId: videoId!, flags: const YoutubePlayerFlags());
    otherVids.shuffle();

    _controller.addListener(() {
      if (Provider.of<UserManagement>(context, listen: false)
              .loggedInUser
              .autoPlay &&
          _controller.value.playerState == PlayerState.ended) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlayVideo(video: otherVids[0])));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              aspectRatio: 16 / 9,
              width: double.infinity,
              progressIndicatorColor: Colors.purple[200],
              progressColors: ProgressBarColors(
                  playedColor: Colors.purple[200],
                  handleColor: Colors.purple[200]),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.video.title,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[200])),
                  Text(widget.video.cat,
                      style: const TextStyle(fontSize: 15, color: Colors.grey)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "More Videos",
                        style: TextStyle(fontSize: 18),
                      ),
                      Consumer<UserManagement>(
                        builder: (context, user, child) => Row(
                          children: [
                            const Text("AutoPlay"),
                            Switch(
                                value: user.loggedInUser.autoPlay,
                                onChanged: (value) {
                                  setState(() {
                                    user.loggedInUser.autoPlay = value;
                                  });
                                }),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ...otherVids.map((e) {
                    if (e.title == widget.video.title) return const SizedBox();
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayVideo(video: e)));
                      },
                      child: Card(
                          child: ListTile(
                        leading: Image.asset(e.coverImage),
                        title: Text(e.title),
                        subtitle: Text(
                          e.cat,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
