import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/create_provider.dart';

import '../../data/models/user_model.dart';

class CreateProfileScreen extends BaseScreen<CreateProvider> {
  CreateProfileScreen({super.key, required UserModel oldUserModel})
      : super(provider: CreateProvider(userModel: oldUserModel));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        title: const Text(
          '프로필 추가',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: provider.userModel.backgroundColor,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: Text(
                provider.userModel.userName.isNotEmpty
                    ? provider.userModel.userName[0]
                    : '',
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: navigatorColor),
              width: MediaQuery.sizeOf(context).width,
              child: TextField(
                onTap: () {
                  log(provider.userModel.userName);
                },
                onChanged: (value) {
                  provider.setUserName();
                },
                decoration: const InputDecoration(border: InputBorder.none),
                style: const TextStyle(color: Colors.white),
                controller: provider.textController,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () async {
                await provider.saveUser();
                Navigator.of(context).pop();
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFFF87105),
                        Color(0xFFF1AD05),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '저장하기',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}