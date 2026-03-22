import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../models/regular_habit.dart';

class WeeklyOverallHeaderWidget extends StatelessWidget {
  const WeeklyOverallHeaderWidget({super.key, required this.habit});

  final RegularHabit habit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            /// icon
            Text(habit.icon, style: TextStyle(fontSize: 23.sp)),
            SizedBox(width: AppSpacing.md),

            /// habit name
            Expanded(
              child: Text(
                '${habit.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(fontSize: 16.sp),
              ),
            ),
            SizedBox(width: AppSpacing.sm),

            /// End text [days per week]
            Text(
              habit.repeatDays == 7
                  ? strEveryday
                  : '${habit.repeatDays} ${AppStrings.daysPerWeek}',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w300),
            ),
          ],
        ),

        Divider().paddingSymmetric(vertical: AppSpacing.sm),
      ],
    );
  }
}
