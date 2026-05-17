import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import '../../../../../main.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/onboarding_texts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/values/app_values.dart';

Widget customMonthlyCalendarHeader(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(width_8),
        ),
        child: Icon(
          Icons.calendar_month_rounded,
          color: AppColors.primary,
          size: 18,
        ),
      ),
      SizedBox(width: width_10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            strRepeatOnDays,
            style: TextStyle(
              fontSize: font_14,
              fontFamily: appFontFamily,
              fontWeight: FontWeight.w500,
              color: context.onboardingTitleColor,
            ),
          ),
          Text(
            strMonthlySchedule,
            style: TextStyle(
              fontSize: font_12,
              fontFamily: appFontFamily,
              fontWeight: FontWeight.w400,
              color: AppColors.textFieldHintColor,
            ),
          ),
        ],
      ),
    ],
  ).paddingOnly(
    left: width_16,
    right: width_16,
    top: width_16,
    bottom: width_12,
  );
}
