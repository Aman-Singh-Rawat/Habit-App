import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

import '../../../core/utils/helpers/helper_function.dart';
import '../../../core/values/app_values.dart';
import '../custom_drag_handle_widget.dart';

void showCalendarBottomSheet({
  required BuildContext context,
  required Widget child,
  double? height,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius_28),
        topRight: Radius.circular(radius_28),
      ),
    ),
    builder: (context) {
      return SizedBox(
        height: height ?? MediaQuery.sizeOf(context).height * 0.6,
        child: Container(
          decoration: AHelperFunction.getBottomSheetDecoration(context),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Drag handle
                CustomDragHandleWidget(),

                Expanded(child: child),
              ],
            ).paddingSymmetric(horizontal: width_16, vertical: height_10),
          ),
        ),
      );
    },
  );
}
