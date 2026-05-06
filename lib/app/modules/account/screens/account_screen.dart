import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habitly/app/core/constants/app_constants.dart';

import '../../../core/constants/app_lists.dart';
import '../../widgets/appbar/appbar_title.dart';
import '../../widgets/appbar/leading_app_bar_image_widget.dart';
import '../widgets/account/account_section_title.dart';
import '../widgets/account/popup_item.dart';
import '../widgets/account/settings_group.dart';
import '../widgets/account/sign_out_tile.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(context), body: _bodyWidget(context));
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leadingWidth: 48,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const LeadingAppBarImageWidget(),
      title: AppbarTitle(title: strAccount),
      actions: [
        PopupMenuButton<String>(
          offset: const Offset(0, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.10),
          color: Theme.of(context).colorScheme.surface,
          icon: Container(
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
              case strShare:
                // Share.share('Check out my profile!');
                break;
              case strCopy:
                // Clipboard.setData(ClipboardData(text: userEmail));
                break;
              case strDelete:
                //_showDeleteDialog(context);
                break;
            }
          },
          itemBuilder: (context) => [
            popupItem(
              context,
              value: strShare,
              icon: Icons.share_rounded,
              label: strShareProfile,
              iconBg: const Color(0xFFEEF0FF),
              iconColor: const Color(0xFF6048BA),
            ),
            popupItem(
              context,
              value: strCopy,
              icon: Icons.copy_rounded,
              label: strCopyEmail,
              iconBg: const Color(0xFFE8F5E9),
              iconColor: const Color(0xFF388E3C),
            ),
            popupItem(
              context,
              value: strDelete,
              icon: Icons.delete_outline_rounded,
              label: strDeleteAccount,
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
          /// General Section
          AccountSectionTitle(title: strGeneral),
          SizedBox(height: 10.h),

          ///
          settingsGroup(context, AppLists.settingsList.sublist(0, 3)),
          SizedBox(height: 20.h),

          /// Privacy & Security
          AccountSectionTitle(title: strPrivacyAndSecurity),
          SizedBox(height: 10.h),

          ///
          settingsGroup(context, AppLists.settingsList.sublist(3)),
          SizedBox(height: 20.h),

          /// Sign out
          signOutTile(context),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}
