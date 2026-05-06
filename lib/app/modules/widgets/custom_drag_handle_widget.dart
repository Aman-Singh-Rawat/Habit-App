import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_spacing.dart';
import '../../core/theme/app_colors.dart';

class CustomDragHandleWidget extends StatelessWidget {
  const CustomDragHandleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 3.5.h,
      margin: EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.darkSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
