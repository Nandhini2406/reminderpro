import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../theme/color_theme.dart';
import '../theme/text_theme.dart';
import 'login_screen.dart';

class SplashScreenView extends StatefulWidget {
  
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // spalsh animation config
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    Timer(
      Duration(milliseconds: 5500),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const LoginScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset(
                'assets/lottie/work-from-home.json',
                controller: animationController,
                frameRate: const FrameRate(60),
                repeat: true,
                onLoaded: (composition) {
                  animationController.duration = composition.duration;
                },
              ),
            ),
            const SizedBox(height: 80.0),
            Text(
              'Taskly',
              style: kHeadTextStyle.copyWith(
                color: primaryGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
