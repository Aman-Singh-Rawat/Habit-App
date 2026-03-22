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
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/widgets/others/color_picker_indicator.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateNewHabitController.instance;
    final size = 50.w;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 14.h),
          child: Text(
            AppStrings.color.toUpperCase(),
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: Colors.grey,
            ),
          ),
        ),

        // Swatches + picker button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            () => Wrap(
              spacing: 18.w,
              runSpacing: 10.h,
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
                          width: 2.5,
                        ),
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: 12.w,
                                height: 12.w,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : null,
                    ),
                  );
                }),

                // Custom color picker button
                Obx(() {
                  final isCustom = controller.isColorPickerSelected.value;
                  return GestureDetector(
                    onTap: () => ColorPickerDialog.show(),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // fills with picked color when active
                        color: isCustom
                            ? controller.selectedColor.value
                            : Colors.grey.shade100,
                        border: Border.all(
                          color: isCustom
                              ? controller.selectedColor.value
                              : Colors.grey.shade300,
                          width: isCustom ? 2.5 : 2,
                          // dashed via custom painter when inactive
                        ),
                      ),
                      child: Center(
                        child: isCustom
                            // white dot = same "selected" language as presets
                            ? Container(
                                width: 12.w,
                                height: 12.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: SweepGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.orange,
                                      Colors.yellow,
                                      Colors.green,
                                      Colors.blue,
                                      Colors.purple,
                                      Colors.red,
                                    ],
                                  ),
                                ),
                              )
                            // palette icon when nothing picked
                            : Icon(
                                Icons.palette_outlined,
                                size: 22.sp,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
