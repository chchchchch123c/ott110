import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ott110/data/models/user_model.dart';
import 'package:ott110/presentation/provider/main_tab_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final selectProfileProvider = SelectProfileProvider();

class SelectProfileProvider extends ChangeNotifier {

  List<UserModel> userList = [];

  Future<void> loadUser() async {
    userList.clear(); // userList 를 초기화 해줌.
    final sharedPref = await SharedPreferences.getInstance();
    final userJsonList = sharedPref.getStringList('user_list') ?? [];

    for (var value in userJsonList) {
      final userModel = UserModel.fromJson(json: jsonDecode(value));
      userList.add(userModel);
    }

    if (userList.isNotEmpty && mainTabProvider.profile == null) {
      mainTabProvider.updateProfile(userList.first);
    }
    notifyListeners();
  }

  void updateSelectProfile(UserModel updateSelectedProfile) {
    mainTabProvider.updateProfile(updateSelectedProfile);
    notifyListeners();
  }

}