import 'package:flutter/material.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';

/// Centralized image & icon asset paths
/// Prevents instantiation using a private constructor
class ImageStrings {
  ImageStrings._(); // Private constructor

  // Base paths
  static const String _iconsPath = 'assets/icons';
  static const String _imagesPath = 'assets/images';

  static String getLogo(BuildContext context) {
    return AHelperFunction.isDarkMode(context)
        ? "$_imagesPath/img_blue_logo.png"
        : "$_imagesPath/img_splash_logo.png";
  }

  // Onboarding images – Dark
  static const String onboardingDarkOne =
      '$_imagesPath/img_onboarding_dark_one.png';
  static const String onboardingDarkTwo =
      '$_imagesPath/img_onboarding_dark_two.png';
  static const String onboardingDarkThree =
      '$_imagesPath/img_onboarding_dark_three.png';

  // Onboarding images – Light
  static const String onboardingLightOne =
      '$_imagesPath/img_onboarding_light_one.png';
  static const String onboardingLightTwo =
      '$_imagesPath/img_onboarding_light_two.png';
  static const String onboardingLightThree =
      '$_imagesPath/img_onboarding_light_three.png';

  // Images
  static const String imageBlueLogo = '$_imagesPath/img_blue_logo.png';
  static const String splashLogo = '$_imagesPath/img_splash_logo.png';

  /// Social Icons
  static const String icGoogle = '$_iconsPath/ic_google.svg';
  static const String icApple = '$_iconsPath/ic_apple.svg';
  static const String icFacebook = '$_iconsPath/ic_facebook.svg';
  static const String icTwitter = '$_iconsPath/ic_twitter.svg';
}
