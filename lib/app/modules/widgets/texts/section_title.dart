import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/extensions/textfield_color_theme.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final Color? color;
  final bool isRequired;

  const SectionTitle({
    super.key,
    required this.text,
    this.color,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextStyles.textFieldTitleStyle.copyWith(
            color: color ?? context.textFieldLabelColor,
          ),
        ),
        if (isRequired)
          const SectionTitle(text: ' *', color: Colors.redAccent),
      ],
    );
  }
}
