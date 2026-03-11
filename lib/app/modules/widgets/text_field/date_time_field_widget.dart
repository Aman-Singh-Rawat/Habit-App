import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';

class DateTimeFieldWidget extends StatelessWidget {
  const DateTimeFieldWidget({
    super.key,
    required this.controller,
    required this.onTap,
    required this.prefixIcon,
    required this.suffixIcon,
    this.validator,
  });

  final TextEditingController controller;
  final VoidCallback onTap;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      validator: validator,
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: AppColors.primary),
        suffixIcon: Icon(suffixIcon, color: AppColors.white),
      ),
    );
  }
}
