import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ott110/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateProvider extends ChangeNotifier {
  final TextEditingController textController = TextEditingController();

  UserModel userModel;

  CreateProvider({required this.userModel});

  void setUserName() {
    userModel = UserModel(
        userId: DateTime.now().millisecondsSinceEpoch,
        userName: textController.text,
        backgroundColor: userModel.backgroundColor);
    notifyListeners();
  }

  Future<void> saveUser() async {
    final sharedPref = await SharedPreferences.getInstance();

    final oldUserList = sharedPref.getStringList('user_list') ?? [];
    log(oldUserList.length.toString());

    final jsonString = jsonEncode(userModel.toJson());

    oldUserList.add(jsonString);

    sharedPref.setStringList('user_list', oldUserList);
  }
}
