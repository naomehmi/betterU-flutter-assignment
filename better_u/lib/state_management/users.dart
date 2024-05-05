import 'package:better_u/models/objects/user.dart';
import 'package:flutter/material.dart';

enum Gender { male, female, other }

class UserManagement extends ChangeNotifier {
  // every user that has signed up
  final List<User> allUsers = [
    User(
      firstName: "kelly", 
      lastName: "moon", 
      email: "kellymoon@gmail.com", 
      password: "12345678", 
      completedWorkouts: [
        {
          "title" : "2024 Weight Loss Challenge",
          "done" : [1, 3]
        }
      ],
      gender: Gender.female
    )
  ];

  // user who logged in credentials
  User loggedInUser = User(
    firstName: 'User', 
    lastName: '', 
    email: '', 
    password: '', 
    completedWorkouts: []
  );

  // for wrong inputs
  User emptyUser = User(
    firstName: '', 
    lastName: '', 
    email: '', 
    password: '', 
    completedWorkouts: []
  );

  // check user credentials when logging in
  bool userLoginCreds(String inputEmail, String inputPassword){
    var cred = allUsers.firstWhere(
      (element) => element.email == inputEmail,
      orElse: () => emptyUser
    );

    if(cred == emptyUser){
      return false;
    }

    if(inputPassword != cred.password){
      return false;
    }

    return true;
  }

  // set the current logged in user
  void setCurrentUser(String email){
    User thisUser = allUsers.firstWhere(
      (element) => element.email == email
    );
    loggedInUser.firstName = thisUser.firstName;
    loggedInUser.lastName = thisUser.lastName;
    loggedInUser.email = thisUser.email;
    loggedInUser.completedWorkouts = thisUser.completedWorkouts;
    loggedInUser.gender = thisUser.gender;
    notifyListeners();
  }

  // new user sign up
  void newUser(String firstName, String lastName, String email, String password, Gender gender){
    allUsers.add(
      User(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        completedWorkouts: [
          {
            "id" : 1,
            "days" : [{
                1 : 1,
                2 : 1
              },
              {
                3 : 1,
                1 : 0,
              },
              0,
              {
                2 : 0,
                4 : 0,
              },
              {
                1 : 0,
                4 : 0
              }
            ]
          }
        ],
        gender: gender
      )
    );
    notifyListeners();
  }

  // duplicate email
  String isDuplicateEmail(String inputEmail){
    var duplicate = allUsers.indexOf(
      allUsers.firstWhere(
        (element) {
          return element.email == inputEmail;
        },
        orElse: () => emptyUser
      )
    );

    if(duplicate != -1) return "This email has been taken";

    return "";
  }

}