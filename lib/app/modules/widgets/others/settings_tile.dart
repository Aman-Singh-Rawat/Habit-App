import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitly/app/modules/widgets/texts/settings_title.dart';

import '../../../core/utils/helpers/helper_function.dart';
import '../../../core/values/app_values.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String? trailingText;
  final VoidCallback onClick;

  const SettingsTile({
    super.key,
    required this.title,
    this.trailingText,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .max,
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      children: [
        /// title
        Expanded(child: SettingsTitle(title: title)),

        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClick,
          child: Row(
            mainAxisSize: .min,
            crossAxisAlignment: .center,
            children: [
              if (trailingText != null) ...[
                Text(
                  trailingText!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontSize: font_13),
                ),

                SizedBox(width: width_16),
              ],

              Icon(
                Icons.arrow_forward_ios_rounded,
                size: width_17,
                color: AHelperFunction.isDarkMode(context)
                    ? Colors.grey.shade400
                    : Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
