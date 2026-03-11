// Header widget
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_spacing.dart';

class MonthPickerHeader extends StatelessWidget {
  final List<String> months;
  final int selectedMonth;
  final int selectedYear;
  final ThemeData theme;

  const MonthPickerHeader({
    required this.months,
    required this.selectedMonth,
    required this.selectedYear,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 12.w, 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withOpacity(0.12),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strSelectMonth,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontSize: 8.sp,
                  letterSpacing: 1.4,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppSpacing.xl),
              Text(
                '${months[selectedMonth - 1]} $selectedYear',
                style: theme.textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}