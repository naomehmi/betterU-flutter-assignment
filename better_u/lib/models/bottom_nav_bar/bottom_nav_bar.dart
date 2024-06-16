import 'package:flutter/material.dart';

class BotNavBar extends StatelessWidget {
  BotNavBar({Key? key, required this.curIdx, required this.changeIdx});

  final int curIdx;
  final Function(int) changeIdx;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: curIdx,
      onTap: changeIdx,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Tooltip(
            message: "Home",
            child: Icon(Icons.home),
          ),
        ),
        BottomNavigationBarItem(
          label: "Progress",
          icon: Tooltip(
            message: "Progress",
            child: Icon(Icons.bar_chart),
          ),
        ),
        BottomNavigationBarItem(
          label: "Community",
          icon: Tooltip(
            message: "Community",
            child: Icon(Icons.people),
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Tooltip(
            message: "Profile",
            child: Icon(Icons.account_circle),
          ),
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 226, 189, 255),
      unselectedItemColor: Colors.grey[400],
    );
  }
}
