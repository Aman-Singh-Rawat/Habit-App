import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';
import 'package:habitly/app/modules/mood_stat/widgets/mood_bottom_sheet_widget.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../home/widgets/create_new_habit/end_habit_on_widget.dart';
import '../widgets/buttons/custom_elevated_button.dart';

void moodBottomSheet({
  required String headline,
  required Widget listWidget,
  required Widget buttonWidget,
}) {
  showCalendarBottomSheet(
    context: Get.overlayContext!,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppSpacing.sm.h),

        Text(
          headline,
          textAlign: .center,

          style: Theme.of(
            Get.overlayContext!,
          ).textTheme.headlineMedium?.copyWith(fontSize: 19.sp, height: 1.7),
        ).paddingSymmetric(horizontal: 5.w),

        Divider().paddingSymmetric(vertical: AppSpacing.bf.h),

        // this is a list
        listWidget,

        Divider().paddingOnly(bottom: AppSpacing.lg),

        SizedBox(width: double.infinity, child: buttonWidget),

        SizedBox(height: 20.h),
      ],
    ),
  );
}

void showMoodEmojiStat(MoodStatController controller) {
  /*showMoodFeelingStat(controller);
  return;*/
  moodBottomSheet(
    headline: strHowIsYourMoodToday,
    listWidget: Expanded(
      child: Wrap(
        spacing: 32,
        runSpacing: 36,
        alignment: WrapAlignment.center,
        children: List.generate(AppLists.moodList.length, (index) {
          final moodItem = AppLists.moodList[index];

          return Obx(
            () => MoodBottomSheetWidget(
              emoji: moodItem.emoji,
              title: moodItem.title,
              isSelected: controller.selectedMoodIndex.value == index,
              onTap: () {
                controller.selectedMoodIndex.value = index;
              },
            ),
          );
        }),
      ),
    ),
    buttonWidget: Obx(() {
      final index = controller.selectedMoodIndex.value;

      final String btnText = index == -1
          ? '$strIFeel...'
          : '$strIFeel ${AppLists.moodList[index].title}';

      return CustomElevatedButton(
        buttonText: btnText,
        onClick: controller.handleMoodSelection,
      );
    }),
  );
}

void showMoodFeelingStat(MoodStatController controller) {
  moodBottomSheet(
    headline: strDescribeYourFeeling,
    listWidget: Expanded(
      child: SingleChildScrollView(
        child: Obx(
          () => Wrap(
            spacing: 18,
            runSpacing: 18,
            alignment: WrapAlignment.center,
            children: List.generate(AppLists.feelingsList.length, (index) {
              final feeling = AppLists.feelingsList[index];
              final isSelected = controller.selectedFeelingIndex.value == index;

              return GestureDetector(
                onTap: () {
                  controller.selectedFeelingIndex.value = index;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    border: !isSelected
                        ? Border.all(color: AppColors.aboutUserDarkBorder)
                        : null,
                    borderRadius: BorderRadius.circular(24.w),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 11.5.w,
                  ),
                  child: Text(
                    feeling,
                    style: Theme.of(
                      Get.context!,
                    ).textTheme.bodyMedium!.copyWith(fontWeight: .w600),
                  ),
                ),
              );
            }),
          ).paddingOnly(bottom: 8.h),
        ),
      ),
    ),
    buttonWidget: Obx(() {
      final index = controller.selectedFeelingIndex.value;

      final String btnText = index == -1
          ? '$strIFeel...'
          : '$strIFeel ${AppLists.feelingsList[index]}';

      return CustomElevatedButton(
        buttonText: btnText,
        onClick: controller.handleMoodSelection,
      );
    }),
  );
}
