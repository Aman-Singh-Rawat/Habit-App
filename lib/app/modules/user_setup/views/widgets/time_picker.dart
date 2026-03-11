import 'package:flutter/material.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/user_setup/views/widgets/number_picker.dart';

class ATimePicker extends StatelessWidget {
  const ATimePicker({
    super.key,
    required this.hourValue,
    required this.minuteValue,
    required this.onHourChange,
    required this.onMinuteChange,
    this.maxHourValue = 24,
    this.maxMinuteValue = 59,
  });

  final int hourValue;
  final int minuteValue;
  final int maxHourValue;
  final int maxMinuteValue;
  final Function(int value) onHourChange;
  final Function(int value) onMinuteChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // HOUR
        Expanded(
          child: ANumberPicker(
            maxValue: maxHourValue,
            onChanged: onHourChange,
            currentValue: hourValue,
          ),
        ),
        const SizedBox(width: AppSpacing.xxl),

        // MINUTE
        Expanded(
          child: ANumberPicker(
            maxValue: maxMinuteValue,
            onChanged: onMinuteChange,
            currentValue: minuteValue,
          ),
        ),

        // AM & PM
        Text(
          hourValue < 12 ? AppStrings.am : AppStrings.pm,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
