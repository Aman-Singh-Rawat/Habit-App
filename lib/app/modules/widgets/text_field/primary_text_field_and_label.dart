import 'package:flutter/material.dart';
import 'package:habitly/app/core/extensions/textfield_color_theme.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';
import 'package:iconsax/iconsax.dart';

class PrimaryTextFieldAndLabel extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController controller;
  final VoidCallback? onObscureClick;
  final String? Function(String?)? validator;

  const PrimaryTextFieldAndLabel({
    super.key,
    required this.title,
    this.icon,
    this.onObscureClick,
    required this.controller,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(text: title),

        SizedBox(height: AppSpacing.sm),
        // Text Field
        TextFormField(
          validator: validator,
          controller: controller,
          style: AppTextStyles.textFieldTextStyle.copyWith(
            color: context.textFieldTextColor,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            hint: Text(
              title,
              style: TextStyle(color: context.textFieldHintColor),
            ),

            prefixIcon: icon != null
                ? Icon(icon, size: 17, color: context.textFieldIconColor)
                : null,

            suffixIcon: onObscureClick != null
                ? InkWell(
                    onTap: onObscureClick,
                    child: Icon(
                      obscureText ? Iconsax.eye_slash : Iconsax.eye,
                      size: 18,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
