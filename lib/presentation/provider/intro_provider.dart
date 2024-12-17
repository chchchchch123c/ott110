import 'package:flutter/cupertino.dart';

final introProvider = IntroProvider();

class IntroProvider extends ChangeNotifier {

  bool animationWorldSkillsLogo = false;
  bool animationShowTimeLogo = false;

  void startAnimation(void Function() callback) async {
    animationWorldSkillsLogo = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    animationShowTimeLogo = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));

    callback();
  }

}