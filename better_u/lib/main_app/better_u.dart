import 'package:better_u/models/app_bars/home_appbar.dart';
import 'package:better_u/models/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:better_u/models/drawer/drawer.dart';
import 'package:better_u/screens/main/community.dart';
import 'package:better_u/screens/main/home.dart';
import 'package:better_u/screens/main/profile.dart';
import 'package:better_u/screens/main/progress_tracker.dart';
import 'package:better_u/screens/onboarding/onboarding_page.dart';
import 'package:better_u/screens/user_related/sign_up.dart';
import 'package:better_u/state_management/user_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BetterU extends StatefulWidget {
  const BetterU({super.key});

  @override
  State<BetterU> createState() => _BetterUState();
}

class _BetterUState extends State<BetterU> {
  int screenIdx = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void changeIdx(int idx) {
    setState(() {
      screenIdx = idx;
    });
  }

  List screens = [
    const Home(),
    const ProgressTracker(),
    const Community(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    if (Provider.of<UserManagement>(context, listen: false)
            .loggedInUser
            .firstName ==
        'User') {
      return const OnboardingPage();
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: HomeAppBar(_scaffoldKey),
      body: screens[screenIdx],
      bottomNavigationBar: BotNavBar(
        curIdx: screenIdx,
        changeIdx: changeIdx,
      ),
      drawer: CustomDrawer(
        changeIdx: changeIdx
      ),
    );
  }
}
