import 'package:flutter/material.dart';

class SleepProvider with ChangeNotifier {
  bool _isSleeping = false;

  bool get isSleeping => _isSleeping;

  void startSleeping() {
    _isSleeping = true;
    notifyListeners();
  }

  void wakeUp() {
    _isSleeping = false;
    notifyListeners();
  }
}
