import 'package:flutter/material.dart';

class UserSetupStepText extends StatelessWidget {
  final int currentStep;
  const UserSetupStepText({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$currentStep / 8",
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 16),
    );
  }
}
