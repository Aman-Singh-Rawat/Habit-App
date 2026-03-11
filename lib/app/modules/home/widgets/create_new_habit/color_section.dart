import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/dialogs/color_picker_dialog.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/widgets/others/color_picker_indicator.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(text: AppStrings.color).paddingOnly(
          left: AppSpacing.bf,
          top: AppSpacing.bf,
          bottom: AppSpacing.lg,
        ),

        GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: AppLists.habitlyColors.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
          ),
          itemBuilder: (context, index) {
            /// for color picker
            if (index == AppLists.habitlyColors.length) {
              return GestureDetector(
                onTap: () => ColorPickerDialog.show(),
                child: colorPickerIndicator(),
              );
            }

            // My Random colors
            return Obx(
              () => GestureDetector(
                onTap: () => controller.onColorSelected(index),
                child: Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? controller.selectedColor.value
                        : AppLists.habitlyColors[index],
                  ),
                  child: controller.selectedColorIndex.value == index
                      ? Center(
                          child: Icon(
                            CupertinoIcons.check_mark,
                            color: Colors.black,
                          ),
                        )
                      : null,
                ),
              ),
            );
          },
        ).paddingSymmetric(horizontal: 20.w),
      ],
    );
  }
}
