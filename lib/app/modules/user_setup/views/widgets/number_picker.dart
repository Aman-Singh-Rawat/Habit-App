import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:numberpicker/numberpicker.dart';

class ANumberPicker extends StatelessWidget {
  const ANumberPicker({
    super.key,
    required this.maxValue,
    required this.onChanged,
    required this.currentValue,
  });

  final int maxValue;
  final Function(int) onChanged;
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 0,
      maxValue: maxValue,
      value: currentValue, // reactive value
      zeroPad: true,
      infiniteLoop: false,
      itemHeight: 80,
      onChanged: (value) => onChanged(value),
      textStyle: Theme.of(context).textTheme.headlineLarge,
      selectedTextStyle: Theme.of(
        context,
      ).textTheme.displayLarge!.copyWith(color: AppColors.primary),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.primary),
          bottom: BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
