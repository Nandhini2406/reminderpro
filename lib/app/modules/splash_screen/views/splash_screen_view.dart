import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import '/app/theme/color_theme.dart';
import '/app/theme/text_theme.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<SplashScreenController>(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset(
                  'assets/lottie/work-from-home.json',
                  controller: _.animationController,
                  frameRate: const FrameRate(60),
                  repeat: true,
                  onLoaded: (composition) {
                    _.animationController.duration = composition.duration;
                  },
                ),
              ),
              const SizedBox(height: 80.0),
              Text(
                'Reminder Pro',
                style: kHeadTextStyle.copyWith(
                  color: primaryGrey,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
