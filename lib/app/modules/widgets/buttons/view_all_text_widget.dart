import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class ViewAllTextWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const ViewAllTextWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionTitle(text: AppStrings.viewAll, color: AppColors.primary),
          SizedBox(width: 10.w),
          Icon(CupertinoIcons.arrow_right, color: AppColors.primary),
        ],
      ),
    );
  }
}
