import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/textfield_color_theme.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:habitly/app/modules/widgets/buttons/action_button_row.dart';
import 'package:habitly/app/modules/widgets/texts/bottom_sheet_title.dart';

import '../../../main.dart';
import '../values/app_values.dart';

class ColorPickerDialog {
  static void show(BuildContext context) {
    final controller = RegularHabitController.instance;

    Get.dialog(
      Dialog(
        backgroundColor: AppColors.containerBackgroundColor,
        elevation: 0,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(radius_16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              _colorPickerDialogHeader(
                context,
              ).paddingOnly(top: height_10, left: width_20, right: width_20),

              const Divider(),

              // Color Picker
              Column(
                mainAxisSize: .min,
                children: [
                  // Color Picker
                  Obx(
                    () => ColorPicker(
                      pickerColor: controller.selectedColor.value,
                      onColorChanged: controller.onColorChanged,
                      paletteType: PaletteType.hueWheel,
                      enableAlpha: false,
                      displayThumbColor: true,
                      labelTypes: [],
                      pickerAreaHeightPercent: 0.7,
                      pickerAreaBorderRadius: BorderRadius.circular(radius_12),
                    ),
                  ),

                  // Color Preview [rounded color showing]
                  _colorPreview(controller, context),

                  AppGaps.section,

                  // Buttons
                  _actionButtons(),

                  AppGaps.height20,
                ],
              ).paddingSymmetric(horizontal: width_20),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    ).then(controller.onColorPickerDialogClose);
  }

  static Row _colorPickerDialogHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          margin: EdgeInsets.only(right: width_10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(radius_10),
          ),
          child: Icon(
            Icons.palette_rounded,
            size: font_24,
            color: context.textFieldIconColor,
          ),
        ),
        DialogTitle(title: strFindYourColor),
      ],
    );
  }

  static Widget _actionButtons() {
    final controller = RegularHabitController.instance;
    return Row(
      children: [
        /// Cancel Button
        Expanded(
          child: TextButton(
            onPressed: Get.back,
            style: ElevatedButton.styleFrom(
              maximumSize: Size.fromHeight(height_46),
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius_12),
              ),
              foregroundColor: AppColors.white,
            ),
            child: Text(
              strCancel,
              style: TextStyle(fontSize: font_15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        AppGaps.betweenRowBtnGap,

        /// Select Button
        Expanded(
          child: Obx(
            () => TextButton(
              onPressed: () => Get.back(result: true),
              style: TextButton.styleFrom(
                maximumSize: Size.fromHeight(46.h),
                padding: EdgeInsets.symmetric(vertical: height_10),
                backgroundColor: controller.selectedColor.value,
                foregroundColor:
                    controller.selectedColor.value.computeLuminance() > 0.5
                    ? Colors.black87
                    : Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius_12),
                ),
              ),
              child: Text(
                strSelect,
                style: TextStyle(
                  fontSize: font_15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Obx _colorPreview(
    RegularHabitController controller,
    BuildContext context,
  ) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
          horizontal: width_20,
          vertical: height_10,
        ),
        decoration: BoxDecoration(
          color: controller.selectedColor.value.withOpacity(0.12),
          borderRadius: BorderRadius.circular(radius_12),
          border: Border.all(
            color: controller.selectedColor.value.withOpacity(0.3),
            width: width_1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width_24,
              height: width_24,
              decoration: BoxDecoration(
                color: controller.selectedColor.value,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: controller.selectedColor.value.withOpacity(0.4),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            AppGaps.itemW,

            Text(
              '#${controller.selectedColor.value.value.toRadixString(16).substring(2).toUpperCase()}',
              style: TextStyle(
                fontSize: font_13,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontFamily: dmMonoFontFamily,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
