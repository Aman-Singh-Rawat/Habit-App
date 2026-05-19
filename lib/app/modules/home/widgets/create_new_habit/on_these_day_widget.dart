import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_child_widget.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class OnTheseDayWidget extends StatelessWidget {
  const OnTheseDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// ON THESE DAY [TITLE];
        _onTheseDayTitle(context),

        /// ON THESE DAY [WEEKDAY_PREFIX_LETTER] widget
        _onTheseDayChild(),
      ],
    );
  }

  Widget _onTheseDayChild() {
    final controller = RegularHabitController.instance;
    final weekDays = AppLists.weekDayPrefixLetter;

    return SizedBox(
      height: height_50,
      child: ListView.separated(
        cacheExtent: height_50,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => AppGaps.width10,
        itemCount: weekDays.length,
        itemBuilder: (context, index) {
          return Obx(() {
            return ChooseIconChildWidget(
              width: width_50,
              height: height_50,
              fontSize: font_25,
              item: weekDays[index],
              onItemClick: () => controller.onRepeatSelectedDayChoose(index),
              isSelected: controller.repeatSelectedDaysList.value.contains(
                index + 1,
              ),
            ).paddingOnly(
              left: index == 0 ? width_20 : 0,
              right: index == weekDays.length - 1 ? width_20 : 0,
            );
          });
        },
      ),
    ).paddingOnly(top: height_12);
  }

  Widget _onTheseDayTitle(BuildContext context) {
    final controller = RegularHabitController.instance;

    return Padding(
      padding: EdgeInsets.only(left: width_20, right: width_20, top: height_24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// ON THESE DAY [TITLE]
          SectionTitle(text: strOnTheseDay, isRequired: true,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// checkbox text[];
              Text(
                strAllDay,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontWeight: .w500),
              ),

              AppGaps.width8,

              /// checkbox[]
              Obx(
                () => Checkbox(
                  value: controller.isOnTheseDayCheckboxSelected.value,
                  onChanged: controller.handleOnAllDayCheckboxClick,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
