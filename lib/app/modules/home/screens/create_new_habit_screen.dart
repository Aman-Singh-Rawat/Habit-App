import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/create_new_habit_tab_child_widget.dart';
import 'package:habitly/app/modules/home/widgets/custom_tab_widget.dart';
import 'package:habitly/app/modules/home/widgets/tab_bar_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';

class CreateNewHabitScreen extends StatelessWidget {
  const CreateNewHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewHabitController>(
      builder: (CreateNewHabitController controller) {
        return SafeArea(
          top: false,
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          leadingWidth: 48,
                          centerTitle: true,
                          automaticallyImplyLeading: false,
                          leading: InkWell(
                            onTap: () => Get.back(),
                            child: Icon(CupertinoIcons.clear),
                          ),
                          title: Text(AppStrings.createNewHabit),
                          pinned: true,
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(50.h),
                            child: Obx(() {
                              // checking is first tab selected
                              bool isRegularHabitSelected =
                                  controller.selectedTabIndex.value == 0;

                              return TabBarWidget(
                                controller: controller.controller,
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
                        ),
                      ];
                    },
                    body: TabBarView(
                      controller: controller.controller,
                      children: [
                        CreateNewHabitTabChildWidget(isRegularHabit: true),
                        CreateNewHabitTabChildWidget(isRegularHabit: false),
                      ],
                    ),
                  ).paddingOnly(bottom: AppSpacing.bf),
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    buttonText: AppStrings.save,
                    onClick: () => controller.onSave(true),
                  ),
                ).paddingOnly(
                  left: AppSpacing.bf,
                  right: AppSpacing.bf,
                  bottom: AppSpacing.bf,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
