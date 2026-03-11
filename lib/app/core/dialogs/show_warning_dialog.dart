import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:iconsax/iconsax.dart';

import '../../modules/widgets/buttons/custom_elevated_button.dart';
import '../constants/app_spacing.dart';
import '../constants/app_strings.dart';
import '../extensions/secondary_button_text.dart';

Future<bool?> showWarningDialog({
  required BuildContext context,
  required String title,
  required String message,
  String confirmText = strConfirm,
  String cancelText = strCancel,
}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.containerBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Iconsax.warning_2, color:AppColors.dangerColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        content: Text(message, style: const TextStyle(height: 1.4)),
        actions: [
          SizedBox(
            width: 100.w,
            height: 42.h,
            child: CustomElevatedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)
              ),
              buttonText: AppStrings.skip,
              onClick: () => Navigator.pop(context, false),
              textColor: context.secondaryButtonTextColor,
              backgroundColor: context.secondaryBackgroundColor,
            ),
          ),
          SizedBox(width: AppSpacing.xs),
          SizedBox(
            width: 100.w,
            height: 42.h,
            child: CustomElevatedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)
              ),
              buttonText: AppStrings.continueText,
              onClick: () => Navigator.pop(context, true),
            ),
          ),
        ],
      );
    },
  );
}
