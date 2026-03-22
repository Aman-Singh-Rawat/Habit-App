import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/home/models/base_habit.dart';
import 'package:habitly/app/modules/home/widgets/custom_tab_widget.dart';
import 'package:habitly/app/modules/home/widgets/habit_tile.dart';
import 'package:habitly/app/modules/home/widgets/tab_bar_widget.dart';
import 'package:habitly/app/modules/my_habits/controllers/my_habits_controller.dart';

import '../../widgets/appbar/leading_app_bar_image_widget.dart';

class MyHabitsScreen extends GetView<MyHabitsController> {
  const MyHabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainView();
  }

  Widget _mainView() {
    return SafeArea(top: false, child: Scaffold(body: _bodyWidget()));
  }

  Widget _bodyWidget() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_sliverAppBar(innerBoxIsScrolled)];
      },
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.tabController,
        children: [
          habitList(habitList: controller.regularHabitList),
          habitList(habitList: controller.oneTimeTaskList),
        ],
      ).paddingOnly(top: 20.h),
    ).paddingOnly(bottom: AppSpacing.bf);
  }

  Widget habitList({required List<BaseHabit> habitList}) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: habitList.length,
      itemBuilder: (context, index) {
        final habit = habitList[index];

        return Padding(
          key: ValueKey(habit.id),
          padding: EdgeInsets.only(
            bottom: index == habitList.length - 1 ? 0 : 10.h,
          ),
          child: HabitTile(habit: habit, isMyHabits: true),
        );
      },
      onReorder: controller.onReorder,
    );
  }

  SliverAppBar _sliverAppBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      leadingWidth: 48.w,
      centerTitle: true,
      leading: LeadingAppBarImageWidget(),
      title: Text(AppStrings.myHabits),
      actions: const [Icon(Icons.more_vert_rounded)],
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      snap: true,
      toolbarHeight: innerBoxIsScrolled ? 0 : kToolbarHeight,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Obx(() {
          // checking is first tab selected
          bool isRegularHabitSelected = controller.selectedTabIndex.value == 0;

          return TabBarWidget(
            controller: controller.tabController,
            tabs: [
              CustomTabWidget(
                isSelected: isRegularHabitSelected,
                tabText: AppStrings.regularHabit,
              ),
              CustomTabWidget(
                isSelected: !isRegularHabitSelected,
                tabText: AppStrings.oneTimeTask,
              ),
            ],
          ).paddingSymmetric(vertical: 8.h);
        }),
      ),
    );
  }
}
