import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/custom_tab_widget.dart';
import 'package:habitly/app/modules/home/widgets/tab_bar_widget.dart';

class ChooseIconTabBarWidget extends StatelessWidget {
  const ChooseIconTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateNewHabitController controller =
        CreateNewHabitController.instance;

    return Obx(
      () => TabBarWidget(
        controller: controller.chooseIconTabController,
        tabs: [
          CustomTabWidget(
            isSelected: controller.selectedIconTabIndex.value == 0,
            tabText: AppStrings.icon,
          ),
          CustomTabWidget(
            isSelected: controller.selectedIconTabIndex.value == 1,
            tabText: AppStrings.emoji,
          ),
        ],
      ),
    );
  }
}
