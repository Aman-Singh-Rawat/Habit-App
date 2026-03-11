import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.isSelected,
    required this.itemName,
    this.padding,
  });

  final bool isSelected;
  final String itemName;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(AppSpacing.xl.r)),
        border: Border.all(
          color: !isSelected
              ? AppColors.aboutUserDarkBorder
              : Colors.transparent,
        ),
      ),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 19.w, vertical: 10.h),

      child: Center(
        child: Text(
          itemName,
          style: AppTextStyles.repeatChildStyle.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
