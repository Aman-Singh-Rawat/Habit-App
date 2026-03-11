import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/user_setup/controllers/influenced_controller.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_progress_bar.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_step_text.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/user_setup_title_subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:habitly/app/modules/widgets/appbar/custom_appbar.dart';
import 'package:habitly/app/modules/widgets/others/bottom_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/expanded_button.dart';

class InfluencedYouScreen extends GetView<InfluencedController> {
  const InfluencedYouScreen({super.key});

  CustomAppbar appBar() {
    return CustomAppbar(
      title: UserSetupProgressBar(currentStep: 6),
      actions: [UserSetupStepText(currentStep: 6)],
    );
  }

  Widget bodyWidget(BuildContext context) {
    final bool isDark = AHelperFunction.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          UserSetupTitleSubtitleWidget(
            firstText: AppStrings.whatInfluencedYouToBecome,
            secondText: AppStrings.organized,
            thirdText: AppStrings.whatInfluencedYouQuestionMark,
            subtitle: AppStrings.organizationSubtitle,
          ),

          SizedBox(height: AppSpacing.xxl),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: AppSpacing.lg.h),
              itemCount: controller.options.length,
              itemBuilder: (BuildContext context, int index) {
                final option = controller.options[index];
                return GestureDetector(
                  onTap: () => controller.toggleIndex(index),
                  child: Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 17.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: controller.isSelected(index)
                              ? AppColors.primary
                              : isDark
                              ? AppColors.aboutUserDarkBorder
                              : AppColors.borderColor,

                          width: 1.w,
                        ),
                        color: isDark
                            ? AppColors.containerBackgroundColor
                            : AppColors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            option['emoji'] as String,
                            style: TextStyle(fontSize: 24.sp),
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            option['label'] as String,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
          child: ExpandedButton(
            text: AppStrings.continueText,
            onPressed: () => Get.toNamed(AppRoutes.achieve),
          ),
        ),
      ),
    );
  }
}
