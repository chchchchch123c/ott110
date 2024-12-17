import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/main_tab_provider.dart';
import 'package:ott110/presentation/provider/nav_provider/add_provider/add_profile_provider.dart';
import 'package:ott110/presentation/screens/nav_screens/coming_soon_screen.dart';
import 'package:ott110/presentation/screens/nav_screens/download_screen.dart';
import 'package:ott110/presentation/screens/nav_screens/home_screen.dart';
import 'package:ott110/presentation/screens/nav_screens/profile_screen.dart';
import 'package:ott110/presentation/screens/nav_screens/search_screen.dart';

class MainTabScreen extends BaseScreen2<MainTabProvider, AddProfileProvider> {
  MainTabScreen({super.key}) : super(provider1: mainTabProvider, provider2: AddProfileProvider(userModel: mainTabProvider.profile!));

  @override
  void initState(BuildContext context) {
    provider1;
    provider2;
    super.initState(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: IndexedStack(
        index: provider1.currentTab,
        children: [
          HomeScreen(),
          ComingSoonScreen(),
          DownloadScreen(),
          SearchScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 75,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          child: BottomNavigationBar(
            backgroundColor: navigatorColor,
            selectedItemColor: navigatorOrangeColor,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: provider1.currentTab,
            onTap: (value) {
              provider1.changeCurrentTab(value);
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.white, size: 28,),
                activeIcon: Icon(Icons.home_outlined, color: navigatorOrangeColor, size: 28,),
                label: 'Home',
                backgroundColor: backgroundColor,
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.playlist_play, color: Colors.white, size: 28,),
                activeIcon: Icon(Icons.playlist_play, color: navigatorOrangeColor, size: 28,),
                label: '공개예정',
                backgroundColor: backgroundColor,
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.download_outlined, color: Colors.white, size: 28,),
                activeIcon: Icon(Icons.download_outlined, color: navigatorOrangeColor, size: 28,),
                label: '다운로드',
                backgroundColor: backgroundColor,
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.white, size: 28,),
                activeIcon: Icon(Icons.search, color: navigatorOrangeColor, size: 28,),
                label: '검색',
                backgroundColor: backgroundColor,
              ),
              BottomNavigationBarItem(
                icon:
                Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                  color: provider1.profile!.backgroundColor,
                ),
                child: Center(
                  child: Text(provider1.profile!.userName.isNotEmpty ? provider1.profile!.userName[0] : '' ,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
                label: '프로필',
                backgroundColor: backgroundColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}