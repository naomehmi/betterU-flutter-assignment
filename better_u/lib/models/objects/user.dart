import 'package:better_u/state_management/user_management.dart';

class User {
  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.completedWorkouts,
      required this.likedPosts,
      this.gender = Gender.other,
      this.autoPlay = false,
      this.profilePic = 'assets/other/default-profile.jpg',
      this.role = 'Rookie',
    });

  String firstName;
  String? lastName;
  String email;
  String password;
  Map<int, Map<int, Set<int>>> completedWorkouts;
  Gender gender;
  bool autoPlay;
  String profilePic;
  String role;
  Set<int> likedPosts;
}
