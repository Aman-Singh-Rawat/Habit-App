import 'package:flutter/cupertino.dart';
import 'package:habitly/app/modules/home/widgets/create_new_habit/selected_preview.dart';

import '../show_choose_icon_bottom_sheet.dart';
import 'empty_preview.dart';

class PreviewBox extends StatelessWidget {
  const PreviewBox({required this.selected});

  final String? selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showChooseIconBottomSheet(context),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: selected == null
            ? const EmptyPreview()
            : SelectedPreview(emoji: selected!),
      ),
    );
  }
}