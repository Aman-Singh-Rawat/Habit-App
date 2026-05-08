import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/values/app_values.dart';

class AccountSectionTrailingIcon extends StatelessWidget {
  final double? iconSize;

  const AccountSectionTrailingIcon({super.key, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_rounded,
      size: iconSize ?? width_14,
      color: Theme
          .of(context)
          .colorScheme
          .onSurface
          .withOpacity(0.4),
    );
  }
}