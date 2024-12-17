import 'package:flutter/cupertino.dart';
import 'package:ott110/data/models/user_model.dart';

final mainTabProvider = MainTabProvider();

class MainTabProvider extends ChangeNotifier {

  UserModel? profile;
  int currentTab = 0;

  void selectProfile(UserModel profile) {
    this.profile = profile;
    notifyListeners();
  }

  void changeCurrentTab(int newTab) {
    currentTab = newTab;
    notifyListeners();
  }

  void updateProfile(UserModel updateProfile) {
    profile = updateProfile;
    notifyListeners();
  }

}