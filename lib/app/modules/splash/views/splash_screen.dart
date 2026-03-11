import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/constants/image_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/splash/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("hellow");
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageStrings.splashLogo,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              Text(
                AppStrings.habitly,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        bottomSheet: Container(
          padding: const EdgeInsets.only(bottom: 60),
          color: AppColors.primary,
          height: 160,
          child: SpinKitFadingCircle(
            color: AppColors.white,
            size: 65,

            duration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
