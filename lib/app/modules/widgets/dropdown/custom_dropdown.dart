import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:habitly/app/core/utils/helpers/helper_function.dart';

import '../../../core/theme/app_colors.dart';

class CustomDropdown<T> extends StatefulWidget {
  final T? value;
  final List<DropdownItem<T>> items;
  final Function(T?) onChanged;
  final String hintText;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = '',
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AHelperFunction.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? AppColors.containerBackgroundColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isDarkMode
            ? null
            : Border.all(
                color: _isDropdownOpen ? AppColors.white : AppColors.grey,
              ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          valueListenable: ValueNotifier<T?>(widget.value),
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(color: AppColors.textGrey),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.moodDarkEmptyIconColor,
              size: 18,
            ),
            openMenuIcon: Icon(
              Icons.keyboard_arrow_up,
              color: AppColors.moodDarkEmptyIconColor,
              size: 18,
            ),
          ),
          buttonStyleData: ButtonStyleData(height: 44),
          dropdownStyleData: DropdownStyleData(
            elevation: 0,
            maxHeight: 252,
            offset: const Offset(0, -10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
            ),
          ),
          alignment: AlignmentDirectional.centerStart,
          menuItemStyleData: MenuItemStyleData(
            selectedMenuItemBuilder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: child,
              );
            },
          ),
          onChanged: widget.onChanged,
          items: widget.items,
          onMenuStateChange: (isOpen) {
            setState(() {
              _isDropdownOpen = isOpen;
            });
          },
        ),
      ),
    );
  }
}
