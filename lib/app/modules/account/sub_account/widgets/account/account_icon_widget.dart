import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class AccountIconWidget extends StatelessWidget {
  const AccountIconWidget({
    super.key,
    this.iconBg,
    this.iconColor,
    required this.icon,
  });

  final IconData icon;
  final Color? iconBg;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.w,
      height: 34.w,
      decoration: BoxDecoration(
        color: iconBg ?? AppColors.primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Icon(
        icon,
        size: 17.w,
        color: iconColor ?? AppColors.chetwode.s500,
        fontWeight: .w500,
      ),
    );
  }
}