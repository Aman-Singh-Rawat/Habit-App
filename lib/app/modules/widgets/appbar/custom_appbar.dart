import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLeading;
  final Widget? title;
  final List<Widget>? actions;
  final VoidCallback? onBack;

  const CustomAppbar({
    super.key,
    this.showLeading = true,
    this.title,
    this.actions,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showLeading
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: onBack ?? () => Navigator.pop(context),
            )
          : null,
      title: title,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
