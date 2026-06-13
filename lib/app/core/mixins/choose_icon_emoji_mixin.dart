import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../constants/app_constants.dart';
import '../constants/emoji_icon_data.dart';
import '../utils/toasts.dart';

/// ================== X CHOOSE ICON [bottomSheet] X ==================

mixin ChooseIconEmojiMixin {
  /// [CHOOSE ICON TAB CONTROLLER]
  late final chooseIconTabController;

  /// icon selected index
  final RxInt iconSelectedIndex = (-1).obs;
  final RxInt emojiSelectedIndex = (-1).obs;

  /// icon view all tab controller
  final RxInt selectedIconTabIndex = (0).obs;


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
      AppToast.info(context, strPleaseSelectAnIconOrEmoji);
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
}
