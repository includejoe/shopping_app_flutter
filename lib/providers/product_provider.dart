import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int _activeScreen = 0;
  List<dynamic> _sneakerSizes = [];
  List<String> _sizes = [];

  int get activeScreen => _activeScreen;

  set activeScreen(int newIndex) {
    _activeScreen = newIndex;
    notifyListeners();
  }

  List get sneakerSizes => _sneakerSizes;

  set sneakerSizes(List<dynamic> newSizes) {
    _sneakerSizes = newSizes;
    notifyListeners();
  }

  void toggleSize(int index) {
    for(int i = 0; i < _sneakerSizes.length; i++) {
      if(i == index) {
        _sneakerSizes[i]["isSelected"] = !_sneakerSizes[i]['isSelected'];
      }
    }
    notifyListeners();
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }
}