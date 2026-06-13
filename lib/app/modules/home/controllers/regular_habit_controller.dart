import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:habitly/app/core/mixins/choose_color_mixin.dart';
import 'package:habitly/app/core/mixins/choose_icon_emoji_mixin.dart';
import 'package:habitly/app/core/mixins/remainder_mixin.dart';
import 'package:habitly/app/core/mixins/repeat_type_mixin.dart';
import 'package:habitly/app/core/mixins/when_mixin.dart';
import 'package:habitly/app/core/utils/app_enums.dart';
import 'package:habitly/app/core/utils/toasts.dart';
import 'package:habitly/app/modules/home/models/one_time_task.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_lists.dart';
import '../../../core/constants/emoji_icon_data.dart';
import '../../../core/mixins/end_habit_mixin.dart';
import '../../../core/utils/helpers/DateClass.dart';
import '../../../core/utils/helpers/date_time_picker_helper.dart';
import '../../../data/local/local_storage.dart';
import '../../my_habits/controllers/my_habits_controller.dart';
import '../models/regular_habit.dart';
import 'home_controller.dart';

class RegularHabitController extends GetxController
    with
        GetTickerProviderStateMixin,
        RepeatTypeMixin,
        ChooseColorMixin,
        ChooseIconEmojiMixin,
        EndHabitMixin,
        RemainderMixin,
        WhenOneTimeTaskMixin {
  /// ================================================ X [CLASS_INSTANCE] X ================================================
  static RegularHabitController get instance =>
      Get.find<RegularHabitController>();

  /// ================================================ X [VARIABLES] X ================================================

  /// controllers
  final habitController = TextEditingController();

  /// [Create NEW HABIT TAB CONTROLLER]
  late final createNewHabitParentTabController;

  /// ================================================ X [OBSERVABLES] X ================================================

  /// create new habit tab controller
  final RxInt createNewHabitParentTabIndex = (0).obs;

  /// DO IT AT
  Rx<int> regularDoItAtIndex = 0.obs;
  Rx<int> taskDoItAtIndex = 0.obs;

  /// ================================================ X [GET-X METHODS] X ================================================

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

    endHabitDatePickerController.text = getEndHabitPlaceholder;

    /// first time the how many days will be 7 in repeat widget
    repeatSelectedPerWeekValue.value = 7;

    /// if [isOnTheseDayCheckboxSelected] is selected means user selected all day so weekly will be choose all day
    ever(isOnTheseDayCheckboxSelected, (callback) {
      if (callback) {
        repeatSelectedPerWeekValue.value = 7;

        /// this is for daily days if 7 days a week chosen then remove all elements from monthly
        clearMonthlySelection();
        clearMonthlySelection();
      }
    });
  }

  /// X ================================================ X [CLASS_METHODS] X ================================================ X

  /// -------------------- [Validation] --------------------
  bool _validateRegularHabit(BuildContext context) {
    /// -- Habit name validation
    if (habitController.text.trim().isEmpty) {
      AppToast.warning(context, strPleaseEnterHabitName);
      return false;
    }

    /// -- Repeat validation
    if (isNoRepeatSelected) {
      AppToast.warning(context, strPleaseSelectHabitDay);
      return false;
    }

    /// -- End date validation
    if (isEndDateMissing) {
      AppToast.warning(context, strPleaseSelectEndDate);
      return false;
    }

    /// -- Reminder validation
    if (regularReminder.isTimeMissing &&
        regularReminder.controller.text == strPleaseSelectReminderTime) {
      AppToast.warning(context, strReminderIsWaitingForATime);
      return false;
    }

    return true;
  }

  bool _validateOneTimeTask(BuildContext context) {
    /// -- Habit name validation
    if (habitController.text.trim().isEmpty) {
      AppToast.warning(context, strYourTaskNeedsAName);
      return false;
    }

    if (whenSelectedDate.value == null) {
      AppToast.warning(context, strDontForgetToChooseADate);
      return false;
    }

    /// -- Reminder validation
    if (oneTimeReminder.isTimeMissing &&
        oneTimeReminder.controller.text == strPleaseSelectReminderTime) {
      AppToast.warning(context, strReminderIsWaitingForATime);
      return false;
    }

    return true;
  }

  /// -------------------- Save Habit --------------------
  void onRegularHabitSave(BuildContext context) async {
    /// -- Validating first
    if (!_validateRegularHabit(context)) return;

    /// TODO: fix id
    final regularHabit = RegularHabit(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: habitController.text,
      icon: selectedEmojiOrIcon,
      color: selectedColor.value.toARGB32().toRadixString(16).padLeft(8, '0'),
      repeatType: repeatType,
      repeatDays: getRepeatDays,
      doItAt: DoItAtEnum.values[regularDoItAtIndex.value].name,
      endDate: isEndHabitOn.value ? endHabitSelectedDate.value : null,
      reminderHour: regularReminder.hour,
      reminderMinute: regularReminder.minute,
    );

    debugPrint("debugging:: ${regularHabit.toString()}");
    await LocalStorage.instance.addRegularHabit(regularHabit);

    if (Get.isRegistered<HomeController>()) {
      HomeController.instance.loadHabits();
      MyHabitsController.instance.loadData();
    }
    Get.back();
    Toasts.successToast(msg: strSuccessfullyHabitAdded);
  }

  void onOneTimeTaskSave(BuildContext context) async {
    if (!_validateOneTimeTask(context)) return;

    /// TODO: fix id
    final oneTimeTask = OneTimeTask(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: habitController.text,
      icon: selectedEmojiOrIcon,
      color: selectedColor.value.toARGB32().toRadixString(16).padLeft(8, '0'),
      doItAt: DoItAtEnum.values[taskDoItAtIndex.value].name,
      scheduledDate: whenSelectedDate.value!,
      reminderHour: regularReminder.hour,
      reminderMinute: regularReminder.minute,
    );

    debugPrint("debugging:: ${oneTimeTask.toString()}");
    await LocalStorage.instance.addOneTimeTask(oneTimeTask);

    if (Get.isRegistered<HomeController>()) {
      HomeController.instance.loadHabits();
      MyHabitsController.instance.loadData();
    }
    Get.back();
    Toasts.successToast(msg: strSuccessfullyHabitAdded);
  }

  void onSave(BuildContext context) {
    createNewHabitParentTabIndex.value == 0
        ? onRegularHabitSave(context)
        : onOneTimeTaskSave(context);
  }
}
