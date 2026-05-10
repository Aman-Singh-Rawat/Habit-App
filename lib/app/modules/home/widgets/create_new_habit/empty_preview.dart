import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/values/app_values.dart';

class EmptyPreview extends StatelessWidget {
  const EmptyPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('empty'),
      width: width_65,
      height: width_65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius_16),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.4),
          width: 1.5,
        ),
        color: AppColors.primary.withOpacity(0.07),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: font_22, color: AppColors.primary),
          SizedBox(height: height_3),
          Text(
            strIcon,
            style: TextStyle(fontSize: font_10, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}