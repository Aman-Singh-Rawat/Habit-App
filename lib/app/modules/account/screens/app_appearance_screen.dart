import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/extensions/onboarding_texts.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/theme/theme_controller.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/account/widgets/appearance/theme_bottom_sheet.dart';
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
          onClick: () => showThemeBottomSheet(context),
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




}
