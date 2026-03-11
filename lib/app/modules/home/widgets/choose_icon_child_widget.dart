import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class ChooseIconChildWidget extends StatelessWidget {
  final VoidCallback onItemClick;
  final bool isSelected;
  final String item;
  final int? fontSize;
  final double width;
  final double height;

  const ChooseIconChildWidget({
    super.key,
    required this.onItemClick,
    required this.isSelected,
    required this.item,
    this.fontSize,
    this.width = 65,
    this.height = 65,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClick,
      child: Container(
        width: width.w,
        height: height.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : null,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: AppColors.aboutUserDarkBorder),
        ),
        padding: EdgeInsets.all(4.w),
        child: Center(
          child: Text(
            item,
            style: TextStyle(fontSize: fontSize?.sp ?? 35.sp, height: 1.2),
          ),
        ),
      ),
    );
  }
}
