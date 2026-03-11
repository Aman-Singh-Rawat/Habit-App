import 'package:flutter/material.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarStyle calendarStyle(BuildContext context) {
  return CalendarStyle(
    todayDecoration: const BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
    ),
    selectedDecoration: BoxDecoration(
      color: AppColors.primary,
      shape: BoxShape.circle,
    ),
    selectedTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    defaultTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: context.onboardingTitleColor,
    ),
    weekendTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: context.onboardingTitleColor,
    ),
  );
}
