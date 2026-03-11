import 'package:flutter/cupertino.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/extensions/textfield_color_theme.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final Color? color;
  const SectionTitle({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.textFieldTitleStyle.copyWith(
        color: color ?? context.textFieldLabelColor,
      ),
    );
  }
}
