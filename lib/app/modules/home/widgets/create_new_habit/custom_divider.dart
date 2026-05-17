import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

Widget customDivider() {
  return Divider(
    color: AppColors.aboutUserDarkBorder,
    thickness: 0.5,
    height: 0,
  );
}