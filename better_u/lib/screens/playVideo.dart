import 'package:better_u/data/all_programs_and_videos.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  PlayVideo({super.key, required this.video});

  Map<String, dynamic> video;

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late final url = widget.video["url"].toString();
  late YoutubePlayerController _controller;
  List<Map<String, dynamic>> otherVids = AllPrograms().videos;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              aspectRatio: 16/9,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${widget.video['title']}", style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[200]
                  )),
                  Text("${widget.video["cat"]}", style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  )),
                  const SizedBox(height: 20),
                  const Text("More Videos", style: TextStyle(fontSize: 18),),
                  ...otherVids.map((e){
                    if(e["title"] == widget.video["title"]) return const SizedBox();
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PlayVideo(video: e)));
                      },
                      child: Card(
                        child: ListTile(
                          leading: Image.asset("${e['coverImage']}"),
                          title: Text("${e['title']}"),
                          subtitle: Text("${e['cat']}", style: const TextStyle(color: Colors.grey),),
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