import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/nav_provider/download_provider.dart';

class DownloadScreen extends BaseScreen<DownloadProvider> {
  DownloadScreen({super.key}) : super(provider: downloadProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          '다운로드',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: navigatorColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  provider.isWifi
                      ? 'assets/images/report_problem_black_24dp.png'
                      : 'assets/images/portable_wifi_off_black_24dp.png',
                  width: 70,
                  height: 70,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  provider.isWifi ?
                  '다운로드 가능한 영화가 없습니다.\n다운로드 등록 후 이용하세요.' : 'WIFI가 꺼져 있습니다.\nWIFI 연결 후 이용해주세요.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
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
                    'WIFI 설정하기',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
