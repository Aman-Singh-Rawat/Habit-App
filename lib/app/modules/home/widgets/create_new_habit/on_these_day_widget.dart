import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_child_widget.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class OnTheseDayWidget extends StatelessWidget {
  const OnTheseDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // On These Days top text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // On These Days text
            SectionTitle(text: AppStrings.onTheseDay),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.allDay,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(width: AppSpacing.sm),

                Obx(
                  () => Checkbox(
                    value: controller.allDay.value,
                    onChanged: controller.toggleAllDay,
                  ),
                ),
              ],
            ),
          ],
        ).paddingOnly(
          left: AppSpacing.bf,
          right: AppSpacing.bf,
          top: AppSpacing.xl,
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: AppLists.weekDayPrefixLetter
                  .asMap()
                  .entries
                  .map(
                    (letter) => ChooseIconChildWidget(
                      width: 50,
                      height: 50,
                      fontSize: 25,
                      onItemClick: () =>
                          controller.onSelectedDayChoose(letter.key+1),
                      isSelected: controller.isSelectedDayContains(letter.key+1),
                      item: AppLists.weekDayPrefixLetter[letter.key],
                    ).paddingOnly(right: 10.w),
                  )
                  .toList(),
            ),
          ),
        ).paddingOnly(left: 20.w, top: AppSpacing.lg),
      ],
    );
  }
}
