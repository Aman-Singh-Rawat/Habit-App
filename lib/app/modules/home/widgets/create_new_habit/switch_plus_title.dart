import 'package:flutter/material.dart';
import 'package:habitly/app/modules/widgets/switch/custom_cupertino_switch.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class SwitchPlusTitle extends StatelessWidget {
  final bool isSelected;
  final String title;
  final Function(bool value) onChanged;
  const SwitchPlusTitle({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SectionTitle(text: title),

        CustomCupertinoSwitch(value: isSelected, onChanged: onChanged),
      ],
    );
  }
}
