import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';
import 'package:habitly/app/modules/mood_stat/show_mood_emoji_stat.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../models/mood_calendar.dart';

class MoodDayTile extends StatelessWidget {
  final DateTime date;

  const MoodDayTile({super.key, required this.date});

  DateTime get _today => normalizeDate(DateTime.now());

  bool get _isToday => normalizeDate(date) == _today;

  bool get _isPast => normalizeDate(date).isBefore(_today);

  @override
  Widget build(BuildContext context) {
    final controller = MoodStatController.instance;

    return Obx(() {
      final mood = controller.moodMap[normalizeDate(date)];

      final bool hasMood = mood != null;

      final String moodTitle = hasMood
          ? mood.title
          : _isPast && !_isToday
          ? strMissed
          : _isToday
          ? strToday
          : strMood;

      final Color iconColor = hasMood
          ? AppColors.darkSecondaryTextColor
          : _isToday
          ? AppColors.chetwode.s500
          : AppColors.moodDarkEmptyIconColor;

      final Color borderColor = _isToday
          ? AppColors.chetwode.s500
          : AppColors.moodDarkEmptyIconColor;

      final IconData icon =
      (_isToday || _isPast) ? Icons.add : Icons.emoji_emotions_outlined;

      final int dayNumber = date.day;

      return GestureDetector(
        onTap: () => showMoodEmojiStat(controller, mood, normalizeDate(date)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 42.w,
              height: 42.w,
              child: Center(
                child: hasMood
                    ? Text(mood.emoji, style: TextStyle(fontSize: 29.sp))
                    : Container(
                  width: 34.w,
                  height: 34.w,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor, width: 2.w),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(icon, size: 20.w, color: iconColor),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 6),

            Text(
              moodTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9.sp, height: 1.1, color: iconColor),
            ),

            const SizedBox(height: 4),

            Text(
              dayNumber.toString(),
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );
    });
  }
}