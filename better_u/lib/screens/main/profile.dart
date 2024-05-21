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
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
