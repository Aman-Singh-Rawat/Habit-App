import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';
import 'package:habitly/app/modules/home/models/regular_habit.dart';
import 'package:habitly/app/modules/home/widgets/goal_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/constants/app_constants.dart';

class SkipHabitContentWidget extends StatelessWidget {
  const SkipHabitContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppStrings.skip,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ).paddingOnly(right: AppSpacing.sm),
        Icon(Iconsax.arrow_right_1, fontWeight: FontWeight.w500),
      ],
    );
  }
}
