import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../widgets/container/custom_card.dart';
import 'account_icon_widget.dart';
import 'account_section_label.dart';
import 'account_section_trailing_icon.dart';

Widget signOutTile(BuildContext context) {
  return CustomCard(
    child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            /// icon widget
            AccountIconWidget(
              iconBg: AppColors.primary.withOpacity(0.12),
              iconColor: AppColors.redColor,
              icon: Icons.logout_rounded,
            ),
            SizedBox(width: 14.w),

            /// label
            Expanded(
              child: AccountSectionLabel(
                title: strSignOut,
                color: AppColors.redColor,
              ),
            ),

            /// trailing icon
            AccountSectionTrailingIcon(),
          ],
        ),
      ),
    ),
  );
}