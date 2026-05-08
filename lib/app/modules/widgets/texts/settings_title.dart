import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/values/app_values.dart';

class SettingsTitle extends StatelessWidget {
  final String title;

  const SettingsTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.labelLarge!.copyWith(fontSize: font_16),
    );
  }
}
