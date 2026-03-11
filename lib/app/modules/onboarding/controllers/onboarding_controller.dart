import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// variables
  final PageController pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  void onPageChanged(int selectedIndex) {
    currentPageIndex.value = selectedIndex;
  }

  void onNextPage() {
    if (currentPageIndex.value < 3) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.toNamed(AppRoutes.welcome);
    }
  }

  void onSkip() {
    currentPageIndex.value = 2;
    Get.toNamed(AppRoutes.welcome);
  }
}
