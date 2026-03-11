import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/authentication/controllers/signup_controller.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => Checkbox(
            value: controller.isTermsAndConditionCheck.value,
            onChanged: (value) => controller.changeCheckBoxSelection(value),
          ),
        ),
        SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontSize: 14),
              text: AppStrings.agreeToTerms,
              children: [
                TextSpan(
                  text: AppStrings.termsAndConditions,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
