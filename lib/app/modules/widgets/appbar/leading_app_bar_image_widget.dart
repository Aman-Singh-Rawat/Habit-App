import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/constants/image_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class LeadingAppBarImageWidget extends StatelessWidget {
  const LeadingAppBarImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, top: 5.h),
      child: Image.asset(
        ImageStrings.imageBlueLogo,
        width: 18,
        height: 18,
        fit: BoxFit.contain,
        color: AppColors.primary,
      ),
    );
  }
}
