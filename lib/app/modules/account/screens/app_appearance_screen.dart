import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/end_habit_on_widget.dart';
import 'package:habitly/app/modules/onboarding/views/widgets/onboarding_bottom_widget.dart';
import 'package:habitly/app/modules/widgets/appbar/appbar_title.dart';
import 'package:habitly/app/modules/widgets/appbar/custom_appbar.dart';
import 'package:habitly/app/modules/widgets/others/custom_drag_handle.dart';

import '../../../core/extensions/secondary_button_text.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../widgets/appearance/app_appearance_tile.dart';

class AppAppearanceScreen extends StatelessWidget {
  const AppAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainScreen(context);
  }

  SafeArea _mainScreen(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppbar(title: AppbarTitle(title: strAppAppearance)),
        body: _bodyWidget(context).paddingAll(width_20),
      ),
    );
  }

  Column _bodyWidget(BuildContext context) {
    return Column(
      children: [
        AppAppearanceTile(
          title: strTheme,
          trailingText: strLight,
          onClick: () {
            Get.bottomSheet(
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
                    ).paddingSymmetric(vertical: height_15),

                    // divider
                    Divider(),

                    // System Default
                    _appAppearanceThemeTile(
                      title: strSystemDefault,
                    ).paddingSymmetric(vertical: height_20),

                    // light theme
                    _appAppearanceThemeTile(title: strLight),
                    SizedBox(height: height_20),

                    // dark theme
                    _appAppearanceThemeTile(title: strDark),
                    SizedBox(height: height_20),

                    // divider
                    Divider(),

                    SizedBox(height: height_25),

                    Row(
                      children: [
                        Expanded(
                          child: CustomElevatedButton(
                            buttonText: strCancel,
                            onClick: () {},
                            textColor: context.secondaryButtonTextColor,
                            backgroundColor: context.secondaryBackgroundColor,
                          ),
                        ),
                        const SizedBox(width: 17),
                        Expanded(
                          child: CustomElevatedButton(
                            buttonText: strOk,
                            onClick: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        SizedBox(height: height_20),

        AppAppearanceTile(
          title: strAppLanguage,
          trailingText: strEnglishUs,
          onClick: () {
            Get.toNamed(AppRoutes.appLanguage);
          },
        ),
      ],
    );
  }

  Row _appAppearanceThemeTile({
    bool isSelected = false,
    required String title,
  }) {
    return Row(
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
            color: Get.overlayContext!.onboardingTitleColor,
          ),
        ),
      ],
    );
  }
}
