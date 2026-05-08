import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/onboarding_texts.dart';
import '../../../../core/extensions/secondary_button_text.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/utils/helpers/helper_function.dart';
import '../../../../core/values/app_values.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';
import '../../../widgets/others/custom_drag_handle.dart';

Future<dynamic> showThemeBottomSheet(BuildContext context) {
  final controller = ThemeController.instance;

  return Get.bottomSheet(
    backgroundColor: Colors.transparent,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(28.r),
        topRight: Radius.circular(28.r),
      ),
    ),
    Container(
      decoration: AHelperFunction.getBottomSheetDecoration(context),
      padding: EdgeInsets.symmetric(horizontal: width_20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // drag handle
          CustomDragHandle(),

          // title
          Text(
            strChooseTheme,
            style: Theme.of(context).textTheme.headlineMedium,
          ).paddingOnly(top: height_15, bottom: height_10),

          // divider
          Divider(),

          SizedBox(height: height_15),

          _appearanceThemeTextWidget(context),

          // divider
          Divider(),

          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonText: strCancel,
                  onClick: controller.onCancel,
                  textColor: context.secondaryButtonTextColor,
                  backgroundColor: context.secondaryBackgroundColor,
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: CustomElevatedButton(
                  buttonText: strOk,
                  onClick: controller.onSave,
                ),
              ),
            ],
          ).paddingSymmetric(vertical: height_20),
        ],
      ),
    ),
  ).then((value) {
    if (value == null) {
      controller.loadTheme();
    }
  });
}

Obx _appearanceThemeTextWidget(BuildContext context) {
  return Obx(() {
    final controller = ThemeController.instance;
    final selectedThemeIndex = controller.selectedThemeIndex.value;

    return Column(
      mainAxisSize: .min,
      children: [strSystemDefault, strLight, strDark]
          .asMap()
          .entries
          .map(
            (e) => _appAppearanceThemeTile(
              onClick: () => controller.changeTheme(e.key),
              isSelected: e.key == selectedThemeIndex,
              title: e.value,
              context: context,
            ).paddingOnly(bottom: height_20),
          )
          .toList(),
    );
  });
}

Widget _appAppearanceThemeTile({
  required BuildContext context,
  required String title,
  required bool isSelected,
  required VoidCallback onClick,
}) {
  return GestureDetector(
    onTap: onClick,
    child: Row(
      mainAxisAlignment: .start,
      children: [
        Icon(
          size: width_25,
          color: AppColors.primary,
          isSelected
              ? Icons.radio_button_on_rounded
              : Icons.radio_button_off_rounded,
        ),

        SizedBox(width: width_10),

        Text(
          title,
          style: TextStyle(
            fontSize: font_16,
            fontWeight: FontWeight.w500,
            color: context.onboardingTitleColor,
          ),
        ),
      ],
    ),
  );
}
