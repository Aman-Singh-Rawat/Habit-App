import 'package:flutter/material.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/constants/text_styles.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/widgets/clippers/top_concave_clipper.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const OnboardingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = AHelperFunction.isDarkMode(context);
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: TopConcaveClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkScaffoldBacgroundColor
                    : AppColors.white,
              ),
              padding: const EdgeInsets.only(
                left: 17,
                right: 17,
                top: 30,
                bottom: 60,
              ),
              child: Column(
                children: [
                  // onboarding title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.onboardingTitle.copyWith(
                      color: isDark ? AppColors.white : AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 15),
                  // subtitle
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.onboardingSubtitle.copyWith(
                      color: isDark
                          ? AppColors.darkSecondaryTextColor
                          : AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
