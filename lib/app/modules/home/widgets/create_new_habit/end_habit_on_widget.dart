import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/secondary_button_text.dart';
import 'package:habitly/app/core/extensions/string_extension.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/custom_calendar_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/switch_plus_title.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';
import 'package:habitly/app/modules/widgets/others/filter_widget.dart';
import 'package:habitly/app/modules/widgets/text_field/date_time_field_widget.dart';
import 'package:iconsax/iconsax.dart';

class EndHabitOnWidget extends StatelessWidget {
  const EndHabitOnWidget({super.key});

  Widget _buildItem(int index) {
    final controller = CreateNewHabitController.instance;
    final selected = controller.selectedEndHabitIndex.value == index;

    final title = index == 0
        ? AppStrings.date
        : AppStrings.days.capitalizeFirst;

    return GestureDetector(
      onTap: () => controller.onEndHabitDateDays(index),
      child: SizedBox(
        width: double.infinity,
        child: FilterWidget(
          isSelected: selected,
          itemName: title,
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;

    return Obx(() {
      final isSelected = controller.endHabitOn.value;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchPlusTitle(
            isSelected: isSelected,
            title: AppStrings.endHabitOn,
            onChanged: controller.onEndHabitOn,
          ),

          if (isSelected) ...[
            Row(
              children: [
                Expanded(child: _buildItem(0)),
                SizedBox(width: AppSpacing.lg),
                Expanded(child: _buildItem(1)),
              ],
            ).paddingSymmetric(vertical: AppSpacing.bf),

            Obx(() {
              final bool isDaySelected =
                  controller.selectedEndHabitIndex.value == 0;

              return DateTimeFieldWidget(
                controller: controller.endHabitDatePickerController,
                onTap: () => showCalendarBottomSheet(
                  context: context,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Obx(
                          () => buildCalendar(
                            context: context,
                            showHeader: true,
                            firstDay: DateTime.now(),
                            focusedDay: controller.endHabitFocusedDay.value,
                            selectedDayPredicate:
                                controller.onSelectedDayPredicate,
                            onDaySelected: controller.onSingleDaySelected,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              buttonText: AppStrings.cancel,
                              onClick: controller.handleEndHabitOnCancelClick,
                              textColor: context.secondaryButtonTextColor,
                              backgroundColor: context.secondaryBackgroundColor,
                            ),
                          ),
                          const SizedBox(width: 17),
                          Expanded(
                            child: CustomElevatedButton(
                              buttonText: AppStrings.ok,
                              onClick: controller.handleEndHabitOnOkClick,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                prefixIcon: isDaySelected ? Iconsax.calendar_tick4 : Icons.sync,
                suffixIcon: Iconsax.edit_2,
              );
            }),
          ],
        ],
      );
    });
  }
}

void showCalendarBottomSheet({
  required BuildContext context,
  required Widget child,
  double? height,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(28.r),
        topRight: Radius.circular(28.r),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: height ?? MediaQuery.sizeOf(context).height * 0.6,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),

            /// Border only on top
            border: Border(
              top: BorderSide(color: AppColors.aboutUserDarkBorder),
              left: BorderSide(color: AppColors.aboutUserDarkBorder),
              right: BorderSide(color: AppColors.aboutUserDarkBorder),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Drag handle
                  Container(
                    width: 40.w,
                    height: 3.5.h,
                    margin: EdgeInsets.only(bottom: AppSpacing.md),
                    decoration: BoxDecoration(
                      color: AppColors.darkSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
