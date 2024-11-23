import 'package:flutter/material.dart';

class Homeprovider extends ChangeNotifier {
  bool isCheck = false;

  void check() {
    isCheck = !isCheck;
    notifyListeners();
  }
}
