import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/modules/widgets/container/custom_card.dart';

import '../../core/constants/app_lists.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/appbar/leading_app_bar_image_widget.dart';

PopupMenuItem<String> _popupItem(
  BuildContext context, {
  required String value,
  required IconData icon,
  required String label,
  required Color iconBg,
  required Color iconColor,
  bool isDestructive = false,
}) {
  return PopupMenuItem(
    value: value,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    child: Row(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: Icon(icon, size: 15.w, color: iconColor),
        ),
        SizedBox(width: 11.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 13.5.sp,
            fontWeight: FontWeight.w600,
            color: isDestructive ? const Color(0xFFC62828) : AppColors.textDark,
          ),
        ),
      ],
    ),
  );
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _bodyWidget(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leadingWidth: 48,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const LeadingAppBarImageWidget(),
      title: Text(
        AppStrings.account,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          offset: const Offset(0, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.10),
          color: Theme.of(context).colorScheme.surface,
          icon:  Container(
            margin: EdgeInsets.only(right: 12.w),
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: Theme.of(context).dividerColor.withOpacity(0.15),
                width: 0.5,
              ),
            ),
            child: const Icon(Icons.more_vert_rounded, size: 18),
          ),
          onSelected: (value) {
            switch (value) {
              case 'share':
                // Share.share('Check out my profile!');
                break;
              case 'copy':
                // Clipboard.setData(ClipboardData(text: userEmail));
                break;
              case 'delete':
                //_showDeleteDialog(context);
                break;
            }
          },
          itemBuilder: (context) => [
            _popupItem(
              context,
              value: 'share',
              icon: Icons.share_rounded,
              label: 'Share profile',
              iconBg: const Color(0xFFEEF0FF),
              iconColor: const Color(0xFF6048BA),
            ),
            _popupItem(
              context,
              value: 'copy',
              icon: Icons.copy_rounded,
              label: 'Copy email',
              iconBg: const Color(0xFFE8F5E9),
              iconColor: const Color(0xFF388E3C),
            ),
            _popupItem(
              context,
              value: 'delete',
              icon: Icons.delete_outline_rounded,
              label: 'Delete account',
              iconBg: const Color(0xFFFFEBEE),
              iconColor: const Color(0xFFC62828),
              isDestructive: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          _sectionLabel(context, 'General'),
          SizedBox(height: 10.h),
          _settingsGroup(context, AppLists.settingsList.sublist(0, 3)),
          SizedBox(height: 20.h),
          _sectionLabel(context, 'Privacy & Security'),
          SizedBox(height: 10.h),
          _settingsGroup(context, AppLists.settingsList.sublist(3)),
          SizedBox(height: 20.h),
          _signOutTile(context),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }


  Widget _sectionLabel(BuildContext context, String label) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _settingsGroup(
    BuildContext context,
    List<Map<String, dynamic>> items,
  ) {
    return CustomCard(

      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;
          return _settingsTile(context, item, isLast: isLast);
        }).toList(),
      ),
    );
  }

  Widget _settingsTile(
    BuildContext context,
    Map<String, dynamic> item, {
    bool isLast = false,
  }) {
    final Color iconBg = item['iconBg'] ?? const Color(0xFFE6F1FB);
    final Color iconColor = item['iconColor'] ?? const Color(0xFF185FA5);

    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: isLast
              ? BorderRadius.vertical(bottom: Radius.circular(14.r))
              : BorderRadius.zero,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                Container(
                  width: 34.w,
                  height: 34.w,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(item['icon'], size: 17.w, color: iconColor),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
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
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13.w,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.4),
                ),
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

  Widget _signOutTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.15),
          width: 0.5,
        ),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Container(
                width: 34.w,
                height: 34.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFCEBEB),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  size: 17,
                  color: Color(0xFFA32D2D),
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Text(
                  'Sign out',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFA32D2D),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 13.w,
                color: const Color(0xFFA32D2D).withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
