import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/dialogs/color_picker_dialog.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/widgets/others/color_picker_indicator.dart';
import 'package:habitly/app/modules/widgets/others/custom_color_picker_button.dart';
import 'package:habitly/app/modules/widgets/texts/decorated_text_title.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

import '../../../../core/constants/app_constants.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegularHabitController.instance;
    final size = width_50;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        /// Color Section Title [COLOR]
        SectionTitle(
          isRequired: true,
          text: strColor,
        ).paddingOnly(top: height_20, bottom: height_14),

        // Swatches + picker button
        Obx(
          () => Wrap(
            spacing: width_18,
            runSpacing: height_10,
            children: [
              ...List.generate(AppLists.habitlyColors.length, (index) {
                final isSelected =
                    !controller.isColorPickerSelected.value &&
                    controller.selectedColorIndex.value == index;
                return GestureDetector(
                  onTap: () => controller.onColorSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppLists.habitlyColors[index],
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.transparent,
                        width: width_2,
                      ),
                    ),
                    child: isSelected
                        ? Center(
                            child: Container(
                              width: width_12,
                              height: width_12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [
                                  AppColors.chetwode.s800,
                                  AppColors.chetwode.s900,
                                  AppColors.primary,
                                  AppColors.chetwode.s950,
                                  AppColors.primaryDark
                                ]),
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              }),

              // Custom color picker button
              CustomColorPickerButton()
            ],
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: width_20);
  }
}
