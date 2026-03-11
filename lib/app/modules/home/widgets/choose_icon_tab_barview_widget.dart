import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:habitly/app/core/constants/emoji_icon_data.dart';
import 'package:habitly/app/modules/home/controllers/create_new_habit_controller.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_child_widget.dart';
import 'package:habitly/app/modules/home/widgets/choose_icon_list.dart';

class ChooseIconTabBarViewWidget extends StatelessWidget {
  const ChooseIconTabBarViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateNewHabitController controller =
        CreateNewHabitController.instance;

    return SizedBox(
      height: Get.height * 0.5,
      child: TabBarView(
        controller: controller.chooseIconTabController,
        children: [
          /// Icons
          ChooseIconList(
            itemBuilder: (context, index) {
              return Obx(
                () => ChooseIconChildWidget(
                  onItemClick: () => controller.onIconSelected(index),
                  isSelected: controller.iconSelectedIndex.value == index,
                  item: EmojiList.icons[index].emoji,
                ),
              );
            },
            listLength: EmojiList.icons.length,
          ),

          /// Emoji
          ChooseIconList(
            listLength: EmojiList.smileysAndEmotion.length,
            itemBuilder: (context, index) {
              return Obx(
                () => ChooseIconChildWidget(
                  onItemClick: () => controller.onEmojiSelected(index),
                  isSelected: controller.emojiSelectedIndex.value == index,
                  item: EmojiList.smileysAndEmotion[index].emoji,
                ),
              );
            },
          ),
        ],
      ),
    ).paddingOnly(left: 16.w, right: 16.w, top: 20.h);
  }
}
