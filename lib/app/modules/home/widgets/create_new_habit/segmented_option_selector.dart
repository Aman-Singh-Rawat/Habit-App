import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/app_spacing.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class SegmentedOptionSelector extends StatelessWidget {
  final Widget widget;
  final String text;
  const SegmentedOptionSelector({
    super.key,
    required this.widget,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Repeat Section
        SectionTitle(text: text).paddingOnly(
          left: AppSpacing.bf,
          top: AppSpacing.xl,
          bottom: AppSpacing.md,
        ),

        widget,
      ],
    );
  }
}
