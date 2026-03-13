import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';

class MoodSummaryStrip extends StatelessWidget {
  final int filledCount;
  final int totalDays;

  const MoodSummaryStrip({required this.filledCount, required this.totalDays});

  String get _motivationalEmoji {
    final percent = totalDays == 0 ? 0.0 : filledCount / totalDays;
    if (percent == 0) return '🌱';
    if (percent < 0.3) return '🌤';
    if (percent < 0.6) return '⚡';
    if (percent < 0.9) return '🔥';
    return '✨';
  }

  String get _motivationalText {
    final percent = totalDays == 0 ? 0.0 : filledCount / totalDays;
    if (percent == 0) return strStartTracking;
    if (percent < 0.3) return strKeepGoing;
    if (percent < 0.6) return strGoodStreak;
    if (percent < 0.9) return strAlmostThere;
    return strPerfectMonth;
  }

  @override
  Widget build(BuildContext context) {
    final percent = totalDays == 0 ? 0.0 : filledCount / totalDays;
    final percentInt = (percent * 100).round();

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.12),
            AppColors.primary.withOpacity(0.04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          // Left: circular progress
          SizedBox(
            width: 52.w,
            height: 52.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 52.w,
                  height: 52.w,
                  child: CircularProgressIndicator(
                    value: percent,
                    strokeWidth: 4.w,
                    backgroundColor: AppColors.moodDarkEmptyIconColor
                        .withOpacity(0.15),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text(_motivationalEmoji, style: TextStyle(fontSize: 20.sp)),
              ],
            ),
          ),

          SizedBox(width: 14.w),

          // Middle: labels
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      strMoodTracked,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        _motivationalText,
                        style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                // Linear progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: percent,
                    minHeight: 4.5.h,
                    backgroundColor: AppColors.moodDarkEmptyIconColor
                        .withOpacity(0.12),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  '$filledCount $strMoodDaysLogged',
                  style: TextStyle(
                    fontSize: 9.5.sp,
                    color: AppColors.moodDarkEmptyIconColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 10.w),

          // Right: big percent
          Text(
            '$percentInt%',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primary.withOpacity(0.85),
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }
}
