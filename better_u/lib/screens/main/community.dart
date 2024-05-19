import 'package:better_u/models/custom_widgets/forum_post.dart';
import 'package:better_u/models/objects/post.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    List<Post> allPosts = Provider.of<ForumManagement>(context, listen: false).allForums.where((element) => !element.reply).toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...allPosts.map((e) => ForumPost(post: e))
          ],
        ),
      ),
    );
  }
}