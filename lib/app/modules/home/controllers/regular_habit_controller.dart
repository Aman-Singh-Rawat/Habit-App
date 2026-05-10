import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habitly/app/core/utils/toasts.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_lists.dart';
import '../../../core/constants/emoji_icon_data.dart';

class RegularHabitController extends GetxController
    with GetTickerProviderStateMixin {
  /// class instance
  static RegularHabitController get instance =>
      Get.find<RegularHabitController>();

  /// ================================================ X VARIABLES X ================================================

  /// controllers
  final habitController = TextEditingController();

  /// [Create NEW HABIT TAB CONTROLLER]
  late final createNewHabitParentTabController;

  /// [CHOOSE ICON TAB CONTROLLER]
  late final chooseIconTabController;

  /// ================================================ X OBSERVABLES X ================================================

  /// create new habit tab controller
  final RxInt createNewHabitParentTabIndex = (0).obs;

  /// icon view all tab controller
  final RxInt selectedIconTabIndex = (0).obs;

  /// icon selected index
  final RxInt iconSelectedIndex = (-1).obs;
  final RxInt emojiSelectedIndex = (-1).obs;

  /// color section [SELECTED_COLOR] ==> initially we assuming the first color is selected
  Rx<Color> selectedColor = AppLists.habitlyColors[0].obs;
  Rx<int> selectedColorIndex = (0).obs;
  final RxBool isColorPickerSelected = false.obs;
  final Rx<Color> lastSelectedColor = AppLists.habitlyColors[0].obs;

  /// ================================================ X GET-X METHODS X ================================================

  @override
  void onInit() {
    super.onInit();

    createNewHabitParentTabController = TabController(length: 2, vsync: this);
    chooseIconTabController = TabController(length: 2, vsync: this);

    /// CREATE NEW HABIT controller
    createNewHabitParentTabController.addListener(() {
      if (!createNewHabitParentTabController.indexIsChanging) {
        createNewHabitParentTabIndex.value =
            createNewHabitParentTabController.index;
      }
    });

    /// BOTTOM  SHEET  controller
    chooseIconTabController.addListener(() {
      if (!chooseIconTabController.indexIsChanging) {
        selectedIconTabIndex.value = chooseIconTabController.index;
      }
    });
  }

  /// X ================================================ X FUNCTIONS X ================================================ X

  /// ================== X CHOOSE ICON [bottomSheet] X ==================
  void onIconSelected(int index) {
    if (iconSelectedIndex.value == index) {
      iconSelectedIndex.value = -1;
    } else {
      emojiSelectedIndex.value = -1;
      iconSelectedIndex.value = index;
    }
  }

  void onEmojiSelected(int index) {
    if (emojiSelectedIndex.value == index) {
      emojiSelectedIndex.value = -1;
    } else {
      iconSelectedIndex.value = -1;
      emojiSelectedIndex.value = index;
    }
  }

  void onChooseIconCancelClick() {
    iconSelectedIndex.value = -1;
    emojiSelectedIndex.value = -1;
    Get.back(result: false);
  }

  void onChooseIconOkClick(BuildContext context) {
    if (iconSelectedIndex.value == -1 && emojiSelectedIndex.value == -1) {
      AppToast.show(
        context,
        message: strPleaseSelectAnIconOrEmoji,
        type: .info,
      );
      return;
    }
    Get.back(result: true);
  }

  void onChooseIconBottomSheetClose(value) {
    if (value == null || value == false) {
      iconSelectedIndex.value = emojiSelectedIndex.value = -1;
      selectedIconTabIndex.value = chooseIconTabController.index = 0;
    }
  }

  String? get selectedEmojiOrIcon {
    if (iconSelectedIndex.value != -1) {
      return EmojiList.icons[iconSelectedIndex.value].emoji;
    }

    if (emojiSelectedIndex.value != -1) {
      return EmojiList.smileysAndEmotion[emojiSelectedIndex.value].emoji;
    }

    return null;
  }

  /// ================== X [CLOSE] X ==================

  /// ================== X [COLOR_SECTION] X ==================
  void onColorSelected(int index) {
    if (AppLists.habitlyColors[index] != lastSelectedColor.value) {
      lastSelectedColor.value = AppLists.habitlyColors[index];
    }

    if (index < AppLists.habitlyColors.length) {
      selectedColor.value = AppLists.habitlyColors[index];
      selectedColorIndex.value = index;
      isColorPickerSelected.value = false;
    }
  }

  void onColorChanged(Color color) {
    selectedColor.value = color;
  }

  void onColorPickerDialogClose(value) {
    if (value == null || value == false) {
      isColorPickerSelected.value = false;
      selectedColor.value = AppLists.habitlyColors[0];
    } else {
      isColorPickerSelected.value = true;
      selectedColorIndex.value = 14;
    }

    Get.log(
      "debugging:: onColorPickerDialogClose:: $value & the color is:: ${selectedColor.value}",
    );
  }

/// ================== X [CLOSE] X ==================

/// ================== X [CREATE_NEW_HABIT_FUNCTION] X ==================
  void onSave() {

  }

}
