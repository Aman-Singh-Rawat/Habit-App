import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String buttonText;
  final VoidCallback onPressed;
  final Color? iconColor;
  const SocialButton({
    super.key,
    this.iconColor,
    required this.iconPath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = AHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.containerBackgroundColor
              : Colors.transparent,
          border: Border.all(
            color: isDarkMode
                ? AppColors.darkSecondaryColor
                : AppColors.borderColor,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.contain,
                  width: 22,
                  height: 22,
                  colorFilter: iconColor != null
                      ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                      : null,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode
                            ? AppColors.white
                            : AppColors.textDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
