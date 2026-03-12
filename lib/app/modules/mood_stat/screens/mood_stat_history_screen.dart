import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:hive/hive.dart';

import '../../../core/constants/app_constants.dart';
import '../../widgets/circular_point.dart';

class MoodStatHistoryScreen extends StatelessWidget {
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

  Widget _titleWidget(BuildContext context) {
    return Row(
      children: [
        // mood text
        _titleText('Great'),

        // circular bindu
        CircularPoint(size: 5),

        // feeling
        _titleText('Confident'),
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
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        tileColor: AppColors.containerBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
        ),
        leading: Text('😁', style: TextStyle(fontSize: 35.sp)),
        title: _titleWidget(context),
        subtitle: _subTitleWidget(),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemCount: 10,
    );
  }
}
