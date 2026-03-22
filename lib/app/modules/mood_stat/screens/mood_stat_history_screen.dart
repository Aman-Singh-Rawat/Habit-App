import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/DateClass.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_history_controller.dart';
import 'package:habitly/app/modules/mood_stat/models/mood_feeling_model.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_constants.dart';

class MoodStatHistoryScreen extends GetView<MoodStatHistoryController> {
  const MoodStatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(appBar: _appBar(), body: _body()),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: GestureDetector(
        onTap: Get.back,
        child: Icon(Icons.arrow_back_ios_new_rounded, size: 20.w),
      ),
      title: Text(strMoodStatHistory),
    );
  }

  Widget _body() {
    return Obx(() {
      if (controller.moods.isEmpty) return _emptyState();

      return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: controller.moods.length,
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          final mood = controller.moods[index];
          return _MoodHistoryCard(mood: mood);
        },
      );
    });
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🌱', style: TextStyle(fontSize: 52.sp)),
          SizedBox(height: 14.h),
          Text(
            'No mood history yet',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.chetwode.s600,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'Start tracking your mood daily\nto see your history here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.moodDarkEmptyIconColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _MoodHistoryCard extends StatelessWidget {
  final MoodFeelingModel mood;

  const _MoodHistoryCard({required this.mood});

  String? _dayLabel(DateTime date) {
    final today = normalizeDate(DateTime.now());
    final normalized = normalizeDate(date);
    if (normalized == today) return strToday;
    if (normalized == today.subtract(const Duration(days: 1)))
      return strYesterday;
    return null;
  }

  Widget _titleWidget(String text) {
    return Text(
      text,
      style: Theme.of(
        Get.context!,
      ).textTheme.headlineSmall!.copyWith(fontSize: 14.sp),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dayLabel = _dayLabel(mood.createdAt);
    final dateStr = DateClass.formatMonthDayYear(mood.createdAt);
    final timeStr = DateClass.formatTime(mood.createdAt);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.containerBackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Emoji
          Text(mood.emoji, style: TextStyle(fontSize: 32.sp)),

          SizedBox(width: 14.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row
                Row(
                  children: [
                    _titleWidget(mood.title),
                    if (mood.feeling != null) ...[
                      SizedBox(width: 8.w),
                      Container(
                        width: 4.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),

                      _titleWidget(mood.feeling!),
                    ],
                  ],
                ),

                SizedBox(height: 4.h),

                // Date + time
                Text(
                  '$dateStr  ·  $timeStr',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.moodDarkEmptyIconColor,
                  ),
                ),
              ],
            ),
          ),

          // Today / Yesterday badge — subtle
          if (dayLabel != null)
            Text(
              dayLabel,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.chetwode.s500,
              ),
            ),
        ],
      ),
    );
  }
}
