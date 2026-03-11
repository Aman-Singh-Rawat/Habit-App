import 'dart:async';

import 'package:get/get.dart';

import '../../../core/constants/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    
    print('11 SplashController onReady called');
    super.onReady();
    _startTimer();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 2));

    final bool isLoggedIn = false; // Replace with real auth check

    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.onboarding);
    } else {
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }

  void _startTimer() {
    print('SplashController onReady called');
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.onboarding);
    });
  }
}
