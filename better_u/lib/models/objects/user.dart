import 'dart:collection';

import 'package:better_u/state_management/theme_provider.dart';
import 'package:better_u/state_management/user_management.dart';

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.completedWorkouts,
    required this.likedPosts,
    this.gender = Gender.other,
    this.profilePic = 'assets/other/default-profile.jpg',
    this.role = 'Rookie',
    this.goalWeight = 0,
    required this.pronouns,
    required this.memberSince,
    required this.weightLog,
    this.theme = ThemeType.light
  });

  String firstName;
  String? lastName;
  String email;
  String password;
  Map<int, Map<int, Set<int>>> completedWorkouts;
  Gender gender;
  String profilePic;
  String role;
  Set<int> likedPosts;
  String pronouns; 
  DateTime memberSince;
  double goalWeight; 
  SplayTreeMap<DateTime, double> weightLog;
  ThemeType theme;
}
