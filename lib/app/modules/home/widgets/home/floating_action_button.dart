import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';

SizedBox floatingActionWidget() {
  return SizedBox(
    width: 60.w,
    height: 60.h,
    child: FloatingActionButton(
      elevation: 0,
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          70.0,
        ), // Adjust the radius as needed
      ),
      child: Icon(Iconsax.add, size: 45.w),
      onPressed: () => Get.toNamed(AppRoutes.createNewHabit),
    ),
  );
}