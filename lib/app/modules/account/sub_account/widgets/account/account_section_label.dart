import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountSectionLabel extends StatelessWidget {
  final String title;
  final Color? color;

  const AccountSectionLabel({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color ?? Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
