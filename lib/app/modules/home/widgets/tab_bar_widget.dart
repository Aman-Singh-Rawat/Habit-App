import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key, required this.controller, required this.tabs});

  final TabController controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AHelperFunction.isDarkMode(context);
    return Container(
      height: tabs.length > 2 ? 41.h : 44.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: isDarkMode
            ? AppColors.containerBackgroundColor
            : AppColors.primaryLight,
      ),

      child: TabBar(
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        dividerColor: const Color.fromARGB(0, 219, 170, 170),
        tabAlignment: TabAlignment.fill,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: controller,
        indicator: BoxDecoration(color: Colors.transparent),
        indicatorWeight: 0,
        tabs: tabs,
      ),
    );
  }
}
