import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_strings.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/modules/bottom_nav/controllers/main_controller.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      (AppStrings.home, Iconsax.home, Iconsax.home5),
      (
        AppStrings.moodStat,
        Icons.emoji_emotions_outlined,
        Icons.emoji_emotions_rounded,
      ),
      (AppStrings.report, Iconsax.chart_21, Iconsax.chart_15),
      (AppStrings.myHabits, Iconsax.element_3, Iconsax.element_3),
      (AppStrings.account, Iconsax.user4, Iconsax.user),
    ];

    return SafeArea(
      top: false,
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.bottomNavIndex.value,
            children: controller.pages,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              selectedItemColor: AppColors.primary,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              currentIndex: controller.bottomNavIndex.value,
              onTap: controller.bottomNavIndex.call,
              selectedLabelStyle: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(fontSize: 11.sp),
              unselectedLabelStyle: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(fontSize: 11.sp),
              items: List.generate(items.length, (index) {
                final item = items[index];
                final isActive = controller.bottomNavIndex.value == index;

                return BottomNavigationBarItem(
                  icon: Icon(isActive ? item.$3 : item.$2),
                  label: item.$1,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
