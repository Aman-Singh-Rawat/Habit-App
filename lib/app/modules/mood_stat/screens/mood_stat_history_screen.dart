import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/mood_stat/controllers/mood_stat_history_controller.dart';
import 'package:habitly/app/modules/mood_stat/models/mood_feeling_model.dart';
import 'package:hive/hive.dart';

import '../../../core/constants/app_constants.dart';
import '../../widgets/circular_point.dart';

class MoodStatHistoryScreen extends GetView<MoodStatHistoryController> {
  const MoodStatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainView();
  }

  Widget _mainView() {
    return SafeArea(
      top: false,
      child: Scaffold(appBar: myAppBar(), body: _bodyWidget()),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: GestureDetector(onTap: Get.back, child: Icon(Icons.arrow_back)),
      title: Text(strMoodStatHistory),
    );
  }

  Widget _titleText(String text) {
    return Text(
      text,
      style: Theme.of(
        Get.context!,
      ).textTheme.labelLarge!.copyWith(fontSize: 16.sp),
    );
  }

  Widget _titleWidget(MoodFeelingModel mood) {
    return Row(
      children: [
        // mood text
        _titleText(mood.title),

        if (mood.feeling != null) ...[
          // circular bindu
          CircularPoint(size: 5),

          // feeling
          _titleText(mood.feeling!),
        ],
      ],
    );
  }

  Widget _subTitleText(String text) {
    return Text(text, style: Theme.of(Get.context!).textTheme.labelSmall);
  }

  Widget _subTitleWidget() {
    return Row(
      children: [
        _subTitleText('Today, Dec 22, 2024'),

        // circular bindu
        CircularPoint(size: 5).paddingSymmetric(horizontal: 5.w),

        _subTitleText('09:41 AM'),
      ],
    );
  }

  Widget _bodyWidget() {
    return Obx(
      () => ListView.separated(
        itemBuilder: (context, index) {
          final mood = controller.moods[index];
          return ListTile(
            tileColor: AppColors.containerBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.w),
            ),
            leading: Text(mood.emoji, style: TextStyle(fontSize: 35.sp)),
            title: _titleWidget(mood),
            subtitle: _subTitleWidget(),
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: controller.moods.length,
      ),
    );
  }
}
