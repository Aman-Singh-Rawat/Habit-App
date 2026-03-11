import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/emoji_icon_data.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_child_widget.dart';

Widget iconHorizontalListWidget() {
  final controller = CreateNewHabitController.instance;
  return Obx(() {
    final selectedIndex = controller.regularHabitIconSelectedIndex.value;
    return SizedBox(
      height: 67.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ChooseIconChildWidget(
          onItemClick: () =>
              controller.regularHabitIconSelectedIndex.value = index,
          isSelected: selectedIndex == index,
          fontSize: 42,
          item: EmojiList.icons[index].emoji,
        ),
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.md),
        itemCount: EmojiList.icons.length,
      ),
    ).paddingOnly(left: 20.w);
  });
}
