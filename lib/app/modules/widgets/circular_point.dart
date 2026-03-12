import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/extensions/onboarding_texts.dart';

class CircularPoint extends StatelessWidget {
  final double size;

  const CircularPoint({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: context.onboardingTitleColor,
        shape: BoxShape.circle,
      ),
    );
  }
}