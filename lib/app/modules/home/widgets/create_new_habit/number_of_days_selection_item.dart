import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/values/app_values.dart';
import '../../controllers/regular_habit_controller.dart';

class NumberOfDaysSelectionItem extends StatelessWidget {
  const NumberOfDaysSelectionItem({
    super.key,
    required this.item,
    required this.isSelected,
  });

  final int item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        RegularHabitController.instance.onRepeatWeeklyDaysClick(item);
      },
      child: Container(
        padding: EdgeInsets.all(width_16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? AppColors.primary : Colors.transparent,
          border: Border.all(color: AppColors.aboutUserDarkBorder),
        ),
        child: Center(child: Text(item.toString())),
      ),
    );
  }
}
