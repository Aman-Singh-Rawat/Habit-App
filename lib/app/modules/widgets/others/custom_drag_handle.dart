import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class CustomDragHandle extends StatelessWidget {
  const CustomDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 3.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.darkSecondaryColor,
      ),

      margin: EdgeInsets.symmetric(vertical: 10.h),
    );
  }
}
