import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  PlayVideo({super.key, required this.video});

  Map<String, String> video;

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late final url = widget.video["url"].toString();
  late YoutubePlayerController _controller;

  @override
  void initState(){
    final videoId = YoutubePlayer.convertUrlToId(url);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.video["title"]}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          )
        ],
      ),
    );
  }
}