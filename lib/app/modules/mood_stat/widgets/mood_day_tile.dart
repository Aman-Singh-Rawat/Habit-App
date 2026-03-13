import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_controller.dart';
import 'package:habitly/app/modules/mood_stat/show_mood_emoji_stat.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../models/mood_calendar.dart';

class MoodDayTile extends StatelessWidget {
  final DateTime date;
  final bool isOverflow;

  const MoodDayTile({
    super.key,
    required this.date,
    this.isOverflow = false,
  });

  // ── Date helpers ──
  DateTime get _today => normalizeDate(DateTime.now());
  bool get _isToday => normalizeDate(date) == _today;
  bool get _isPast => normalizeDate(date).isBefore(_today);
  bool get _isFuture => normalizeDate(date).isAfter(_today);

  @override
  Widget build(BuildContext context) {
    final controller = MoodStatController.instance;

    return Obx(() {
      final mood = controller.moodMap[normalizeDate(date)];

      if (isOverflow) return _OverflowTile(date: date, mood: mood);
      if (_isFuture)  return _FutureTile(date: date);

      return _CurrentMonthTile(
        date: date,
        mood: mood,
        isToday: _isToday,
        isPast: _isPast,
        controller: controller,
      );
    });
  }
}


// ─────────────────────────────────────────
// Previous month filler tile
// ─────────────────────────────────────────
class _OverflowTile extends StatelessWidget {
  final DateTime date;
  final dynamic mood;

  const _OverflowTile({required this.date, required this.mood});

  @override
  Widget build(BuildContext context) {
    final controller = MoodStatController.instance;
    const color = AppColors.chetwode;

    return GestureDetector(
      onTap: () => showMoodEmojiStat(controller, mood, normalizeDate(date)),
      child: _TileLayout(
        date: date,
        label: mood != null ? mood.title : strMood,
        labelColor: color.s200.withOpacity(0.5),
        dayColor: color.s200.withOpacity(0.45),
        icon: _OverflowIcon(mood: mood),
      ),
    );
  }
}

class _OverflowIcon extends StatelessWidget {
  final dynamic mood;
  const _OverflowIcon({required this.mood});

  @override
  Widget build(BuildContext context) {
    if (mood != null) {
      return Opacity(
        opacity: 0.45,
        child: Text(mood.emoji, style: TextStyle(fontSize: 29.sp)),
      );
    }

    return Container(
      width: 34.w,
      height: 34.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.chetwode.s200.withOpacity(0.08),
        border: Border.all(
          color: AppColors.chetwode.s200.withOpacity(0.35),
          width: 1.5.w,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.add,
          size: 18.w,
          color: AppColors.chetwode.s200.withOpacity(0.5),
        ),
      ),
    );
  }
}


// ─────────────────────────────────────────
// Future locked tile
// ─────────────────────────────────────────
class _FutureTile extends StatelessWidget {
  final DateTime date;
  const _FutureTile({required this.date});

  @override
  Widget build(BuildContext context) {
    return _TileLayout(
      date: date,
      label: strMood,
      labelColor: AppColors.chetwode.s100.withOpacity(0.4),
      dayColor: AppColors.chetwode.s100.withOpacity(0.35),
      icon: _FutureIcon(),
    );
  }
}

class _FutureIcon extends StatelessWidget {
  const _FutureIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.w,
      height: 34.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.chetwode.s100.withOpacity(0.08),
        border: Border.all(
          color: AppColors.chetwode.s100.withOpacity(0.3),
          width: 1.5.w,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.lock_outline_rounded,
          size: 15.w,
          color: AppColors.chetwode.s100.withOpacity(0.45),
        ),
      ),
    );
  }
}


// ─────────────────────────────────────────
// Current month tile (today / past)
// ─────────────────────────────────────────
class _CurrentMonthTile extends StatelessWidget {
  final DateTime date;
  final dynamic mood;
  final bool isToday;
  final bool isPast;
  final MoodStatController controller;

  const _CurrentMonthTile({
    required this.date,
    required this.mood,
    required this.isToday,
    required this.isPast,
    required this.controller,
  });

  bool get hasMood => mood != null;

  String get moodTitle {
    if (hasMood) return mood.title;
    if (isPast && !isToday) return strMissed;
    if (isToday) return strToday;
    return strMood;
  }

  Color get iconColor => hasMood
      ? AppColors.primary
      : isToday
      ? AppColors.chetwode.s600
      : AppColors.moodDarkEmptyIconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showMoodEmojiStat(controller, mood, normalizeDate(date)),
      child: _TileLayout(
        date: date,
        label: moodTitle,
        labelColor: iconColor,
        labelBold: hasMood,
        dayColor: hasMood ? AppColors.chetwode.s500 : null,
        isToday: isToday,
        icon: _CurrentMonthIcon(mood: mood, isToday: isToday),
      ),
    );
  }
}

class _CurrentMonthIcon extends StatelessWidget {
  final dynamic mood;
  final bool isToday;

  const _CurrentMonthIcon({required this.mood, required this.isToday});

  bool get hasMood => mood != null;

  Color get borderColor => hasMood
      ? AppColors.chetwode.s400.withOpacity(0.6)
      : isToday
      ? AppColors.chetwode.s600
      : AppColors.moodDarkEmptyIconColor.withOpacity(0.5);

  Color get iconColor => hasMood
      ? AppColors.primary
      : isToday
      ? AppColors.chetwode.s600
      : AppColors.moodDarkEmptyIconColor;

  @override
  Widget build(BuildContext context) {
    if (hasMood) return _MoodEmoji(emoji: mood.emoji);

    return Container(
      width: 34.w,
      height: 34.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isToday
            ? AppColors.chetwode.s600.withOpacity(0.08)
            : Colors.transparent,
        border: Border.all(
          color: borderColor,
          width: isToday ? 2.w : 1.8.w,
        ),
      ),
      child: Center(
        child: Icon(Icons.add, size: 20.w, color: iconColor),
      ),
    );
  }
}

class _MoodEmoji extends StatelessWidget {
  final String emoji;
  const _MoodEmoji({required this.emoji});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer glow
        Container(
          width: 42.w,
          height: 42.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                AppColors.chetwode.s400.withOpacity(0.2),
                AppColors.chetwode.s400.withOpacity(0.0),
              ],
            ),
          ),
        ),
        // Inner ring
        Container(
          width: 36.w,
          height: 36.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.chetwode.s300.withOpacity(0.55),
              width: 1.5.w,
            ),
          ),
        ),
        Text(emoji, style: TextStyle(fontSize: 24.sp)),
      ],
    );
  }
}


// ─────────────────────────────────────────
// Shared tile layout (label + day number)
// ─────────────────────────────────────────
class _TileLayout extends StatelessWidget {
  final DateTime date;
  final Widget icon;
  final String label;
  final Color labelColor;
  final Color? dayColor;
  final bool labelBold;
  final bool isToday;

  const _TileLayout({
    required this.date,
    required this.icon,
    required this.label,
    required this.labelColor,
    this.dayColor,
    this.labelBold = false,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 42.w,
          height: 42.w,
          child: Center(child: icon),
        ),

        const SizedBox(height: 6),

        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 9.sp,
            height: 1.1,
            color: labelColor,
            fontWeight: labelBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),

        const SizedBox(height: 4),

        if (isToday) _TodayDayNumber(day: date.day)
        else Text(
          date.day.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: dayColor,
          ),
        ),
      ],
    );
  }
}

class _TodayDayNumber extends StatelessWidget {
  final int day;
  const _TodayDayNumber({required this.day});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.chetwode.s600,
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          width: 4.w,
          height: 4.w,
          decoration: BoxDecoration(
            color: AppColors.chetwode.s600,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}