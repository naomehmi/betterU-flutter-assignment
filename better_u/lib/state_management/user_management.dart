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
        pronouns: "she/her",
        // role: "Intermediate",
        memberSince: DateTime(2024, 2, 11),
        completedWorkouts: {
          // program id : {day n : {video ids completed}}
          1: {
            1: {2}
          }
        },
        gender: Gender.female,
        profilePic: 'assets/other/profile-picture.jpg',
        likedPosts: {2}
      ),
    User(
        firstName: 'Emma',
        lastName: 'Stone',
        email: 'emmastone@gmail.com',
        password: '1234',
        pronouns: "she/her",
        memberSince: DateTime(2024, 5 ,4),
        completedWorkouts: {},
        likedPosts: {}),
    User(
        firstName: 'Jacob',
        lastName: 'Smith',
        email: 'coolguy@gmail.com',
        password: '1234',
        pronouns: "he/him",
        memberSince: DateTime(2024, 1, 31),
        completedWorkouts: {},
        likedPosts: {}),
  ];

  // user who logged in credentials
  User loggedInUser = User(
      firstName: 'User',
      lastName: '',
      email: '',
      password: '',
      pronouns: '',
      memberSince: DateTime.now(),
      completedWorkouts: {}, likedPosts: {});

  // for wrong inputs
  User emptyUser = User(
      firstName: '',
      lastName: '',
      email: '',
      password: '',
      pronouns: '',
      memberSince: DateTime.now(),
      completedWorkouts: {},
      likedPosts: {});

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
    loggedInUser.pronouns = thisUser.pronouns; // Set pronouns
    loggedInUser.memberSince = thisUser.memberSince; // Set memberSince
    loggedInUser.likedPosts = thisUser.likedPosts;
    loggedInUser.role = thisUser.role;

    // Set pronouns automatically based on gender
    switch (thisUser.gender) {
      case Gender.male:
        loggedInUser.pronouns = 'he/him';
        break;
      case Gender.female:
        loggedInUser.pronouns = 'she/her';
        break;
      case Gender.other:
        loggedInUser.pronouns = 'other';
        break;
      default:
        loggedInUser.pronouns = ''; // Handle other cases as needed
    }

    notifyListeners();
  }

  // new user sign up
  void newUser({
  required String firstName,
  String? lastName,
  required String email,
  required String password,
  Gender? gender,
  DateTime? memberSince,
}) {
  firstName = firstName.substring(0, 1).toUpperCase() + firstName.substring(1);
  lastName = lastName != null && lastName.isNotEmpty
      ? lastName
          .split(" ")
          .map((e) => e.substring(0, 1).toUpperCase() + e.substring(1))
          .join(" ")
      : "";
  
  // Automatically set pronouns based on gender
  String pronouns;
  switch (gender) {
    case Gender.male:
      pronouns = 'he/him';
      break;
    case Gender.female:
      pronouns = 'she/her';
      break;
    case Gender.other:
    default:
      pronouns = 'they/them'; // Default pronouns for 'Other' or unspecified gender
      break;
  }

  allUsers.add(User(
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password,
    completedWorkouts: {},
    gender: gender ?? Gender.other, // Default value for gender
    profilePic: 'assets/other/default-profile.jpg', // Example default value for profile pic
    likedPosts: {},
    pronouns: pronouns, // Set pronouns based on gender
    memberSince: memberSince ?? DateTime.now(), // Default value for memberSince
  ));
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

  // Update the current logged-in user's information
  void updateUser({
    required String firstName,
    required String lastName,
    required String email,
    String? profilePic,
    String? pronouns,
    DateTime? memberSince,
    // Add other fields as needed
  }) {
    // Update the logged-in user's information
    loggedInUser.firstName = firstName;
    loggedInUser.lastName = lastName;
    loggedInUser.email = email;
    if (profilePic != null) {
      loggedInUser.profilePic = profilePic;
    }

    // Calculate pronouns based on gender
    if (loggedInUser.gender == Gender.female) {
      loggedInUser.pronouns = 'she/her';
    } else if (loggedInUser.gender == Gender.male) {
      loggedInUser.pronouns = 'he/him';
    } else {
      loggedInUser.pronouns = 'other';
    }

    // Update member since if it's null
    loggedInUser.memberSince ??= DateTime.now();

    // Update the corresponding user in the allUsers list
    for (int i = 0; i < allUsers.length; i++) {
      if (allUsers[i].email == loggedInUser.email) {
        allUsers[i] = loggedInUser;
        break;
      }
    }

    notifyListeners();
  }

  void userLike(postId){
    if(loggedInUser.likedPosts.contains(postId)){
      loggedInUser.likedPosts.remove(postId);
    } else{
      loggedInUser.likedPosts.add(postId);
    }
    notifyListeners();
  }

  String _getDefaultPronouns(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'he/him';
      case Gender.female:
        return 'she/her';
      default:
        return 'other';
    }
  }
}
