import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ott110/data/models/user_model.dart';
import 'package:ott110/presentation/provider/main_tab_provider.dart';
import 'package:ott110/presentation/provider/select_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProfileProvider extends ChangeNotifier {

  final TextEditingController textController = TextEditingController();
  final UserModel oldUserModel;

  UserModel userModel;

  AddProfileProvider({required this.userModel}) : oldUserModel = userModel {
    textController.text = userModel.userName;
    notifyListeners();
  }

  void setUserName() {
    userModel = UserModel(
        userId: userModel.userId,
        userName: textController.text,
        backgroundColor: userModel.backgroundColor);
    notifyListeners();
  }

  Future<void> updateUser() async {
    final sharedPref = await SharedPreferences.getInstance();

    final oldUserList = sharedPref.getStringList('user_list') ?? [];

    final userIndex = oldUserList.indexWhere((element) {
      final currentUser = UserModel.fromJson(json: jsonDecode(element));
      return currentUser.userId == oldUserModel.userId;
    },);

    if (userIndex != -1) {
      final jsonString = jsonEncode(userModel.toJson());

      oldUserList[userIndex] = jsonString;

      sharedPref.setStringList('user_list', oldUserList);
    }
// 의존성을 낮추고 결합도를 높여라
    await selectProfileProvider.loadUser();
    mainTabProvider.updateProfile(userModel);
    notifyListeners();
  }
}