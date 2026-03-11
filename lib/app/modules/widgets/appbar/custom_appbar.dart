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
      leading: showLeading
          ? IconButton(
              icon: const Icon(Iconsax.arrow_left),
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
