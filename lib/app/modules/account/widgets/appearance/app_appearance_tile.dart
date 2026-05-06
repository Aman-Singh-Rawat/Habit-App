import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helpers/helper_function.dart';
import '../../../../core/values/app_values.dart';

class AppAppearanceTile extends StatelessWidget {
  final String title;
  final String trailingText;
  final VoidCallback onClick;

  const AppAppearanceTile({
    super.key,
    required this.title,
    required this.trailingText,
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
        Expanded(
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(fontSize: font_16),
          ),
        ),

        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClick,
          child: Row(
            mainAxisSize: .min,
            crossAxisAlignment: .center,
            children: [
              Text(
                trailingText,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: font_13),
              ),

              SizedBox(width: width_16),

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
