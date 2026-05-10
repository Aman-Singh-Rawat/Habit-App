// icon_row_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/emoji_icon_data.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_child_widget.dart';
import 'package:habitly/app/modules/home/widgets/show_choose_icon_bottom_sheet.dart';

import '../../../core/values/app_values.dart';
import 'create_new_habit/preview_box.dart';

class IconRowWidget extends StatelessWidget {
  const IconRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegularHabitController.instance;

    return Obx(() {
      final selected = controller.selectedEmojiOrIcon;
      final selectedIconIdx = controller.iconSelectedIndex.value;
      final totalItems = EmojiList.icons.length + 1;

      return SizedBox(
        height: height_65,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: totalItems,
          separatorBuilder: getSeparatedBuilderWidget,
          itemBuilder: (context, index) {
            if (index == 0) return PreviewBox(selected: selected);

            final emojiIndex = index - 1;
            return ChooseIconChildWidget(
              onItemClick: () => controller.onIconSelected(emojiIndex),
              isSelected: selectedIconIdx == emojiIndex,
              fontSize: font_32,
              item: EmojiList.icons[emojiIndex].emoji,
            );
          },
        ),
      );
    });
  }


  Widget getSeparatedBuilderWidget(BuildContext context, int index) {
    return index == 0
        ? Row(
      children: [
        const SizedBox(width: AppSpacing.md),
        VerticalDivider(
          width: width_1,
          thickness: 1,
          indent: height_8,
          endIndent: height_8,
        ),
        const SizedBox(width: AppSpacing.md),
      ],
    )
        : const SizedBox(width: AppSpacing.sm);
  }
}
