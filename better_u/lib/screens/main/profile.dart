import 'dart:html';

import 'package:better_u/models/objects/user.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    User currentUser =
        Provider.of<UserManagement>(context, listen: false).loggedInUser;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 226, 189, 255),
                      width: 5,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(currentUser.profilePic),
                  ),
                ),
                Text(
                  "${currentUser.firstName} ${currentUser.lastName}",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "email",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "member since",
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "pronouns",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              child: Center(
                  child: Text(
            "Edit Profile",
            textAlign: TextAlign.end,
          )))
        ],
      ),
    );
  }
}
