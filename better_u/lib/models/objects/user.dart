import 'package:better_u/state_management/users.dart';

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.completedWorkouts,
    this.gender = Gender.other
  });

  String firstName;
  String lastName;
  String email;
  String password;
  List<Map> completedWorkouts;
  Gender gender;
}