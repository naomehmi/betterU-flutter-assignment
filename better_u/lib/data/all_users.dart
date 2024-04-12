import 'package:flutter/material.dart';

class AllUsers extends ChangeNotifier {
  final List<Map<String,dynamic>> users = [
    {
      "first name" : "kelly",
      "last name" : "moon",
      "email" : "kellymoon@gmail.com",
      "password" : "12345678"
    }
  ];

  bool login(email, password){
    var cred = users.firstWhere((e) => e["email"] == email, orElse: () => {"result" : -1});
    if(cred == {"result" : -1}) {
      return false;
    } else{
      if(password != cred["password"]) {
        return false;
      }
      return true;
    }
  }

  void newUser(fn, ln, e, pw) {
    print("hmm");
    users.add({"first name" : fn, "last name" : ln, "email" : e, "password" : pw});
    print(users);
    notifyListeners();
  }

  String validateEmail(email){
    var duplicate = users.indexOf(users.firstWhere((e) => e["email"] == email, orElse: () => {"result" : -1}));
    if(duplicate != -1){
      return "This email has been taken";
    }
    return "";
  }
}