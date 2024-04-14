import 'package:flutter/material.dart';

class User {
  String email;
  bool isAdmin;

  User({
    required this.email,
    required this.isAdmin,
  });
}

class UserModel extends ChangeNotifier {
  User? user;

  UserModel();

  void setUser(User userData) {
    user = userData;
    notifyListeners();
  }

  void removeUser() {
    user = null;
    notifyListeners();
  }
}
