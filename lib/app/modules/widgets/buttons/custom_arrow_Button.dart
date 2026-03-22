import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CustomArrowButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabled = onTap == null;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: disabled
              ? Colors.transparent
              : theme.colorScheme.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 22.sp,
          color: disabled
              ? theme.hintColor.withOpacity(0.3)
              : theme.colorScheme.primary,
        ),
      ),
    );
  }
}