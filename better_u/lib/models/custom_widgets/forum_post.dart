import 'package:better_u/models/objects/post.dart';
import 'package:better_u/models/objects/user.dart';
import 'package:better_u/state_management/forum_management.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class ForumPost extends StatefulWidget {
  ForumPost({
    super.key,
    required this.post
  });

  Post post;

  @override
  State<ForumPost> createState() => _ForumPostState();
}

class _ForumPostState extends State<ForumPost> {
  late User user;
  late int replies;

  Widget group(IconData icon, String string){
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey[400],
        ),
        const SizedBox(width: 5,),
        Text(
          string,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600]
          ),
        ),
        const SizedBox(width: 15,)
      ],
    );
  }

  @override
  void initState(){
    user = Provider.of<UserManagement>(context, listen: false).allUsers.firstWhere((element) => element.email == widget.post.userEmail);
    replies = Provider.of<ForumManagement>(context, listen: false).allForums.where((element) => element.reply && element.replyToId == widget.post.id).length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple[200]!,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(user.profilePic),
                ),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.firstName} ${user.lastName}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      user.role,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.post.content,
              style: const TextStyle(
                fontSize: 15
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
              group(
                Icons.thumb_up,
                '${widget.post.likes} likes'
              ),
              group(
                Icons.comment,
                '$replies ${replies == 1 ? "reply" : "replies"}'
              ),
              group(
                Icons.schedule,
                timeago.format(DateTime.now().subtract(DateTime.now().difference(widget.post.time)))
              ),
              ]
            )
          ],
        ),
      ),
    );
  }
}