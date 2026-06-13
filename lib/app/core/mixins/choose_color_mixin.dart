import 'dart:developer' as Get;
import 'dart:ui';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../constants/app_lists.dart';


/// ================== X [COLOR_SECTION] X ==================
mixin ChooseColorMixin {
  ///initially we assuming the first color is selected
  final Rx<Color> selectedColor = AppLists.habitlyColors[0].obs;
  final Rx<int> selectedColorIndex = (0).obs;
  final RxBool isColorPickerSelected = false.obs;
  final Rx<Color> lastSelectedColor = AppLists.habitlyColors[0].obs;


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
}
