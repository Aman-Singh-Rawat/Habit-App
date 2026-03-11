import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class UserSetupProgressBar extends StatelessWidget {
  final int currentStep;
  const UserSetupProgressBar({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: LinearProgressBar(
        maxSteps: 8,
        progressType: ProgressType.linear,
        currentStep: currentStep,
        progressColor: AppColors.primary,
        backgroundColor: AHelperFunction.isDarkMode(context)
            ? AppColors.darkSecondaryColor
            : AppColors.unprogressColor,
        borderRadius: BorderRadius.circular(20.r),
        minHeight: 12.h,
      ),
    );
  }
}
