import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/extensions/secondary_button_text.dart';
import 'package:habitly/app/core/extensions/textfield_color_theme.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_tab_bar_widget.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_tab_barview_widget.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';
import 'package:habitly/app/modules/widgets/others/custom_drag_handle.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/values/app_values.dart';
import '../../widgets/buttons/action_button_row.dart';
import '../../widgets/text_field/search_widget.dart';
import '../../widgets/texts/bottom_sheet_title.dart';
import '../controllers/regular_habit_controller.dart';

/// currently using this on create new habit screen [as a icon & emoji picker]
Future<dynamic> showChooseIconBottomSheet(BuildContext context) {
  final regularController = RegularHabitController.instance;

  // showing bottom sheet for icon and emoji
  return showModalBottomSheet(
    context: context,
    elevation: 10,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    builder: (context) {
      return SizedBox(
        height: Get.height * 0.9,
        child: Column(
          children: [
            const CustomDragHandle(),

            const DialogTitle(title: strChooseIcon),

            const Divider(),

            const SearchWidget().paddingAll(width_15),

            SizedBox(height: height_10),

            /// [CHOOSE ICON & EMOJI TAB & THEIR CONTENT]
            const Column(
              children: [
                ChooseIconTabBarWidget(),

                ChooseIconTabBarViewWidget(),
              ],
            ),

            /// bottom sheet cancel & ok [BUTTONS];
            ActionButtonsRow(
              primaryText: AppStrings.ok,
              primaryOnTap: () =>
                  regularController.onChooseIconOkClick(context),

              secondaryText: AppStrings.cancel,
              secondaryOnTap: regularController.onChooseIconCancelClick,
            ).paddingOnly(top: height_20, left: width_20, right: width_20),
          ],
        ),
      );
    },
  ).then(regularController.onChooseIconBottomSheetClose);
}
