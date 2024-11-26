import 'package:flutter/material.dart';
import 'package:media_player/helper/shr_helper.dart';

class Homeprovider extends ChangeNotifier {
  bool isCheck = true;
  bool isdarkmode = true;
  void check() {
    isCheck = !isCheck;
    notifyListeners();
  }

  void changeTheme(bool val) {
    isdarkmode = val;
    ShrHelper.shrHelper.themeset(val);
    notifyListeners();
  }

  Future<void> checkTheme() async {
    bool? val = await ShrHelper.shrHelper.themeget();
    isdarkmode = val!;
    notifyListeners();
  }
}
