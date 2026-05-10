import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habitly/app/core/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/text_styles.dart';
import '../../../core/extensions/textfield_color_theme.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Iconsax.search_normal,
          color: context.textFieldHintColor,
        ),
        hint: Text(
          strSearchIcon,
          style: TextStyle(color: context.textFieldHintColor),
        ),
      ),
      style: AppTextStyles.textFieldTextStyle.copyWith(
        color: context.textFieldTextColor,
      ),
    );
  }
}
