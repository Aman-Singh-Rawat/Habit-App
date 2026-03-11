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
import '../widgets/home/weekly_tab_section.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leadingWidth: 48,
                centerTitle: true,
                leading: LeadingAppBarImageWidget(),
                title: Text(AppStrings.home),
                actions: const [Icon(Icons.more_vert_rounded)],
                pinned: false,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50.h),
                  child: Obx(
                        () =>
                        TabBarWidget(
                          controller: controller.controller,
                          tabs: [
                            CustomTabWidget(
                              isSelected: controller.selectedTabIndex.value ==
                                  0,
                              tabText: AppStrings.today,
                            ),
                            CustomTabWidget(
                              isSelected: controller.selectedTabIndex.value ==
                                  1,
                              tabText: AppStrings.weekly,
                            ),
                            CustomTabWidget(
                              isSelected: controller.selectedTabIndex.value ==
                                  2,
                              tabText: AppStrings.overall,
                            ),
                          ],
                        ),
                  ),
                ),
              ),

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
          body: TabBarView(
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
          ),
        ),
        floatingActionButton: floatingActionWidget(),
      ),
    );
  }
}

class OverallTab extends StatelessWidget {
  const OverallTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WeeklyOverallHeaderWidget(
            habit: HomeController.instance.regularHabits.first,
          ),
          SizedBox(
            height: 160.h,
            child: Builder(
              builder: (context) {
                final habit = HomeController.instance.regularHabits.first;

                final DateTime startDate = normalizeDate(habit.createdAt);
                final daysSinceStart = DateTime.now()
                    .difference(startDate)
                    .inDays + 1;

                final totalDays = max(90, daysSinceStart);

                // Monday = 1, Sunday = 7
                final int startWeekday = startDate.weekday;

                // Empty cells before first real day
                final int emptySlots = startWeekday - 1;

                // Total grid items
                final int itemCount = emptySlots + totalDays;

                return GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {

                    /// 1️⃣ Weekday headers
                    if (index < 7) {
                      return Center(
                        child: Text(AppLists.weekDayPrefixLetter[index]),
                      );
                    }

                    final int adjustedIndex = index - 7;
                    final bool isCompleted;

                    /// 2️⃣ Empty placeholders
                    if (adjustedIndex < emptySlots) {
                      isCompleted = false;
                    } else {
                      /// 3️⃣ Actual habit days
                      final int dayIndex = adjustedIndex - emptySlots;

                      final DateTime currentDate =
                      startDate.add(Duration(days: dayIndex));

                      isCompleted =
                      habit.completedDates.contains(normalizeDate(currentDate));
                    }

                    return Center(
                      child: SizedBox.square(
                        dimension: 12.w,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? AppColors.primary
                                : AppColors.primary.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
      padding: EdgeInsets.all(AppSpacing.md.r),
    ).paddingSymmetric(horizontal: AppSpacing.bf, vertical: AppSpacing.bf);
  }
}
