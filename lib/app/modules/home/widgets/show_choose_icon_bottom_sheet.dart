import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
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

Future<dynamic> showChooseIconBottomSheet(BuildContext context) {
  // CreateNewHabitController
  final controller = CreateNewHabitController.instance;

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
            CustomDragHandle(),

            Text(
              AppStrings.chooseIcon,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontSize: 18.sp),
            ).paddingSymmetric(vertical: 15.h),

            Divider(),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Iconsax.search_normal,
                  color: context.textFieldHintColor,
                ),
                hint: Text(
                  AppStrings.searchIcon,
                  style: TextStyle(color: context.textFieldHintColor),
                ),
              ),
              style: AppTextStyles.textFieldTextStyle.copyWith(
                color: context.textFieldTextColor,
              ),
            ).paddingAll(15.w),

            SizedBox(height: 10.h),

            Column(
              children: [
                ChooseIconTabBarWidget(),

                ChooseIconTabBarViewWidget(),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonText: AppStrings.cancel,
                    onClick: controller.onCancel,
                    textColor: context.secondaryButtonTextColor,
                    backgroundColor: context.secondaryBackgroundColor,
                  ),
                ),
                const SizedBox(width: 17),
                Expanded(
                  child: CustomElevatedButton(
                    buttonText: AppStrings.ok,
                    onClick: controller.onOk,
                  ),
                ),
              ],
            ).paddingOnly(top: 20.h, left: 20.w, right: 20.w),
          ],
        ),
      );
    },
  );
}
