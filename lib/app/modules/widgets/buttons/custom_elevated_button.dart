import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/constants/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.buttonText,
    this.onClick,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.primary,
    this.shape,
  });

  final Color textColor;
  final Color backgroundColor;
  final String buttonText;
  final VoidCallback? onClick;
  final RoundedRectangleBorder? shape;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: shape,
      ),
      child: Text(
        buttonText,
        style: AppTextStyles.buttonStyle.copyWith(color: textColor),
      ),
    );
  }
}
