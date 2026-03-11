import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingThreeIndicators extends StatelessWidget {
  const OnboardingThreeIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = OnboardingController.instance;
    return Positioned(
      bottom: 25,
      left: 0,
      right: 0,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final isSelected = controller.currentPageIndex.value == index;
            return AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: isSelected ? 38.0 : 8.0,
              height: 8.0,
              margin: EdgeInsets.only(right: index != 2 ? 9 : 0),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AHelperFunction.isDarkMode(context)
                    ? AppColors.darkSecondaryColor
                    : AppColors.indicatorGrey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ),
    );
  }
}
