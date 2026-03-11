import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/modules/home/widgets/home/weekly_tab_widget.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../controllers/home_controller.dart';

class WeeklyTab extends StatelessWidget {
  const WeeklyTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Obx(
          () => ListView.separated(
        itemBuilder: (context, index) => WeeklyTabWidget(
          habit: controller.weeklyHabits[index],
          index: index,
        ),
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: AppSpacing.md),
        itemCount: controller.weeklyHabits.length,
      ).paddingOnly(left: 10, right: 10, top: 20),
    );
  }
}