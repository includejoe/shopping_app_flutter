import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _screenIndex = 0;

  int get screenIndex => _screenIndex;

  set screenIndex(int index) {
    _screenIndex = index;
    notifyListeners();
  }
}