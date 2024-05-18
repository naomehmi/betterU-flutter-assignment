import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:better_u/state_management/user_management.dart';

PreferredSizeWidget HomeAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
            GestureDetector(
            onTap: () {
              scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 226, 189, 255),
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/other/profile-picture.jpg'),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Consumer<UserManagement>(builder: (context, user, child) {
            return Text(
              'Hi, ${user.loggedInUser.firstName}!',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
        ],
      ),
    ),
  );
}
