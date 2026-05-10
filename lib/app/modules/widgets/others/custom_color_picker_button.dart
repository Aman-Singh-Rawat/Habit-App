import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';

import '../../../core/dialogs/color_picker_dialog.dart';
import '../../../core/values/app_values.dart';

class CustomColorPickerButton extends StatelessWidget {
  const CustomColorPickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RegularHabitController.instance;
    final size = width_50;

    return Obx(() {
      final isCustom = controller.isColorPickerSelected.value;

      return GestureDetector(
        onTap: () => ColorPickerDialog.show(context),
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
              width: width_12,
              height: width_12,
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
              size: font_22,
              fontWeight: .w600,
              color: AppColors.chetwode.s800,
            ),
          ),
        ),
      );
    });
  }
}
