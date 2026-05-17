import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/secondary_button_text.dart';
import 'package:habitly/app/core/extensions/string_extension.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/custom_calendar_widget.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/switch_plus_title.dart';
import 'package:habitly/app/modules/widgets/buttons/action_button_row.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';
import 'package:habitly/app/modules/widgets/others/filter_widget.dart';
import 'package:habitly/app/modules/widgets/text_field/date_time_field_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../widgets/bottom_seets/show_calendar_bottom_sheet.dart';
import '../../../widgets/custom_drag_handle_widget.dart';
import '../../../widgets/others/build_calendar.dart';

class EndHabitOnWidget extends StatelessWidget {
  const EndHabitOnWidget({super.key});

  Widget _buildItem(int index) {
    final controller = RegularHabitController.instance;
    final selected = controller.selectedEndHabitIndex.value == index;

    final title = index == 0 ? strDate : strDays;

    return GestureDetector(
      onTap: () => controller.onEndHabitOnFilterTabTap(index),
      child: SizedBox(
        width: double.infinity,
        child: FilterWidget(
          isSelected: selected,
          itemName: title,
          padding: EdgeInsets.symmetric(
            horizontal: width_19,
            vertical: height_13,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final controller = CreateNewHabitController.instance;
    final controller = RegularHabitController.instance;

    return Obx(() {
      final isSelected = controller.isEndHabitOn.value;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchPlusTitle(
            isSelected: isSelected,
            title: strEndHabitOn,
            onChanged: controller.onEndHabitOn,
          ),

          if (isSelected) ...[
            Row(
              children: [
                Expanded(child: _buildItem(0)),
                SizedBox(width: width_16),
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

                      ActionButtonsRow(
                        primaryText: strOk,
                        primaryOnTap: () =>
                            controller.handleEndHabitOnOkClick(context),
                        secondaryText: strCancel,
                        secondaryOnTap: Get.back,
                      ).paddingOnly(bottom: height_10),
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
