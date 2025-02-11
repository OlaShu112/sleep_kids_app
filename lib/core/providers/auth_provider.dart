import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners(); // Notifies listeners about login status change.
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners(); // Notifies listeners about logout status change.
  }
}
