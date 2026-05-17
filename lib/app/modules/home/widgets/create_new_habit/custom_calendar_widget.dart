import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/theme/calendar_table_style.dart';
import 'package:habitly/app/core/theme/days_of_week_style.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/controllers/regular_habit_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../main.dart';
import '../../../../core/constants/app_constants.dart';
import 'custom_calendar_monthly_footer.dart';
import 'custom_divider.dart';
import 'custom_monthly_calendar_header.dart';
import 'custom_monthly_day_grid.dart';
import 'monthly_calendar_selection_label.dart';

/// SHOWING:: this into create-new-habit-screen [MONTHLY]
class CustomCalendarWidget extends StatelessWidget {
  const CustomCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width_20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: AppColors.aboutUserDarkBorder, width: 0.5),
        borderRadius: BorderRadius.circular(width_16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ── Header ──────────────────────────────────────
          customMonthlyCalendarHeader(context),

          /// ── Live selection label ─────────────────────────
          monthlyCalendarSelectionLabel(),

          SizedBox(height: height_12),

          /// custom divider
          customDivider(),

          SizedBox(height: height_12),

          /// ── Day grid ─────────────────────────────────────
          customMonthlyDayGrid(),

          /// ── Footer ───────────────────────────────────────
          customCalendarMonthlyFooter(),
        ],
      ),
    ).paddingOnly(top: height_24);
  }
}
