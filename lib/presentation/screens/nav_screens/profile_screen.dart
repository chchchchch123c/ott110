import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/main_tab_provider.dart';
import 'package:ott110/presentation/provider/select_provider.dart';
import 'package:ott110/presentation/screens/nav_screens/add_screen/add_profile_screen.dart';

import '../../../data/models/user_model.dart';
import '../create_profile_screen.dart';

class ProfileScreen extends BaseScreen2<MainTabProvider, SelectProfileProvider> {
  ProfileScreen({super.key})
      : super(provider1: mainTabProvider, provider2: selectProfileProvider);

  @override
  void initState(BuildContext context) {
    super.initState(context);
    provider1;
    provider2;
    provider2.loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          '프로필',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: provider2.userList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      provider2.updateSelectProfile(provider2.userList[index]);
                      provider1.changeCurrentTab(0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: (provider2.userList[index].userId ==
                                  provider1.profile?.userId)
                              ? Border.all(color: Colors.white, width: 2)
                              : null,
                          color: provider2.userList[index].backgroundColor,
                        ),
                        child: Center(
                          child: Text(
                            provider2.userList[index].userName.isNotEmpty
                                ? provider2.userList[index].userName[0]
                                : '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: GestureDetector(
                onTap: () async {
                  // log('select_profile_screen => edit_profile_screen');
                  await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return CreateProfileScreen(
                      oldUserModel: UserModel.defaultUserModel(),
                    );
                  },));
                  provider2.loadUser();
                },
                child: Center(
                  child: const Column(
                    children: [
                      Icon(Icons.add_circle_outline, color: Colors.white, size: 50,),
                      Text('프로필 추가', style: TextStyle(color: Colors.white, fontSize: 16),),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("일반 설정", style: TextStyle(color: navigatorOrangeColor, fontSize: 30),),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent, // 없는 영역 클릭 가능
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProfileScreen(),));
              },
                child: divObject(text: '프로필 수정'),
            ),
            divObject(text: '언어 변경'),
            divObject(text: '개 기기 연결하기'),
            divObject(text: '앱 권한 설정'),
            divObject(text: '로그아웃'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("앱 정보", style: TextStyle(color: navigatorOrangeColor, fontSize: 30),),
            ),
            divObject(text: '개인정보 수집 및 이용'),
            divObject(text: '이용 약관 동의'),
            divObject(text: '개인정보처리방침'),
            divObject(text: '오픈소스 활용 안내'),
            divObject(text: '기타 문의'),
          ],
        ),
      ),
    );
  }

  Widget divObject({required text}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 8),
          child: Row(
            children: [
              Text(text, style: TextStyle(color: Colors.white, fontSize: 18),),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20,)
            ],
          ),
        ),
        const Divider(thickness: 1, indent: 25, endIndent: 25,),
      ],
    );
  }

}

