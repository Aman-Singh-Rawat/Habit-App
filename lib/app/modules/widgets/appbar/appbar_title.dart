import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  final String title;

  const AppbarTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
      ),
    );
  }
}
