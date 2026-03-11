import 'package:flutter/material.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/modules/home/widgets/show_choose_icon_bottom_sheet.dart';
import 'package:habitly/app/modules/widgets/buttons/view_all_text_widget.dart';
import 'package:habitly/app/modules/widgets/texts/section_title.dart';

class ScreenSectionTitleAndActionWidget extends StatelessWidget {
  const ScreenSectionTitleAndActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SectionTitle(text: AppStrings.icon),

        ViewAllTextWidget(
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showChooseIconBottomSheet(context);
            });
          },
        ),
      ],
    );
  }
}
