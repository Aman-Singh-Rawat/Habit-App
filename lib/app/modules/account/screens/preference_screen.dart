import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/account/controllers/preference_controller.dart';
import 'package:habitly/app/modules/account/widgets/common/settings_switch_tile.dart';
import 'package:habitly/app/modules/widgets/others/settings_tile.dart';
import 'package:habitly/app/modules/widgets/switch/custom_cupertino_switch.dart';
import 'package:habitly/app/modules/widgets/texts/settings_title.dart';

import '../../widgets/appbar/appbar_title.dart';
import '../../widgets/appbar/custom_appbar.dart';

class PreferenceScreen extends GetView<PreferenceController> {
  const PreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainFunction();
  }

  SafeArea _mainFunction() {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppbar(title: AppbarTitle(title: strPreferences)),
        body: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return ListView(
      children: [
        /// Day periods
        SettingsTile(
          title: strMorning,
          trailingText: '${strStartAt} 05:00',
          onClick: () {},
        ),
        SettingsTile(
          title: strAfternoon,
          trailingText: '${strStartAt} 12:00',
          onClick: () {},
        ).paddingSymmetric(vertical: height_25),
        SettingsTile(
          title: strEvening,
          trailingText: '${strStartAt} 18:00',
          onClick: () {},
        ),

        SizedBox(height: height_55),

        /// First Day Of Week
        SettingsTile(
          title: strFirstDayOfWeek,
          trailingText: 'Monday',
          onClick: () {},
        ),

        SizedBox(height: height_25),

        /// Vacation Mode
        Obx(() {
          return SettingsSwitchTile(
            title: strVacationMode,
            onChanged: controller.onVacationModeChange,
            isSelected: controller.isVacationMode.value,
          );
        }),

        SizedBox(height: height_55),

        /// Daily Remainder
        Obx(() {
          return SettingsSwitchTile(
            title: strDailyRemainder,
            onChanged: controller.onDailyReminderChange,
            isSelected: controller.isDailyReminder.value,
          );
        }),

        Divider().paddingSymmetric(vertical: height_20),

        /// Reminder time
        SettingsTile(
          title: strReminderTime,
          trailingText: '07:00',
          onClick: () {},
        ),

        SizedBox(height: height_55),

        /// Clear Cache
        SettingsTile(title: strClearCache, onClick: () {}),

        /// Restart All Habits
        SettingsTile(
          title: strRestartAllHabits,
          onClick: () {},
        ).paddingSymmetric(vertical: height_25),
      ],
    ).paddingAll(width_20);
  }
}
