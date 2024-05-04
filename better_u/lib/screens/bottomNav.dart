import 'package:better_u/screens/home.dart';
import 'package:better_u/screens/chart.dart';
import 'package:better_u/screens/community.dart';
import 'package:better_u/screens/profile.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentNavIndex = 0;
  final screens = [Home(), Chart(), Community(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentNavIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentNavIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Chart",
              icon: Icon(Icons.bar_chart_outlined),
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
        ));
  }
}
