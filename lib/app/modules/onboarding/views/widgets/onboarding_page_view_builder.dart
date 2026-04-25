import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/onboarding/controllers/onboarding_controller.dart';

import '../../../../core/constants/text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../widgets/clippers/top_concave_clipper.dart';

class OnboardingPageViewBuilder extends StatelessWidget {
  const OnboardingPageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainWidget();
  }

  Widget _mainWidget() {
    final controller = OnboardingController.instance;

    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(
        overscroll: false,
      ),
      child: PageView.builder(
        physics: const ClampingScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        itemCount: AppLists.onboardingList.length,
        itemBuilder: (_, index) {
          return Stack(
            children: [
              // onboarding image
              _animatedContainerImage(index),
      
              // onboarding bottom widget
              _onboardingBottomWidget(),
            ],
          );
        },
      ),
    );
  }

  Positioned _onboardingBottomWidget() {
    final controller = OnboardingController.instance;
    final isDark = AHelperFunction.isDarkMode(Get.context!);

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipPath(
        clipper: TopConcaveClipper(),
        child: Container(
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkScaffoldBacgroundColor
                : AppColors.white,
          ),
          padding: EdgeInsets.only(
            left: 17.w,
            right: 17.w,
            top: 40.h,
            bottom: 60.h,
          ),
          child: Obx(() {
            final item =
                AppLists.onboardingList[controller.currentPageIndex.value];
            return Column(
              children: [
                // onboarding title
                AnimatedOpacityTextWidget(
                  child: Text(
                    item.title.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.onboardingTitle.copyWith(
                      color: isDark ? AppColors.white : AppColors.textDark,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // onboarding subtitle
                AnimatedOpacityTextWidget(
                  child: Text(
                    item.subtitle.tr,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.onboardingSubtitle.copyWith(
                      color: isDark
                          ? AppColors.darkSecondaryTextColor
                          : AppColors.textGrey,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  AnimatedBuilder _animatedContainerImage(int index) {
    final controller = OnboardingController.instance;
    final item = AppLists.onboardingList[index];

    return AnimatedBuilder(
      animation: controller.pageController,
      builder: (context, child) {
        double value = 1.0;

        if (controller.pageController.position.haveDimensions) {
          value = controller.pageController.page! - index;
          value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
        }

        return Transform.scale(scale: value, child: child);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          image: DecorationImage(
            image: AssetImage(
              AHelperFunction.isDarkMode(Get.context!)
                  ? item.darkImage
                  : item.lightImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class AnimatedOpacityTextWidget extends StatelessWidget {
  final Widget child;

  const AnimatedOpacityTextWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;
    final isDark = AHelperFunction.isDarkMode(context);

    return AnimatedBuilder(
      animation: controller.pageController,
      builder: (context, child) {
        double value = 0;

        if (controller.pageController.position.haveDimensions) {
          value =
              controller.pageController.page! -
              controller.currentPageIndex.value;
        }

        // clamp for stability
        value = value.clamp(-1.0, 1.0);

        return Transform.translate(
          offset: Offset(value * 40, 0),
          // horizontal movement
          child: Opacity(
            opacity: (1 - value.abs()).clamp(0.0, 1.0),
            child: Transform.scale(
              scale: 1 - (value.abs() * 0.1),
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
