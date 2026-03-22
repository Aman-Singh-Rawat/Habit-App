import 'package:flutter/material.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/constants/image_strings.dart';
import 'package:habitly/app/modules/onboarding/models/onboarding_model.dart';

import '../../modules/mood_stat/models/mood.dart';
import 'app_constants.dart';

class AppLists {
  const AppLists._();

  static final onboardingList = [
    OnboardingData(
      title: AppStrings.onboardingTitle1,
      subtitle: AppStrings.onboardingSubtitle1,
      lightImage: ImageStrings.onboardingLightOne,
      darkImage: ImageStrings.onboardingDarkOne,
    ),
    OnboardingData(
      title: AppStrings.onboardingTitle2,
      subtitle: AppStrings.onboardingSubtitle2,
      lightImage: ImageStrings.onboardingLightTwo,
      darkImage: ImageStrings.onboardingDarkTwo,
    ),
    OnboardingData(
      title: AppStrings.onboardingTitle3,
      subtitle: AppStrings.onboardingSubtitle3,
      lightImage: ImageStrings.onboardingLightThree,
      darkImage: ImageStrings.onboardingDarkThree,
    ),
  ];

  static const List<String> contractLines = [
    AppStrings.contractLine1,
    AppStrings.contractLine2,
    AppStrings.contractLine3,
    AppStrings.contractLine4,
  ];

  // home day - times
  static const List<String> dayTimeTabs = [
    AppStrings.all,
    AppStrings.morning,
    AppStrings.afternoon,
    AppStrings.evening,
  ];

  /// colors array
  static const List<Color> habitlyColors = [
    Color(0xFFF5AFAF),
    Color(0xFFFFF2C6),
    Color(0xFFECF4E8),
    Color(0xFFCDC1FF),
    Color(0xFFAEDEFC),

    // second
    Color(0xFFbbd0ff),
    Color(0xFFb8c0ff),
    Color(0xFFc8b6ff),
    Color(0xFFe7c6ff),
    Color(0xFFffd6ff),

    // third
    Color(0xFFedede9),
    Color(0xFFd6ccc2),
    Color(0xFFf5ebe0),
    Color(0xFFe3d5ca),
  ];

  /// Week Day first letter list
  static const List<String> weekDayPrefixLetter = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];

  /// Weekly day 3 char
  static const List<String> weeklyDay3Char = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  /// Mood stat bottom sheet
  static const moodList = [
    Mood(emoji: '😎', title: strGreat),
    Mood(emoji: '😊', title: strGood),
    Mood(emoji: '😐', title: strOkay),
    Mood(emoji: '😢', title: strNotGood),
    Mood(emoji: '😡', title: strBad),
  ];

  /// Mood stat feeling bottom sheet
  static const feelingsList = [
    strHappy,
    strBrave,
    strMotivated,
    strCreative,
    strConfident,
    strCalm,
    strGrateful,
    strPeaceful,
    strExcited,
    strLoved,
    strHopeful,
    strInspired,
    strProud,
    strEuphoric,
    strNostalgic,
  ];

  /// months

  /// Months short list
  static const List<String> monthsShort = [
    strJan,
    strFeb,
    strMar,
    strApr,
    strMay,
    strJun,
    strJul,
    strAug,
    strSep,
    strOct,
    strNov,
    strDec,
  ];

  static const List<Map<String, dynamic>> settingsList = [
    {
      "title": strPreferences,
      "icon": Icons.settings_outlined,
    },
    {
      "title": strPersonalInfo,
      "icon": Icons.person_outline,
    },
    {
      "title": strPaymentMethods,
      "icon": Icons.credit_card_outlined,
    },
    {
      "title": strBillingSubscriptions,
      "icon": Icons.star_border,
    },
    {
      "title": strAccountSecurity,
      "icon": Icons.shield_outlined,
    },
    {
      "title": strLinkedAccounts,
      "icon": Icons.sync_alt,
    },
    {
      "title": strAppAppearance,
      "icon": Icons.remove_red_eye_outlined,
    },
    {
      "title": strDataAnalytics,
      "icon": Icons.analytics_outlined,
    },
    {
      "title": strHelpSupport,
      "icon": Icons.description_outlined,
    },
    {
      "title": strLogout,
      "icon": Icons.logout,
    },
  ];
}
