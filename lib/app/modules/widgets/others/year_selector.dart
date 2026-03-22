import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../buttons/custom_arrow_Button.dart';

class YearSelector extends StatelessWidget {
  final int selectedYear;
  final VoidCallback? onLeftClick;
  final VoidCallback? onRightClick;

  const YearSelector({
    super.key,
    required this.selectedYear,
    this.onLeftClick,
    this.onRightClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomArrowButton(
            icon: Icons.chevron_left_rounded,
            onTap: onLeftClick,
          ),
          Text(
            '$selectedYear',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          CustomArrowButton(
            icon: Icons.chevron_right_rounded,
            onTap: onRightClick
          ),
        ],
      ),
    );
  }
}
