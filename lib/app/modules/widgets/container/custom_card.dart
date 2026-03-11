import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/helpers/helper_function.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsets? padding;

  const CustomCard({super.key, required this.child, this.padding, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h ,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(AppSpacing.md.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
