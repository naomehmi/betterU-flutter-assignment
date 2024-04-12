import 'package:better_u/data/all_users.dart';

class LoggedInUser {
  late String firstName;
  late String lastName;
  late String email;

  void currentUser(fn, ln, e){
    firstName = fn;
    lastName = ln;
    email = ln;
  }
}