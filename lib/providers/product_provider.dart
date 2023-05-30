import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activeScreen = 0;

  int get activeScreen => _activeScreen;

  set activeScreen(int newIndex) {
    _activeScreen = newIndex;
    notifyListeners();
  }
}