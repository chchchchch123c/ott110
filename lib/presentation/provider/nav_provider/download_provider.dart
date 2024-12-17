import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

final downloadProvider = DownloadProvider();

class DownloadProvider extends ChangeNotifier {

  bool isWifi = false;

  DownloadProvider() {
    const MethodChannel('kr.mad.ott.ott110').setMethodCallHandler((call) async {
      if (call.method == 'wifi_status_change') {
        isWifi = call.arguments ;
        notifyListeners();
      }
    });
  }
}