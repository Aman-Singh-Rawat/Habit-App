import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:habitly/app/modules/onboarding/views/widgets/onboarding_widget.dart';

class OnboardingPageViewBuilder extends StatelessWidget {
  const OnboardingPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = AHelperFunction.isDarkMode(context);
    final OnboardingController controller = Get.find();

    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: controller.onPageChanged,
      itemCount: AppLists.onboardingList.length,
      itemBuilder: (_, index) {
        final item = AppLists.onboardingList[index];
        return OnboardingWidget(
          title: item.title,
          subtitle: item.subtitle,
          image: isDark ? item.darkImage : item.lightImage,
        );
      },
    );
  }
}
