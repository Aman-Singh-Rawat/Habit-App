// spacing.dart
import 'package:flutter/cupertino.dart';
import 'package:habitly/app/core/values/app_values.dart';

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double bf = 20;

  static const double xxl = 30;
}

class AppGaps {
  // Between form fields
  static final field = SizedBox(height: height_16);

  // Between sections/cards
  static final section = SizedBox(height: height_30);

  // Between title and subtitle
  static final title = SizedBox(height: height_8);

  // Horizontal item gap
  static final itemW = SizedBox(width: width_12);

  // vertical item gap
  static final itemH = SizedBox(height: height_15);

  // Horizontal btn space
  static final betweenRowBtnGap = SizedBox(width: width_16);

  static final height20 = SizedBox(height: height_20);
  static final height30 = SizedBox(height: height_30);
}
