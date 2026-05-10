import 'package:flutter/cupertino.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';

import '../../../core/extensions/secondary_button_text.dart';
import 'custom_elevated_button.dart';

class ActionButtonsRow extends StatelessWidget {
  final String primaryText;
  final VoidCallback primaryOnTap;

  final String secondaryText;
  final VoidCallback secondaryOnTap;

  const ActionButtonsRow({
    super.key,
    required this.primaryText,
    required this.primaryOnTap,
    required this.secondaryText,
    required this.secondaryOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            buttonText: secondaryText,
            onClick: secondaryOnTap,
            textColor: context.secondaryButtonTextColor,
            backgroundColor: context.secondaryBackgroundColor,
          ),
        ),

        AppGaps.betweenRowBtnGap,

        Expanded(
          child: CustomElevatedButton(
            buttonText: primaryText,
            onClick: primaryOnTap,
          ),
        ),
      ],
    );
  }
}