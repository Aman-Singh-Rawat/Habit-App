import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitly/app/core/values/app_values.dart';

class DecoratedTextTitle extends StatelessWidget {
  final String title;

  const DecoratedTextTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        fontSize: font_11,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: Colors.grey,
      ),
    );
  }
}
