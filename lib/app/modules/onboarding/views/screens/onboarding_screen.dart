import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:habitly/app/modules/onboarding/views/widgets/onboarding_bottom_widget.dart';
import 'package:habitly/app/modules/onboarding/views/widgets/onboarding_indicators.dart';
import 'package:habitly/app/modules/onboarding/views/widgets/onboarding_page_view_builder.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingScreenMainContent();
  }
}

class OnboardingScreenMainContent extends StatelessWidget {
  const OnboardingScreenMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    OnboardingPageViewBuilder(),

                    OnboardingThreeIndicators(),
                  ],
                ),
              ),

              // bottom widgets
              OnboardingBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
