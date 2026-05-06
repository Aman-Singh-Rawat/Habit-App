import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/constants/app_routes.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/widgets/appbar/appbar_title.dart';
import 'package:habitly/app/modules/widgets/appbar/custom_appbar.dart';

import '../widgets/appearance/app_appearance_tile.dart';

class AppAppearanceScreen extends StatelessWidget {
  const AppAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainScreen();
  }

  SafeArea _mainScreen() {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppbar(title: AppbarTitle(title: strAppAppearance)),
        body: _bodyWidget().paddingAll(width_20),
      ),
    );
  }

  Column _bodyWidget() {
    return Column(
      children: [
        AppAppearanceTile(
          title: strTheme,
          trailingText: strLight,
          onClick: () {

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
}
