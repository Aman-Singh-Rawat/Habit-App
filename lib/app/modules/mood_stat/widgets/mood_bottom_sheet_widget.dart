import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';

import '../../../core/theme/app_colors.dart';

class MoodBottomSheetWidget extends StatelessWidget {
  final String emoji;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const MoodBottomSheetWidget({
    super.key,
    required this.emoji,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = AppColors.primary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 180),
        scale: isSelected ? 1.01 : 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 75.w,
              height: 75.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                // soft background
                color: isSelected
                    ? baseColor
                    : AppColors.primaryLight.withOpacity(.01),

                // subtle elevation
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: baseColor.withOpacity(.25),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                ],
              ),
              child: Text(emoji, style: TextStyle(fontSize: 38.sp)),
            ),

            SizedBox(height: 8.h),

            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? baseColor : context.onboardingTitleColor,
              ),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
