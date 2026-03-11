import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class CustomTabWidget extends StatelessWidget {
  final bool isSelected;
  final String tabText;

  const CustomTabWidget({
    super.key,
    required this.isSelected,
    required this.tabText,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 20),
      curve: Curves.bounceInOut,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        tabText,
        style:Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: 13.sp
        ),
      ),
    );
  }
}
