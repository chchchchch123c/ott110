import 'package:flutter/material.dart';
import 'package:ott110/common/base_screen.dart';
import 'package:ott110/common/colors.dart';
import 'package:ott110/presentation/provider/intro_provider.dart';
import 'package:ott110/presentation/screens/select_profile_screen.dart';

class IntroScreen extends BaseScreen<IntroProvider> {
  IntroScreen({super.key}): super(provider: introProvider);

  @override
  void initState(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      introProvider.startAnimation(() {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SelectProfileScreen(),));
      },);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          AnimatedSlide(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            offset: Offset(0, introProvider.animationWorldSkillsLogo ? 0 : -1),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                color: whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                child: Image.asset('assets/images/선수협회 로고.png'),
              ),
            ),
          ),
          const Spacer(flex: 1,),
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            opacity: introProvider.animationShowTimeLogo ? 1 : 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scaleY: 0.75,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [Colors.white30, Colors.white.withOpacity(0)])
                    ),
                  ),
                ),
                Image.asset('assets/images/showtime 로고.png', width: 150, height: 150,)
              ],
            ),
          ),
          const Spacer(flex: 2,)
        ],
      ),
    );
  }
}