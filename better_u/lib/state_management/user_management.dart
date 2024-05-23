import 'package:better_u/models/objects/user.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, other }

class UserManagement extends ChangeNotifier {
  // every user that has signed up
  final List<User> allUsers = [
    User(
        firstName: "Kelly",
        lastName: "Moon",
        email: "kellymoon@gmail.com",
        password: "12345678",
        completedWorkouts: {
          // program id : {day n : {video ids completed}}
          1: {
            1: {2}
          }
        },
        gender: Gender.female,
        profilePic: 'assets/other/profile-picture.jpg'),
    User(
        firstName: 'Emma',
        lastName: 'Stone',
        email: 'emmastone@gmail.com',
        password: '1234',
        completedWorkouts: {}),
    User(
        firstName: 'Jacob',
        lastName: 'Smith',
        email: 'coolguy@gmail.com',
        password: '1234',
        completedWorkouts: {}),
  ];

  // user who logged in credentials
  User loggedInUser = User(
      firstName: 'User',
      lastName: '',
      email: '',
      password: '',
      completedWorkouts: {});

  // for wrong inputs
  User emptyUser = User(
      firstName: '',
      lastName: '',
      email: '',
      password: '',
      completedWorkouts: {});

  // check user credentials when logging in
  bool userLoginCreds(String inputEmail, String inputPassword) {
    var cred = allUsers.firstWhere((element) => element.email == inputEmail,
        orElse: () => emptyUser);

    if (cred == emptyUser) {
      return false;
    }

    if (inputPassword != cred.password) {
      return false;
    }

    return true;
  }

  // set the current logged in user
  void setCurrentUser(String email) {
    User thisUser = allUsers.firstWhere((element) => element.email == email);
    loggedInUser.firstName = thisUser.firstName;
    loggedInUser.lastName = thisUser.lastName;
    loggedInUser.email = thisUser.email;
    loggedInUser.completedWorkouts = thisUser.completedWorkouts;
    loggedInUser.gender = thisUser.gender;
    loggedInUser.profilePic = thisUser.profilePic;
    notifyListeners();
  }

  // new user sign up
  void newUser(String firstName, String lastName, String email, String password,
      Gender gender) {
    firstName =
        firstName.substring(0, 1).toUpperCase() + firstName.substring(1);
    lastName = lastName != ""
        ? lastName
            .split(" ")
            .map((e) => e.substring(0, 1).toUpperCase() + e.substring(1))
            .join(" ")
        : "";
    allUsers.add(User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        completedWorkouts: {},
        gender: gender));
    notifyListeners();
  }

  // duplicate email
  String isDuplicateEmail(String inputEmail) {
    var duplicate = allUsers.indexOf(allUsers.firstWhere((element) {
      return element.email == inputEmail;
    }, orElse: () => emptyUser));

    if (duplicate != -1) return "This email has been taken";

    return "";
  }

  void userLogout() {
    loggedInUser = emptyUser;
    loggedInUser.firstName = 'User';
    notifyListeners();
  }
}
