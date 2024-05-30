import 'package:better_u/models/objects/post.dart';
import 'package:better_u/models/objects/user.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class Replies extends StatefulWidget {
  Replies({super.key, required this.post});

  Post post;

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  @override
  Widget build(BuildContext context) {
    User poster = Provider.of<UserManagement>(context)
        .allUsers
        .firstWhere((element) => element.email == widget.post.userEmail);
    User curUser = Provider.of<UserManagement>(context).loggedInUser;
    List replies = Provider.of<ForumManagement>(context).allForums.where((element) => element.reply && element.replyToId == widget.post.id).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Replies"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(poster.profilePic),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${poster.firstName} ${poster.lastName}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      poster.role,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.post.content,
              style: const TextStyle(fontSize: 17),
            ),
            Row(children: [
              Row(
                children: [
                  IconButton(
                    visualDensity: const VisualDensity(horizontal: -4),
                    iconSize: 20,
                    icon: const Icon(Icons.thumb_up),
                    color: curUser.likedPosts.contains(widget.post.id)
                        ? Colors.purple[200]
                        : Colors.grey[400],
                    onPressed: () {
                      if (curUser.likedPosts.contains(widget.post.id)) {
                        Provider.of<ForumManagement>(context, listen: false).removeLike(widget.post.id);
                        print("sini");
                      } else {
                        print("sana");
                        Provider.of<ForumManagement>(context, listen: false).newLike(widget.post.id);
                      }
                      Provider.of<UserManagement>(context, listen: false).userLike(widget.post.id);
                      // user = currentUser.loggedInUser;
                      setState(() {});
                    },
                  ),
                  Text(
                    '${widget.post.likes} ${widget.post.likes == 1 ? "like" : "likes"}',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.comment, size: 20, color: Colors.grey[400]),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${replies.length} ${replies.length == 1 ? "reply" : "replies"}',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.schedule,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    timeago.format(DateTime.now()
                        .subtract(DateTime.now().difference(widget.post.time))),
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ]),
            const Divider(
              color: Color.fromARGB(255, 139, 93, 175),
            ),
            const TextField()
          ],
        ),
      ),
    );
  }
}
