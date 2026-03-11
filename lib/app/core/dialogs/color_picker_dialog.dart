import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/textfield_color_theme.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';

class ColorPickerDialog {
  static void show() {
    final controller = CreateNewHabitController.instance;

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(24),
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
              Container(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  color: Theme.of(Get.context!).primaryColor.withOpacity(0.08),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          Get.context!,
                        ).primaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.palette_rounded,
                        size: 20.sp,
                        color: Get.context!.textFieldIconColor,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      AppStrings.pickAColor,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(
                          Get.context!,
                        ).textTheme.titleLarge?.color,
                      ),
                    ),
                  ],
                ),
              ),

              // Color Picker
              Column(
                children: [
                  Obx(
                    () => ColorPicker(
                      pickerColor: controller.selectedColor.value,
                      onColorChanged: controller.onColorChanged,
                      paletteType: PaletteType.hueWheel,
                      enableAlpha: false,
                      displayThumbColor: true,
                      pickerAreaBorderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  // Color Preview
                  Obx(
                    () => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: controller.selectedColor.value.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: controller.selectedColor.value.withOpacity(
                            0.3,
                          ),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: BoxDecoration(
                              color: controller.selectedColor.value,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.selectedColor.value
                                      .withOpacity(0.4),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '#${controller.selectedColor.value.value.toRadixString(16).substring(2).toUpperCase()}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(
                                Get.context!,
                              ).textTheme.bodyMedium?.color,
                              fontFamily: 'DMMono',
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: Get.back,
                          style: ElevatedButton.styleFrom(
                            maximumSize: Size.fromHeight(46.h),
                            backgroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(vertical: 0.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            foregroundColor: AppColors.white,
                          ),
                          child: Text(
                            AppStrings.cancel,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Obx(
                          () => TextButton(
                            onPressed: () => Get.back(),
                            style: TextButton.styleFrom(
                              maximumSize: Size.fromHeight(46.h),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              backgroundColor: controller.selectedColor.value,
                              foregroundColor:
                                  controller.selectedColor.value
                                          .computeLuminance() >
                                      0.5
                                  ? Colors.black87
                                  : Colors.white,
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              AppStrings.select,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingOnly(left: 20.w, right: 20.w, bottom: 20.h),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
