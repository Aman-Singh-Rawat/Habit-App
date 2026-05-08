import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitly/app/core/theme/app_colors.dart';
import 'package:habitly/app/core/values/app_values.dart';
import 'package:habitly/app/modules/account/controllers/personal_controller.dart';
import 'package:habitly/app/modules/widgets/dropdown/custom_dropdown.dart';
import 'package:habitly/app/modules/widgets/images/app_network_image.dart';
import 'package:habitly/app/modules/widgets/text_field/primary_text_field_and_label.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_lists.dart';
import '../../../core/constants/app_spacing.dart';
import '../../widgets/appbar/appbar_title.dart';
import '../../widgets/appbar/custom_appbar.dart';
import '../../widgets/texts/section_title.dart';
import '../widgets/personal-info/user_profile_widget.dart';

class PersonalInfo extends GetView<PersonalController> {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return _mainFunction();
  }

  SafeArea _mainFunction() {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppbar(title: AppbarTitle(title: strPersonalInfo)),
        body: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return ListView(
      children: [
        /// user profile
        UserProfileWidget().paddingOnly(top: height_12, bottom: height_25),

        /// full name field and label
        PrimaryTextFieldAndLabel(
          title: strFullName,
          controller: TextEditingController(),
        ),

        /// email field and label
        PrimaryTextFieldAndLabel(
          title: strEmail,
          icon: CupertinoIcons.mail,
          controller: TextEditingController(),
        ).paddingSymmetric(vertical: AppSpacing.lg),

        /// number field and label
        PrimaryTextFieldAndLabel(
          title: strPhoneNumber,
          controller: TextEditingController(),
        ),

        /// gender
        PrimaryTextFieldAndLabel(
          title: strPhoneNumber,
          controller: TextEditingController(),
        ).paddingSymmetric(vertical: AppSpacing.lg),

        SectionTitle(text: strGender),

        SizedBox(height: AppSpacing.sm),

        Obx(
          () => CustomDropdown<String>(
            hintText: strSelect,
            value: controller.selectGender.value.isEmpty
                ? null
                : controller.selectGender.value,
            items: AppLists.genderOptions.map((selectedType) {
              return DropdownItem<String>(
                value: selectedType,
                child: Text(selectedType),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                controller.selectGender.value = value ?? '';
              }
            },
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: width_20);
  }
}
