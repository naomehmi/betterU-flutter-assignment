import 'package:flutter/material.dart';

class LoggedInUser extends ChangeNotifier{
  String firstName = "";
  String lastName = "";
  String email = "";

  void currentUser(fn, ln, e){
    firstName = fn;
    lastName = ln;
    email = ln;
    notifyListeners();
  }
}