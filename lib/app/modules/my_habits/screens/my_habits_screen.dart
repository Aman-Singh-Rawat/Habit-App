import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/models/base_habit.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/create_new_habit_tab_child_widget.dart';
import 'package:habitly/app/modules/home/widgets/custom_tab_widget.dart';
import 'package:habitly/app/modules/home/widgets/habit_tile.dart';
import 'package:habitly/app/modules/home/widgets/tab_bar_widget.dart';
import 'package:habitly/app/modules/my_habits/controllers/my_habits_controller.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';

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
        return [_sliverAppBar()];
      },
      body: TabBarView(
        controller: controller.tabController,
        children: [
          habitList(habitList: controller.regularHabitList),
          habitList(habitList: controller.oneTimeTaskList),
        ],
      ).paddingOnly(top: 20.h),
    ).paddingOnly(bottom: AppSpacing.bf);
  }

  ListView habitList({required List<BaseHabit> habitList}) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: habitList.length,
      separatorBuilder: (context, index) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        return HabitTile(habit: habitList[index], isMyHabits: true,);
      },
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      leadingWidth: 48,
      centerTitle: true,
      leading: LeadingAppBarImageWidget(),
      title: Text(AppStrings.myHabits),
      actions: const [Icon(Icons.more_vert_rounded)],
      automaticallyImplyLeading: false,
      pinned: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
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
          );
        }),
      ),
    );
  }
}
