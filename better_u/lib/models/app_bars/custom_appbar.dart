import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(GlobalKey<ScaffoldState> scaffoldKey, String heading, String img) {
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
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(img),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            heading,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
