import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/user_setup/controllers/contract_controller.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_progress_bar.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_step_text.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_title_subtitle_widget.dart';
import 'package:flutter/material.dart';

import 'package:signature/signature.dart';
import 'package:habitly/app/modules/widgets/appbar/custom_appbar.dart';
import 'package:habitly/app/modules/widgets/others/bottom_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/expanded_button.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  CustomAppbar appBar() {
    return CustomAppbar(
      title: UserSetupProgressBar(currentStep: 8),
      actions: [UserSetupStepText(currentStep: 8)],
    );
  }

  Widget bodyWidget(BuildContext context) {
    final bool isDark = AHelperFunction.isDarkMode(context);
    return GetBuilder<ContractController>(
      builder: (controller) {
        // Reinitialize when theme changes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final currentIsDark = AHelperFunction.isDarkMode(context);
          final penColor = controller.signatureController.penColor;
          final expectedColor = currentIsDark
              ? Colors.white
              : AppColors.darkScaffoldBacgroundColor;

          if (penColor != expectedColor) {
            controller.reinitializeOnThemeChange();
          }
        });

        return Padding(
          padding: EdgeInsets.only(right: 17.w, left: 17.w, bottom: 100.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                UserSetupTitleSubtitleWidget(
                  firstText: AppStrings.contractTitle,
                  secondText: AppStrings.contract,
                  thirdText: AppStrings.contractEmoji,
                  subtitle: AppStrings.reviewAndSignCommitment,
                ),

                SizedBox(height: AppSpacing.xxl + 20.h),

                Column(
                  children: AppLists.contractLines
                      .map((text) => CommitementItem(text: text))
                      .toList(),
                ),

                SizedBox(height: AppSpacing.xxl.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.signUsingFinger),
                    IconButton(
                      onPressed: controller.clearController,
                      icon: Icon(Icons.refresh_rounded, size: 28.w),
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  height: 250.h,
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.containerBackgroundColor
                        : AppColors.textFieldBackground,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: isDark
                          ? AppColors.aboutUserDarkBorder
                          : AppColors.borderColor,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Signature(
                    controller: controller.signatureController,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: appBar(),
        body: bodyWidget(context),
        bottomSheet: BottomWidget(
          child: ExpandedButton(text: AppStrings.finish),
        ),
      ),
    );
  }
}

class CommitementItem extends StatelessWidget {
  const CommitementItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 2,
            height: 2,
            decoration: BoxDecoration(
              color: context.onboardingSubtitleColor,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 10.w),
          ),
          Expanded(child: Text(text, style: TextStyle(height: 1.4))),
        ],
      ),
    );
  }
}
