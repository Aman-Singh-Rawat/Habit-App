import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:habitly/app/core/constants/app_lists.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';
import 'package:habitly/app/modules/home/controllers/home_controller.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    final bool isDarkMode = AHelperFunction.isDarkMode(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: AppLists.dayTimeTabs.asMap().entries.map((item) {
            final bool isSelected = controller.isDaytimeSelected(item.key);

            return GestureDetector(
              onTap: () => controller.onDayTimeChanged(item.key),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                margin: EdgeInsets.only(
                  left: item.key == 0 ? 20.w : 10.w,
                  right: item.key == AppLists.dayTimeTabs.length - 1
                      ? 20.w
                      : 0.w,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.w,
                    color: isSelected
                        ? Colors.transparent
                        : isDarkMode
                        ? AppColors.aboutUserDarkBorder
                        : AppColors.unprogressColor,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  color: isSelected ? AppColors.primary : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    item.value,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
