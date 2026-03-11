import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/home/models/base_habit.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';

class GoalWidget extends StatelessWidget {
  final BaseHabit habit;
  final bool isCompleted;

  const GoalWidget({super.key, required this.habit, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AHelperFunction.stringToColor(habit.color),
        borderRadius: BorderRadius.circular(6.r),
      ),

      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// prefix ICON seperated because the size
          Text(
            habit.icon,
            style: AppTextStyles.goalTitle.copyWith(fontSize: 28.sp),
          ),

          SizedBox(width: 14.w),
          Expanded(child: Text(habit.name, style: AppTextStyles.goalTitle)),

          if (isCompleted)
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: AppColors.success.s400,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, size: 13.w),
            ),
        ],
      ),
    );
  }
}
