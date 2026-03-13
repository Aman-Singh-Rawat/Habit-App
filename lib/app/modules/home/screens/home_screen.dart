import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';
import 'package:habitly/app/modules/home/widgets/category_header_delegate.dart';
import 'package:habitly/app/modules/home/widgets/custom_tab_widget.dart';
import 'package:habitly/app/modules/home/widgets/home/weekly_overall_header_widget.dart';
import 'package:habitly/app/modules/home/widgets/tab_bar_widget.dart';
import 'package:habitly/app/modules/home/widgets/home/today_home_tab.dart';
import 'package:habitly/app/modules/widgets/appbar/leading_app_bar_image_widget.dart';
import 'package:habitly/app/modules/widgets/container/custom_card.dart';
import 'package:hive/hive.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/theme/app_colors.dart';
import '../widgets/home/floating_action_button.dart';
import '../widgets/home/overall_tab.dart';
import '../widgets/home/weekly_tab_section.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainView();
  }

  SafeArea _mainView() {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _sliverAppBar(),

              /// Category now scrolls with AppBar
              Obx(() {
                if (controller.selectedTabIndex.value == 0) {
                  return SliverPersistentHeader(
                    pinned: true,
                    delegate: CategoryHeaderDelegate(),
                  );
                }
                return const SliverToBoxAdapter(); // must return a Sliver
              }),
            ];
          },
          body: _bodyView(),
        ),
        floatingActionButton: floatingActionWidget(),
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      leadingWidth: 48,
      centerTitle: true,
      leading: LeadingAppBarImageWidget(),
      title: Text(AppStrings.home),
      actions: const [Icon(Icons.more_vert_rounded)],
      pinned: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Obx(
          () => TabBarWidget(
            controller: controller.controller,
            tabs: [
              CustomTabWidget(
                isSelected: controller.selectedTabIndex.value == 0,
                tabText: AppStrings.today,
              ),
              CustomTabWidget(
                isSelected: controller.selectedTabIndex.value == 1,
                tabText: AppStrings.weekly,
              ),
              CustomTabWidget(
                isSelected: controller.selectedTabIndex.value == 2,
                tabText: AppStrings.overall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TabBarView _bodyView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller.controller,
      children: [
        const TodayHomeTab(),
        //ReportPeriodTab(tabName: weekly),

        /// Weekly [habit]
        const WeeklyTab(),

        /// Overall [habit]
        const OverallTab(),
      ],
    );
  }
}
