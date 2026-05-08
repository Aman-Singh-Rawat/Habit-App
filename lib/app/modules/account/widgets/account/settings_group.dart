import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/constants/app_routes.dart';

import '../../../widgets/container/custom_card.dart';
import 'account_icon_widget.dart';
import 'account_section_label.dart';
import 'account_section_trailing_icon.dart';

class SettingsGroup extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const SettingsGroup({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;
          return _settingsTile(
            context,
            item,
            isLast: isLast,
            onClick: () => _handleNavigation(index),
          );
        }).toList(),
      ),
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.preference);
      case 1:
        Get.toNamed(AppRoutes.personalInfo);
      case 3:
        Get.toNamed(AppRoutes.appAppearance);
    }
  }

  Widget _settingsTile(
    BuildContext context,
    Map<String, dynamic> item, {
    bool isLast = false,
    required VoidCallback onClick,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onClick,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                AccountIconWidget(icon: item['icon']),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// label
                      AccountSectionLabel(title: item['title']),

                      /// subtitle
                      if (item['subtitle'] != null) ...[
                        SizedBox(height: 2.h),
                        Text(
                          item['subtitle'],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                /// trailing icon
                AccountSectionTrailingIcon(),
              ],
            ),
          ),
        ),
        if (!isLast)
          Divider(
            height: 0.5,
            thickness: 0.5,
            indent: 64.w,
            color: Theme.of(context).dividerColor.withOpacity(0.15),
          ),
      ],
    );
  }
}
