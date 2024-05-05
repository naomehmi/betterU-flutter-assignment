import 'package:flutter/material.dart';

class BotNavBar extends StatelessWidget {
  BotNavBar({super.key, required this.curIdx, required this.changeIdx});

  int curIdx;
  Function changeIdx;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: curIdx,
      onTap: (int newIdx){
          curIdx = newIdx;
          changeIdx(newIdx);
      },
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Progress",
          icon: Icon(Icons.bar_chart),
        ),
        BottomNavigationBarItem(
          label: "Community",
          icon: Icon(Icons.people),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.account_circle),
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 226, 189, 255),
      unselectedItemColor: Colors.grey[400],
    );
  }
}