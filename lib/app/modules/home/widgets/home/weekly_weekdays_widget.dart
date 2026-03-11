import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';

class WeeklyWeekdaysWidget extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onClick;

  const WeeklyWeekdaysWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: text == 'Sun' ? AppColors.primary : null,
          ),
        ),

        SizedBox(height: AppSpacing.sm.h),

        GestureDetector(
          onTap: onClick,
          child: Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: !isSelected
                    ? AppColors.aboutUserDarkBorder
                    : Colors.transparent,
                width: 2.w,
              ),
              shape: BoxShape.circle,
              color: isSelected ? AppColors.primary : Colors.transparent,
            ),
            child: isSelected
                ? Center(
              child: Icon(
                CupertinoIcons.checkmark,
                color: Colors.black,
                size: 17.w,
                fontWeight: FontWeight.bold,
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }
}