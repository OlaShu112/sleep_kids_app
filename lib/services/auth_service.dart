import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false; // ✅ Private variable

  bool get isLoggedIn => _isLoggedIn; // ✅ Public getter for 'isLoggedIn'

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
