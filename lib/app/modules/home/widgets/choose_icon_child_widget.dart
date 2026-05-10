import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

import '../../../core/values/app_values.dart';

class ChooseIconChildWidget extends StatelessWidget {
  final VoidCallback onItemClick;
  final bool isSelected;
  final String item;
  final double? fontSize;
  final double? width;
  final double? height;

  const ChooseIconChildWidget({
    super.key,
    required this.onItemClick,
    required this.isSelected,
    required this.item,
    this.fontSize,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClick,
      child: Container(
        width: width ?? width_65,
        height: height ?? width_65,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : null,
          borderRadius: BorderRadius.circular(radius_5),
          border: Border.all(color: AppColors.aboutUserDarkBorder),
        ),
        child: Center(
          child: Text(
            item,
            style: TextStyle(
              fontSize: fontSize?.sp ?? font_34,
              height: height_1,
            ),
          ),
        ),
      ),
    );
  }
}
