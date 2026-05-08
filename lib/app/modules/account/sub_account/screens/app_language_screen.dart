import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/widgets/appbar/appbar_title.dart';
import 'package:habitly/app/modules/widgets/appbar/custom_appbar.dart';
import 'package:iconsax/iconsax.dart';

import '../controllers/app_language_controller.dart';

class AppLanguageScreen extends GetWidget<AppLanguageController> {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainFunction();
  }

  SafeArea _mainFunction() {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppbar(title: AppbarTitle(title: strAppLanguage)),
        body: _bodyWidget(),
      ),
    );
  }

  Padding _bodyWidget() {
    return Padding(
      padding: EdgeInsets.all(width_20),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final language = AppLists.appLanguagesNameList[index];

          return Obx(
            () => _languageTile(
              language: language,
              onClick: () => controller.handleLanguageSelection(index),
              isSelected: controller.selectedLanguageIndex == index,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: height_35),
        itemCount: AppLists.appLanguagesNameList.length,
      ),
    );
  }

  Widget _languageTile({
    required String language,
    required VoidCallback onClick,
    bool isSelected = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onClick,
      child: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        children: [
          Expanded(
            child: Text(
              language,
              style: Theme.of(
                Get.context!,
              ).textTheme.labelLarge!.copyWith(fontSize: font_16),
            ),
          ),

          if (isSelected)
            Icon(
              CupertinoIcons.checkmark,
              size: width_30,
              color: AppColors.primary,
            ),
        ],
      ),
    );
  }
}
