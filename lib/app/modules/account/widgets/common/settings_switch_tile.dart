import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:habitly/app/modules/widgets/switch/custom_cupertino_switch.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../widgets/texts/settings_title.dart';

class SettingsSwitchTile extends StatelessWidget {
  final Function(bool) onChanged;
  final bool isSelected;
  final String title;

  const SettingsSwitchTile({
    super.key,
    required this.title,
    required this.onChanged,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SettingsTitle(title: title)),
        CustomCupertinoSwitch(
          value: isSelected,
          onChanged: onChanged,
        )
      ],
    );
  }
}
