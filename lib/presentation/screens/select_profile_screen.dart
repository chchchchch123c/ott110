import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/data/models/user_model.dart';
import 'package:ott110/presentation/provider/main_tab_provider.dart';
import 'package:ott110/presentation/provider/select_provider.dart';
import 'package:ott110/presentation/screens/create_profile_screen.dart';
import 'package:ott110/presentation/screens/main_tab_screen.dart';

class SelectProfileScreen extends BaseScreen<SelectProfileProvider> {
  SelectProfileScreen({super.key}) : super(provider: selectProfileProvider);

  @override
  void initState(BuildContext context) {
    super.initState(context);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        provider;
        provider.loadUser();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text(
            '시청할 프로필을 선택하세요.',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            provider.userList.isEmpty
                ? Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: navigatorColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        '등록된 프로필이 없습니다.\n 프로필 추가 후 이용가능 합니다.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Container(
              alignment: Alignment.center,
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: provider.userList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      log("choice ${index + 1}, it's name is ${provider.userList[index].userName}");
                      mainTabProvider.selectProfile(provider.userList[index]);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainTabScreen(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          color: provider.userList[index].backgroundColor,
                        ),
                        child: Center(
                          child: Text(provider.userList[index].userName.isNotEmpty ? provider.userList[index].userName[0] : '',
                          style: const TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            GestureDetector(
              onTap: () async {
                // log('select_profile_screen => edit_profile_screen');
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return CreateProfileScreen(
                      oldUserModel: UserModel.defaultUserModel(),
                  );
                },));
                provider.loadUser();
              },
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Icon(Icons.add_circle_outline, color: Colors.white, size: 50,),
                  ),
                  Text('프로필 추가', style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
