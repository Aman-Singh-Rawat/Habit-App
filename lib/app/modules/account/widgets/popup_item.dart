import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

PopupMenuItem<String> popupItem(
  BuildContext context, {
  required String value,
  required IconData icon,
  required String label,
  required Color iconBg,
  required Color iconColor,
  bool isDestructive = false,
}) {
  return PopupMenuItem(
    value: value,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    child: Row(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: Icon(icon, size: 15.w, color: iconColor),
        ),
        SizedBox(width: 11.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 13.5.sp,
            fontWeight: FontWeight.w600,
            color: isDestructive ? const Color(0xFFC62828) : AppColors.textDark,
          ),
        ),
      ],
    ),
  );
}
